<?php
class Idea extends ActiveRecord {
	// ActiveRecord configuration
	static public $tableName = 'ideas'; // the name of this model's table
	
	// controllers will use these values to figure out what templates to use
	static public $singularNoun = 'idea'; // a singular noun for this model's object
	static public $pluralNoun = 'ideas'; // a plural noun for this model's object

	// gets combined with all the extended layers
	static public $fields = array(
		'ContextClass' => array(
			'type' => 'enum'
			,'values' => array('App', 'Event')
		)
		,'ContextID' => 'uint'
		,'Title'
		,'Handle' => array(
			'unique' => true
		)
		,'Description' => 'clob'
		,'OwnerName' => array(
			'notnull' => false
		)
	);
	
	static public $relationships = array(
		'Context' => array(
			'type' => 'context-parent'
		)
		,'Votes' => array(
			'type' => 'one-many'
			,'class' => 'IdeaVote'
		)
	);
	
	public function validate()
	{
		// call parent
		parent::validate();
		
		HandleBehavior::onValidate($this, $this->_validator);
		
		$this->_validator->validate(array(
			'field' => 'Title'
			,'minlength' => 2
			,'required' => true
		));
		
		$this->_validator->validate(array(
			'field' => 'Description'
			,'type' => 'string_multiline'
			,'required' => true
		));

		// save results
		return $this->finishValidation();
	}
	
	static public function getByHandle($handle)
	{
		return static::getByField('Handle', $handle);
	}
	
	public function save($deep = true)
	{
		HandleBehavior::onSave($this);
	
		parent::save($deep);
	}
	
	public function getVotesCount()
	{
		return IdeaVote::getCount(array(
			'IdeaID' => $this->ID
			,'Status' => 'Active'
		));
	}
	
	public function getVotesCountByUser(User $User = null)
	{
		if (!$User) {
			$User = $GLOBALS['Session']->Person;
		}
		
		return IdeaVote::getCount(array(
			'IdeaID' => $this->ID
			,'Status' => 'Active'
			,'CreatorID' => $User->ID
		));
	}
}
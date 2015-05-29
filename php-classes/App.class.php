<?php

class App extends VersionedRecord
{
	// VersionedRecord configuration
	static public $historyTable = 'history_apps'; // the name of this model's history table
	
	// ActiveRecord configuration
	static public $tableName = 'apps'; // the name of this model's table
	static public $collectionRoute = '/apps';
	
	// controllers will use these values to figure out what templates to use
	static public $singularNoun = 'app'; // a singular noun for this model's object
	static public $pluralNoun = 'apps'; // a plural noun for this model's object
	
	// gets combined with all the extended layers
	static public $fields = array(
		'Title'
		,'Handle' => array(
			'type' => 'string'
			,'unique' => true
		)
		,'Url' => array(
			'type' => 'string'
			,'notnull' => false
		)
		,'Description' => array(
			'type' => 'clob'
			,'notnull' => false
		)
		,'Maturity' => array(
			'type' => 'enum'
			,'values' => array('Concept','Preview','Mature')
			,'default' => 'Concept'
		)
		,'ThumbnailID' => array(
			'type' => 'uint'
			,'notnull' => false
		)
		,'Platform' => array(
			'type' => 'enum'
			,'values' => array('Web', 'Web - Responsive', 'Web - Touch App', 'iOS', 'Android', 'Mac OS X', 'Windows', 'Linux')
			,'notnull' => false	
		)		
		,'PublisherType' => array(
			'type' => 'enum'
			,'values' => array('Government', 'Business', 'Nonprofit', 'Citizens')
			,'notnull' => false	
		)		
	);
	
	static public $relationships = array(
		'Authors' => array(
			'type' => 'many-many'
			,'class' => 'Person'
			,'linkClass' => 'AppAuthors'
			,'linkForeign' => 'AuthorID'
		)
		,'Thumbnail' => array(
			'type' => 'one-one'
			,'class' => 'Media'
		)
        ,'Tags' => array(
        	'type' => 'many-many'
        	,'class' => 'Tag'
        	,'linkClass' => 'TagItem'
        	,'linkLocal' => 'ContextID'
        	,'conditions' => array('Link.ContextClass = "App"')
        )
	);
	
	public function save($deep = true)
	{
		HandleBehavior::onSave($this);
	
		parent::save($deep);
	}
	
	public function validate()
	{
		parent::validate();
		
		HandleBehavior::onValidate($this, $this->_validator);
		
		$this->_validator->validate(array(
			'field' => 'Title'
			,'minlength' => 2
		));
		
		$this->_validator->validate(array(
			'field' => 'Url'
			,'validator' => 'url'
		));
		
		return $this->finishValidation();
	}
}
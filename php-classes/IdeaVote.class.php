<?php
class IdeaVote extends ActiveRecord {
	// ActiveRecord configuration
	static public $tableName = 'idea_votes'; // the name of this model's table
	
	// controllers will use these values to figure out what templates to use
	static public $singularNoun = 'idea vote'; // a singular noun for this model's object
	static public $pluralNoun = 'idea votes'; // a plural noun for this model's object

	// gets combined with all the extended layers
	static public $fields = array(
		'IdeaID' => array(
			'type' => 'uint'
			,'index' => true
		)
		,'Status' => array(
			'type' => 'enum'
			,'values' => array('Active', 'Revoked')
			,'default' => 'Active'
		)
	);
	
	static public $relationships = array(
		'Idea' => array(
			'type' => 'one-one'
			,'class' => 'Idea'
		)
	);
	
	static public function getUserTotal(ActiveRecord $Context, User $User = null)
	{
		if (!$User) {
			$User = $GLOBALS['Session']->Person;
		}
		
        return DB::oneValue(
            'SELECT COUNT(*)'
            .' FROM `%s` IdeaVote'
            .' JOIN `%s` Idea ON (IdeaVote.IdeaID = Idea.ID)'
            .' WHERE IdeaVote.CreatorID = %u AND IdeaVote.Status = "Active" AND Idea.ContextClass = "%s" AND Idea.ContextID = %u'
            ,array(
                static::$tableName
                ,Idea::$tableName
                ,$User->ID
                ,$Context->getRootClass()
                ,$Context->ID
            )
        );
	}
}
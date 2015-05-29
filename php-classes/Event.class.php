<?php

class Event extends VersionedRecord
{
	static public $historyTable = 'history_events';
	
	// ActiveRecord configuration
	static public $tableName = 'events'; // the name of this model's table
	static public $collectionRoute = '/events';
	
	// controllers will use these values to figure out what templates to use
	static public $singularNoun = 'event'; // a singular noun for this model's object
	static public $pluralNoun = 'events'; // a plural noun for this model's object

	// gets combined with all the extended layers
	static public $fields = array(
		'Title'
		,'Handle' => array(
			'unique' => true	
		)
		,'StartTime' => 'timestamp'
		,'EndTime' => 'timestamp'
		,'LocationName' => array(
			'type' => 'string'
			,'notnull' => false
		)
		,'LocationAddress' => array(
			'type' => 'string'
			,'notnull' => false
		)
        ,'Summary' => array(
            'type' => 'string'
    		,'notnull' => false
        )
		,'Description' => array(
			'type' => 'clob'
			,'notnull' => false
		)
        ,'RegistrationURL' => array(
            'type' => 'string'
            ,'notnull' => false
        )
        ,'RegistrationFee' => array(
            'type' => 'decimal'
            ,'length' => '5,2'
            ,'unsigned' => true
            ,'notnull' => false
        )
        ,'RegistrationPerks' => array(
            'type' => 'list'
            ,'notnull' => false
        )
        ,'RSVPFeed' => array(
            'type' => 'string'
            ,'notnull' => false
        )
	);
	
	static public $relationships = array(
		'Ideas' => array(
			'type' => 'context-children'
			,'class' => 'Idea'
			,'order' => array('ID' => 'DESC')
		)
	);
	
	public static function getNext()
	{
		return static::getByWhere('EndTime > CURRENT_TIMESTAMP', array('order' => 'StartTime'));
	}
    
    public static function getAllUpcoming()
    {
        return static::getAllByWhere('EndTime > CURRENT_TIMESTAMP', array('order' => 'StartTime'));
    }
    
    public static function getAllRecent($limit = 5)
    {
        return static::getAllByWhere('EndTime <= CURRENT_TIMESTAMP', array('order' => array('StartTime' => 'DESC'), 'limit' => $limit));
    }
}
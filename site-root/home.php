<?php

$conditions = array();

// apply tag filter
if (!empty($_REQUEST['tag'])) {
	// get tag
	if (!$Tag = Tag::getByHandle($_REQUEST['tag'])) {
		return static::throwNotFoundError('Tag not found');
	}
	
	$conditions[] = 'ID IN (SELECT ContextID FROM tag_items WHERE TagID = '.$Tag->ID.' AND ContextClass = "App")';
}

RequestHandler::respond('home', array(
	'apps' => App::getAllByWhere($conditions, array('order' => array('ID' => 'DESC')))	
));
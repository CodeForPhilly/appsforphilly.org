<?php

class EventsRequestHandler extends RecordsRequestHandler
{
	static public $maxVotesPerUser = 3;
	
	static public $recordClass = 'Event';

	static public function handleRecordRequest(ActiveRecord $Event, $action = false)
	{
		switch($action ? $action : $action = static::shiftPath())
		{
			case 'ideas':
			{
				return static::handleIdeasRequest($Event);
			}
		
			default:
			{
				return parent::handleRecordRequest($Event, $action);
			}
		}
	}
	
	static public function handleIdeasRequest(Event $Event)
	{
		switch ($action = static::shiftPath())
		{
			case '!submit':
				return static::handleSubmitIdeaRequest($Event);
			case '':
			case false:
				return static::respond('eventIdeas', array('data' => $Event->Ideas, 'Event' => $Event));
			default:
				if (!($Idea = Idea::getByHandle($action))) {
					return static::throwNotFoundError('Idea not found');
				}
				
				return static::handleIdeaRequest($Event, $Idea);
		}
	}
	
	static public function handleSubmitIdeaRequest(Event $Event)
	{
		$GLOBALS['Session']->requireAuthentication();
		
		$Idea = Idea::create(array(
			'Context' => $Event
		));
			
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			
			$Idea->setFields($_POST);
			
			if ($Idea->validate()) {
				$Idea->save();
				Site::redirect("/events/$Event->Handle");
			}
		}
		
		return static::respond('submit-idea', array(
			'Event' => $Event
			,'data' => $Idea
		));
	}
	
	static public function handleIdeaRequest(Event $Event, Idea $Idea)
	{	
		$action = static::shiftPath();
		
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$GLOBALS['Session']->requireAuthentication();
			if ($action == 'vote') {
				// check current votes
				if (IdeaVote::getUserTotal($Event) >= static::$maxVotesPerUser) {
					return static::throwError('You have already cast the maximum of '.static::$maxVotesPerUser.', please remove a vote from another idea to assign it here');
				}
				
				$Vote = IdeaVote::create(array(
					'Idea' => $Idea
				), true);
				
				Site::redirect("/events/{$Event->Handle}");
			} elseif ($action == 'unvote') {
				$Vote = IdeaVote::getByWhere(array(
					'IdeaID' => $Idea->ID
					,'Status' => 'Active'
				));
				
				if (!$Vote) {
					return static::throwError('You don\'t have any votes for this idea to remove');
				}
				
				$Vote->Status = 'Revoked';
				$Vote->save();
				
				Site::redirect("/events/{$Event->Handle}");
			}
		}
		
		return static::respond('eventIdea', array(
			'data' => $Idea
			,'Event' => $Event
		));
	}
}
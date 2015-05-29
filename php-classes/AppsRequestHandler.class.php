<?php

class AppsRequestHandler extends RecordsRequestHandler
{
	static public $recordClass = 'App';
	static public $accountLevelWrite = 'User';
	static public $accountLevelBrowse = 'Staff';
	
	static protected function onBeforeRecordSaved(App $App, $requestData)
	{
		if(!empty($_FILES['Thumbnail']) && $_FILES['Thumbnail']['error'] == UPLOAD_ERR_OK) {
			$App->Thumbnail = Media::createFromUpload($_FILES['Thumbnail']['tmp_name'], array('Caption' => $App->Title));
		}
	}

	static public function onRecordSaved(App $App, $requestData)
	{
		// assign tags
		if(isset($requestData['tags']))
		{
			Tag::setTags($App, $requestData['tags']);
		}
	}
}
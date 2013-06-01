<?php

RequestHandler::respond('home', array(
	'apps' => App::getAll(array( 'order' => array('ID' => 'DESC') ))	
));
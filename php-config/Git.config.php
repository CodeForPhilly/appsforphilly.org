<?php

Git::$repositories['AppsForPhilly'] = array(
	'remote' => 'git@github.com:CfABrigadePhiladelphia/appsforphilly.org.git'
	,'originBranch' => 'master'
	,'workingBranch' => 'master'
	,'localOnly' => true
	,'trees' => array(
		'html-templates'
		,'php-classes'
		,'php-config'
		,'site-root'
	)
);
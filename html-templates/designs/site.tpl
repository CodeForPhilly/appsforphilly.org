<!DOCTYPE html>
{load_templates designs/site.templates.tpl}
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>{block "title"}Apps for Philly{/block}</title>
		
		{block meta}
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
			<meta name="description" content="Code for America Brigade for Philadelphia" />
		{/block}
		
		{block css}
			{*
				Compresses all CSS files into a single cached and version-signed request.
				Add ?css-debug=1 to any URL to load separate uncompressed files
			*}
			{cssmin apps4philly.css}
            {if $.User->hasAccountLevel('Staff')}
                {cssmin "features/content-editable.css"}
            {/if}
		{/block}

		{block js}
			<script type="text/javascript" src="//use.typekit.net/nhm2mqp.js"></script>
			<script type="text/javascript">try{ Typekit.load(); }catch(e){ }</script>
		{/block}
	</head>
	<body class="{block body-class}{/block}">
		<header class="header site clearfix">
			<div class="head">
				<div class="wrapper">
					<div class="logo-with-text">
						<a href="/" class="logo"><img src="/img/apps4philly_logo.png" alt="logo"></a>
						<span class="logo-text">{block "logo-text"}{/block}</span>
					</div>
					{block "header-text"}
						{$NextEvent = Event::getNext()}
						{if $NextEvent}
							<div class="upcoming sidebar">
								<a href="{$NextEvent->getUrl()}">
									<span class="label">Next Hackathon:</span>
									<span class="date">{format_timerange $NextEvent->StartTime $NextEvent->EndTime}</span>
									<span class="title">{$NextEvent->Title|escape}</span>
								</a>
							</div>
						{/if}
					{/block}
				</div>
			</div>
			
			{block "nav"}
				<nav class="site mobile-hidden">
					<div class="wrapper">
						<a href="" class="main">#apps4philly</a>       		
		    			{block navbar}
							<div class="nav nav-collapse collapse sidebar">
								<ul class="nav pull-right">
									{*<li><a href="/categories">Categories</a></li>*}
									{if $.User && $.responseId == 'home'}
										<li><a href="/apps/create">Add an App</a></li>
									{/if}

									{if $.User}
										{*<li><a href="/members/{$.User->Username}">{$.User->FirstName}</a></li>*}
										<li><a href="/logout">Log Out</a></li>
									{else}
										<li><a href="/login">Log In</a></li>
										<li><a href="/register">Sign Up</a></li>
									{/if}
								</ul>
							</div>
						{/block}
					</div>
		        </nav>
		
		       {* <div class="mobile-only nav-link-ct">
		        	<ul class="mobile">
		  
		          	</ul>
		        </div>
		
				<div class="tablet-only nav-link-ct">
		        	<div class="inner">
						<ul class="tablet">
		        		
		        		</ul>
		      			</div>
		        </div> *}
	        {/block}		
        
	        
			<div class="inner">
			
				{block "header"}
			        <section class="wrapper header"></section>
		        {/block}
		        
			</div>
		</header>


		<div class="inner content">
			<div class="wrapper">
			{block content}
				
				
			{/block}
			</div>
		</div>
		
		<div class="inner">
			{block footer}
				<footer>
					<div class="inner wrapper">
						<p>Built and maintained by <a href="http://codeforphilly.org">Code for Philly</a>.</p>
					</div>
				</footer>
			{/block}
		</div>

        {block "js-bottom"}
    		{*
				Compresses all JS files into a single cached and version-signed request.
				Add ?js-debug=1 to any URL to load separate uncompressed files
			*}
			{jsmin "jquery.js"}

        	{if $.Session->hasAccountLevel('Staff')}
                {jsmin "jquery.filedrop.js+markdown.js+features/content-editable.js"}
        	{/if}
        {/block}

		{block "js-analytics"}
			<script type="text/javascript">
			{if $.User}
				var clicky_custom = {
					session: {
						username: '{$.User->Username}'
						,email: '{$.User->Email}'
						,full_name: '{$.User->FullName}'
					}
				};
			{/if}
			
			var clicky_site_ids = clicky_site_ids || [];
			clicky_site_ids.push(100652961);
			(function() {
				var s = document.createElement('script');
				s.type = 'text/javascript';
				s.async = true;
				s.src = '//static.getclicky.com/js';
				( document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0] ).appendChild( s );
			})();
			</script>
			<noscript><p><img alt="Clicky" width="1" height="1" src="//in.getclicky.com/100652961ns.gif" /></p></noscript>
		{/block}

		{* enables site developers to dump the internal session log here by setting ?log_report=1 on any page *}
		{log_report}
	
	</body>
</html>

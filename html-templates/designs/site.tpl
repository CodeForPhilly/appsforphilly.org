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
			{cssmin "bootstrap.css+bootstrap-responsive.css+site.css+new.css"}
		{/block}

		{block js}
			{*
				Compresses all JS files into a single cached and version-signed request.
				Add ?js-debug=1 to any URL to load separate uncompressed files
			*}
			{jsmin "jquery.js+bootstrap/bootstrap-tooltip.js+bootstrap/*"}
		{/block}
	</head>
	<body>
		{block navbar}
			<section class="container">
				<figure class="logo">
					<a href="/"></a>
				</figure>
			</section>
			<section class="container">
				<div class="navbar navbar-inverse">
					<div class="navbar-inner">
						<div class="container">
							<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</a>
							<ul class="nav pull-left">
								<li><a href="#" class="google +" target="_blank"><span>Google +</span></a></li>							
								<li><a href="#" class="twitter" target="_blank"><span>Twitter</span></a></li>
								<li><a href="#" class="rss" target="_blank"><span>rss</span></a></li>					
							</ul>
							<a class="brand" href="/">Apps For Philly</a>
							<div class="nav-collapse collapse">
								<ul class="nav pull-right">
									<li><a href="/">Home</a></li>
									{*<li><a href="/categories">Categories</a></li>*}
									{if $.User}
										<li><a href="/apps/create">Add an App</a></li>
									{/if}

									{if $.User}
										{*<li><a href="/members/{$.User->Username}">{$.User->FirstName}</a></li>*}
										<li><a href="/logout">Logout</a></li>
									{else}
										<li><a href="/login">Login</a></li>
										<li><a href="/register">Sign Up</a></li>
									{/if}
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>
		{/block}

		{block content}{/block}

		{block footer}
			<div class="container">
				<hr />
				<footer>
					<p>Built and maintained by <a href="http://appsforphilly.org">Apps for Philly</a>.</p>
				</footer>
			</div>
		{/block}
	</body>
</html>
		{foreach item=App from=$apps}
		
//*	<article class="app">
		

		
					<h2><a href="#{$App->Handle}" name="{$App->Handle}">{$App->Title|escape}</a></h2>
		
					{if $App->Description}
						{if $App->Thumbnail}
							<img src="{$App->Thumbnail->getThumbnailRequest(200, 200, 'EEEEEE')}" width="200" height="200">
						{/if}	
						<p>{$App->Description}</p>
					{/if}
					<dl>
						<dt>Maturity</dt>
						<dd>{$App->Maturrity}</dd>
		
						<dt>Platform</dt>
						<dd>{$App->Platform}</dd>
		
						<dt>Published by</dt>
						<dd>{$App->Publisher}</dd>
		
						{if $App->Url}
							<dt>URL</dt>
							<dd><a href="{$App->Url|escape}">{$App->Url|escape}</a></dd>
						{/if}
		
						{if $.Session->hasAccountLevel('Staff')}
							<dt>Administration</dt>
							<dd>
								<a href="/apps/{$App->Handle}/edit">Edit App</a>
								/
								 <a href="/apps/{$App->Handle}/delete">Delete App</a>
							</dt>
						{/if}
					</dl>
		
				</article>
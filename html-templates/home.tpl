{extends designs/site.tpl}

{block content}
		<div class="main">
			<h1 class="heading" bi:title="t1" bi:titleflag="t1">
				Most Recent Apps
	   		 </h1>
	   		 <div class="copy">
				{foreach item=App from=$apps}
					<article class="app-listing">
						<h4><a href="/apps/{$App->Handle}" name="{$App->Handle}">{$App->Title|escape}</a></h4>
			
						{if $App->Description}
							{if $App->Thumbnail}
								<img src="{$App->Thumbnail->getThumbnailRequest(200, 200)}" height="200">
							{/if}	
							<p>{$App->Description}</p>
						{/if}

						<dl>
							{if $App->Maturity}
								<div>
									<dt>Maturity:</dt>
									<dd>{$App->Maturity}</dd>
								</div>
							{/if}
							{if $App->Platform}
								<div>
									<dt>Platform:</dt>
									<dd>{$App->Platform}</dd>
								</div>
							{/if}
							{if $App->Publisher}
								<div>
									<dt>Published by:</dt>
									<dd>{$App->Publisher}</dd>
								</div>
							{/if}
							{if $App->Url}
    							<div>
    								<dt>URL:</dt>
    								<dd><a href="{$App->Url|escape}">{$App->Url|escape}</a></dd>
    							</div>
							{/if}
							{if $App->Tags}
							    <div>
    								<dt>Tags:</dt>
    								<dd>
    									{foreach item=Tag from=$App->Tags implode=", "}
    										<a href="/?tag={$Tag->Handle}">{$Tag->Title|escape}</a>
    									{/foreach}
    								</dd>
							    </div>
							{/if}
						</dl>

						{if $.Session->hasAccountLevel('Staff')}
							<div class="admin-tools">
    							<a href="/apps/{$App->Handle}/edit">Edit App</a>
    							/
                                <a href="/apps/{$App->Handle}/delete">Delete App</a>
							</div>
						{/if}
					</article>
				{/foreach}
			</div>
		</div>
		
		
		<aside class="sidebar">
            {$upcomingEvents = Event::getAllUpcoming()}
            {if count($upcomingEvents)}
			<div class="component">
				<h1>Upcoming Hackathons</h1>
				<ul class="list">
					<li><h3>Have an idea for an app? Attend a Hackathon to get your thoughts out there and rolling!</h3></li>
                    {foreach item=Event from=$upcomingEvents}
					<li>
						<h3>{$Event->Title|escape}</h3>
                        {if $Event->Summary}
                            {$Event->Summary|markdown|escape}
                        {/if}
						<div class="location">
							<h6>
                                {if $Event->LocationName}{$Event->LocationName|escape}<br>{/if}
                                {if $Event->LocationAddress}{$Event->LocationAddress|trim|nl2br}<br>{/if}
								{format_timerange $Event->StartTime $Event->EndTime forceYear=yes}
							</h6>
						</div>
						<a href="{$Event->getURL()}" class="button">Learn More</a>
					</li>
                    {/foreach}
				</ul>
			</div>
			{/if}
			<div class="component">
				<h1>Recent Hackathons</h1>
				<ul class="menu">
                    {foreach item=Event from=Event::getAllRecent()}
					    <li><a href="{$Event->getURL()}">{$Event->Title|escape}</a></li>
                    {/foreach}
					<li><a href="http://appsforsepta.org">Apps for SEPTA 2012 & 2011</a></li>
				</ul>
			</div>

			<div class="component">
				<h1>App Categories</h1>
				<ul class="menu">
					{foreach item=Tag from=Tag::getTop()}
						<li><a href="/?tag={$Tag->Handle}">{$Tag->Title}</a></li>
					{/foreach}
				</ul>
			</div>
		
		</aside>
	
{/block}
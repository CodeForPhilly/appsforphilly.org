{extends designs/site.tpl}

{block "logo-text"}
    {preg_replace('/^Apps\s+for\s+Philly\s+/i', '', $data->Title)escape}
{/block}

{block content}
	{$Event = $data}

    <article class="event main">
        <dl class="event-info">
            <div>
                <dt>When:</dt>
                <dd><p>{format_timerange $Event->StartTime $Event->EndTime}</p></dd>
            </div>
            {$locationLines = array_filter(array($Event->LocationName, $Event->LocationAddress))}
            {if count($locationLines)}
            <div>
                <dt>Where:</dt>
                <dd>
                    <p>{$locationLines|join:"<br>"}</p>
                </dd>
            </div>
            {/if}
            {if $Event->RegistrationFee}
            <div>
                <dt>Cost:</dt>
                <dd>
                    <h5>{money $Event->RegistrationFee avoidDecimal=yes}</h5>
                    {if $Event->RegistrationPerks}
                        <ul>
                            {foreach item=perk from=$Event->RegistrationPerks}
                                <li>{$perk|escape}</li>
                            {/foreach}
                        </ul>
                    {/if}
                </dd>
            </div>
            {if $Event->RegistrationURL}
                <a href="{$Event->RegistrationURL|escape}" target="_blank" class="button">Register</a>
            {/if}
        </dl>
    	<div class="event-description content-editable" {if $.User->hasAccountLevel('Staff')}data-content-endpoint="/events" data-content-id="{$Event->Handle}" data-content-field="Description" data-content-value="{$Event->Description|escape}" data-content-renderer="markdown"{/if}>
    		{$Event->Description|markdown}
    	</div>
    </article>

	<aside class="sidebar">
		<section id="project-ideas">
			<h1>Project Ideas <a href="/events/{$Event->Handle}/ideas/!submit" class="small-btn">Submit an Idea</a></h1>
            <p>Everyone has 3 votes to distribute as they like among favorite project ideas</p>
			<ul class="list">
				{foreach item=Idea from=$Event->Ideas}
					<li class="post">
						<div class="votes">
							<div class="vote-count">Votes: {$Idea->getVotesCount()}</div>
							<form method="POST" action="/events/{$Event->Handle}/ideas/{$Idea->Handle}/vote">
								<input type="submit" value="+">
							</form>
							{if $Idea->getVotesCountByUser() > 0}
								<form method="POST" action="/events/{$Event->Handle}/ideas/{$Idea->Handle}/unvote">
									<input type="submit" value="-">
								</form>
							{/if}
						</div>
						<header>
							<a href="/events/{$Event->Handle}/ideas/{$Idea->Handle}">{$Idea->Title|escape}</a>
						</header>
						<div class="item-body">
						    {$Idea->Description|truncate:175}
						</div>
						<footer>
							Submitted by: {if $Idea->OwnerName}{$Idea->OwnerName|escape}{else}{userLink $Idea->Creator}{/if}
						</footer>
					</li>
				{/foreach}
			</ul>
		</section>

        {if $Event->RSVPFeed}
            {$rsvpData = RemoteJSON::getCachedData($Event->RSVPFeed)}
        	{if $rsvpData.results}
        		<section id="attendees">
        			<h1>Attendees</h1>
        			<ul class="list attendees">
        				{foreach item=rsvp from=$rsvpData.results}
    						<li>
    							<a href="http://www.meetup.com/Code-for-America-Philly/members/{$rsvp.member.member_id}/">
    								{if $rsvp.member_photo.thumb_link}
    									<div class="photo">
    										<img src="{$rsvp.member_photo.thumb_link|escape}">
    									</div>
    								{/if}
    								<span class="name">{$rsvp.member.name}</span>
    							</a>
    						</li>
        				{/foreach}
        			</ul>
        		</section>
    		{/if}
        {/if}
	</aside>
	
{/block}
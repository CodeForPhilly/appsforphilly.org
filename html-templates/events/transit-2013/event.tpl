{extends designs/site.tpl}

{block "logo-text"}
	<h2 class="event-logo transit">Transit</h2>					
{/block}



{block content}
	{$Event = $data}

	<article class="main event">
	 	<div class="intro">
   		 	<p>Apps for Philly Transit is a <i><a href="http://www.codeforamerica.org/2013/06/07/defining-civic-hacking/">civic hackathon</a></i> that aims to bring together transportation organizations and citizens of Philadelphia to rapidly conceive, design, and prototype uses of open data relating to transportation in Philly. Following the <a href="http://technical.ly/philly/2011/10/10/apps-for-septa-hackathon-features-new-data-sources-and-mass-transit-projects-video/">Apps for SEPTA 2011</a> and <a href="http://technical.ly/philly/2012/08/21/apps-for-septa-vaguerouter-an-interactive-transit-planner-takes-first-place/">Apps for SEPTA 2012</a> hackathons, we hope to bring new open data releases from a variety of transportation organizations to the table to be mixed and mashed with the <a href="http://www3.septa.org/hackathon/">trove of data and APIs already released by SEPTA</a>.</p>
			<p><a href="http://www.meetup.com/Code-for-America-Philly/events/136363492/#event-desc">Read more</a></p>
		</div>
   		 
   		 <h1>Schedule</h1>
   		 <section>
	   		 <dl class="event-info">
	   		 	<div>
	   		 		<dt>When:</dt>
	   		 		<dd><p>Friday, Sept 20, 2013 - Sunday, Sept 22, 2013</p></dd>
	   		 	</div>
	   		 	<div>
	   		 		<dt>Where:</dt>
	   		 		<dd>
	   		 			<p>3rd Ward <br>1227 N 4th St. Philadelphia, PA</p>
	   		 		</dd>
	   		 	</div>
	   		 	<div>
	   		 		<dt>Cost:</dt>
	   		 		<dd>
		   		 		<h5>$10</h5>
		   		 		<ul>
		   		 			<li>registration</li>
		   		 			<li>t-shirt</li>
		   		 			<li>meals</li>
		   		 		</ul>
	   		 		</dd>
	   		 	</div>
	   		 	<a href="http://www.meetup.com/Code-for-America-Philly/events/136363492/" target="_blank" class="button">Register</a>
	   		 </dl>
	   		 <div class="day">
   		 		<h3>Friday 6:30pm - 9:00pm</h3>
   		 		<p><i>Idea Reception</i></p>
   		 		<p>No registration is required for this Friday evening gathering of minds. Beer and sticky notes will be provided for sharing, adding to, and voting for ideas for projects that can be prototyped over the weekend hackathon. If you've got an idea or are just curious about civic hacking but can't hang out all weekend, this is the event for you. Hackathon participants should come to the reception too but if you can't make it -- no worries -- just show up for the start of the hackathon Saturday morning.</p>
   		 		<a href="http://www.meetup.com/Code-for-America-Philly/events/136607262/" target="_blank">RSVP here for the idea reciption</a>
	   		 </div>
	   		 <div class="day">
	   		 	<h3>Saturday 10:00am - midnight</h3>
	   		 	<p><i>Hackathon</i></p>
	   		 	<ul>
	   		 		<li><span>9am</span> - Doors open with coffee and breakfast available</li>
	   		 		<li><span>10am</span> - Opening remarks and team formation kicked off</li>
	   		 		<li><span>11am</span> - You should be designing by now</li>
	   		 		<li><span>Midnight</span> - Time to commit & quit. You can keep working from home but you can't stay at 3rd ward</li>
	   		 	</ul>
	   		 </div>
	   		 <div class="day">
	   		 	<h3>Sunday 10am - 5pm</h3>
	   		 	<p><i>Hackathon and Prototype Demos</i></p>
	   		 	<ul>
		   		 	<li><span>9am</span> - Doors open with coffee and berakfast available</li>
		   		 	<li><span>10am</span> - Opening remarks</li>
		   		 	<li><span>4pm</span> - Demos begin</li>
	   		 	</ul>
	   		 </div>
	   		 <div class="day">
	   		 	<h3>Beyond the Prototype</h3>
	   		 	<p>On a date to be announced later (approximately 1 month following the hackathon) we will hold showcase session at SEPTA's center city HQ for demoing any new apps that are ready for the public. Participation in the hackathon will not be required as long as your project is free for public use or open source. Hackathon teams should take advantage of Code for Philly's weekly workshops to meet and continue work on their project to ready it for public release. <a href="http://technical.ly/philly/2011/11/21/septa-developer-showcase-puts-realtime-schedule-apps-on-display-for-transit-agency-officials/"></a>Check out coverage of the showcase that followed the first Apps for SEPTA hackathon.</p>
	   		 	<p>We're also hoping to see many transit apps at Technically Philly's end-of-year event: <a href="http://www.meetup.com/Technically-Philly/events/131501002/">Civic Hacks of 2013 Demo Night</a>.</p>
	   		 </div>
	   		 
   		 </section>
   		 
   		 <h1>Sponsors</h1>
   		 <section>
   		 	<p>Can you join our sponsors list? Email <a href="mailto:calfano@codeforamerica.org">calfano@codeforamerica.org</a>.</p>	
   		 	<div class="sponsors">
   		 		<div class="col">
	   		 		<a href="http://jarv.us" class="sponsor-logo"><img src="/img/sponsors/jarvus_logo.png" alt="jarvus_logo"></a>
	   		 		<a href="http://septa.com" class="sponsor-logo" target="_blank"><img src="/img/sponsors/septa_logo_round.png" alt="Septa"></a>
	   		 		<a href="http://chariotsolutions.com/" class="sponsor-logo" target="_blank"><img src="/img/sponsors/chariot_logo.png" alt="Chariot"></a>
	   		 		<a href="http://www.foodler.com/" class="sponsor-logo" target="_blank"><img src="/img/Foodler-Logo11-300x84.jpg" alt="Foodler-Logo" style="border-radius: 10px; border: 4px solid #fff;"></a>

   		 		</div>
   		 		<div class="col">
	   		 		<a href="http://sencha.com" class="sponsor-logo" target="_blank"><img src="/img/sponsors/sencha_logo_white.png" alt="Sencha"></a>
	   		 		<a href="http://www.azavea.com/" class="sponsor-logo" target="_blank"><img src="/img/sponsors/azavea.png" alt="Azavea"></a>
	   		 		<a href="http://www.phila.gov/Pages/default.aspx" class="sponsor-logo" target="_blank"><img src="/img/sponsors/philadelphia_logo.png" alt="philadelphia_logo" style="border-radius: 10px;"></a>

	   		 		<a href="http://codeforamerica.org" class="sponsor-logo" target="_blank"><img src="/img/sponsors/CfA_logo.png" alt="Code for America logo"></a>
   		 		</div>
   		 	</div>
   		 </section>
   		 
   		 <h1>Organizers</h1>
   		 <section class="sponsors organizers">
   		 	<li><a href="http://jarv.us"><img src="/img/sponsors/jarvus_logo.png" alt="Jarvus logo"></a></li>
   		 	<li><a href="http://codeforphilly.org"><img src="/img/sponsors/codeforphillylogo.png" alt="Code for Philly"></a></li>

   		 </section>
	</article>

	<aside class="sidebar">
		<section>
			<h1>App Ideas {*<a href="/events/{$Event->Handle}/ideas/!submit" class="small-btn">Submit an Idea</a>*}</h1>
			<ul class="list">
				{foreach item=Idea from=$Event->Ideas}
					<li class="post">
						<header>
							<a href="/events/{$Event->Handle}/ideas/{$Idea->Handle}">{$Idea->Title|escape}</a>
						</header>
						<span class="votes">
							<p>Votes: {$Idea->getVotesCount()}</p>
							{*<form method="POST" action="/events/{$Event->Handle}/ideas/{$Idea->Handle}/vote">
								<input type="submit" value="+">
							</form>
							{if $Idea->getVotesCountByUser() > 0}
								<form method="POST" action="/events/{$Event->Handle}/ideas/{$Idea->Handle}/unvote">
									<input type="submit" value="-">
								</form>
							{/if}*}
						</span>
						<footer>
							<p>Submitted by:</p> {if $Idea->OwnerName}{$Idea->OwnerName|escape}{else}{userLink $Idea->Creator}{/if}
						</footer>
					</li>
				{/foreach}
			</ul>
		</section>
		
		<section>
			<h1>Participating Transportation Organizations</h1>
			<ul class="menu">
				<li><a href="http://septa.org/" target="_blank">SEPTA</a></li>
				<li><a href="http://www.phl.org/" target="_blank">PHL Int'l Airport</a></li>
				<li><a href="http://www.bicyclecoalition.org/" target="_blank">Bicycle Coalition of Greater Philadelphia</a></li>
				<li><a href="http://www.centercityphila.org/" target="_blank">Center City District</a></li>
				<li><a href="http://www.dvrpc.org/" target="_blank">Delaware Valley Regional Planning Commission</a></li>
				<li><a href="http://philapark.org/" target="_blank">Philadelphia Parking Authority</a></li>
				{*
				<li><a href="" target="_blank">PHL Airport</a></li>
				<li><a href="" target="_blank">Amtrak</a></li>
				<li><a href="" target="_blank">PhillyCarShare</a></li>
				<li><a href="" target="_blank">Enterprise Car Share</a></li>
				<li><a href="" target="_blank">ZipCar</a></li>
				<li><a href="" target="_blank">New Jersey Transit</a></li>
				<li><a href="" target="_blank">Patco/Delaware River Port Authority</a></li>
				<li><a href="" target="_blank">Uber</a></li>
				<li><a href="" target="_blank">Boltbus/Grayhouse</a></li>
				*}
			</ul>
		</section>


        {if $Event->RSVPFeed}
            {$rsvpData = RemoteJSON::getCachedData($Event->RSVPFeed)}
    		{if $rsvpData.results}
        		<section>
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
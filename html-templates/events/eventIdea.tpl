{extends designs/site.tpl}

{block title}{$data->Title|escape} &mdash; {$dwoo.parent}{/block}

{block content}
	<div class="simple-page">
		{$Idea = $data}
	
		<h1>{$Idea->Title|escape}</h1>
	
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
	
		{if $Idea->Description}
			<p>{$Idea->Description|escape|markdown}</p>
		{/if}
	</div>
{/block}
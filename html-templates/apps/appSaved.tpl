{extends designs/site.tpl}

{block title}Saved {$data->Title|escape} &mdash; Apps &mdash; {$dwoo.parent}{/block}

{block content}
	<div class="simple-page">
	{$App = $data}

	{if $App->isNew}
		<p>Your app has been created: {appLink $App}</p>
	{else}
		<p>Your changes to {appLink $App} have been saved.</p>
	{/if}
	</div>
{/block}
{template personLink Person avatar=10}
	{if $avatar && $Person->PrimaryPhoto}
		<img src="{$Person->PrimaryPhoto->getThumbnailRequest($avatar, $avatar)}">
	{/if}

	<a href="/people/{$Person->Username}">{$Person->FullName|escape}</a>
{/template}

{template appLink App}
	<a href="/apps/{$App->Handle}">{$App->Title|escape}</a>
{/template}
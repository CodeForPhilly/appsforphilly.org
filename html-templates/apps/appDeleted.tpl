{extends designs/site.tpl}

{block title}Deleted {$data->Title|escape} &mdash; Apps &mdash; {$dwoo.parent}{/block}

{block content}
	{$App = $data}

	<p>Your app has been deleted!</p>
{/block}
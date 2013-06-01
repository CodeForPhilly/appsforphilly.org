{extends designs/site.tpl}

{block title}{if $data->isPhantom}Create{else}Edit {$data->Title|escape}{/if} &mdash; Apps &mdash; {$dwoo.parent}{/block}

{block css}
	{$dwoo.parent}
	<style>
		textarea[name=Description] {
			display: block;
			width: 40em;
			height: 4em;
		}
	</style>
{/block}

{block content}
	{$App = $data}
	{$appFields = App::$fields}

	<form method="POST" enctype="multipart/form-data">
		<p><label>Title: <input name="Title" value="{refill field=Title default=$App->Title}"></label></p>
		<p><label>URL: <input name="Url" value="{refill field=Url default=$App->Url}" placeholder="http://&hellip;"></label></p>
		<p>
			<label>
				Description (HTML OK):
				<textarea name="Description">{refill field=Description default=$App->Description}</textarea>
			</label>
		</p>
		<p>
			<label>
				Maturity:
				<select name="Maturity">
					{foreach item=value from=$appFields.Maturity.values}
						<option {refill field=Maturity default=$App->Maturity selected=$value}>{$value|escape}</option>
					{/foreach}
				</select>
			</label>
		</p>
		<p>
			<label>
				Platform:
				<select name="Platform">
					{foreach item=value from=$appFields.Platform.values}
						<option {refill field=Platform default=$App->Platform selected=$value}>{$value|escape}</option>
					{/foreach}
				</select>
			</label>
		</p>
		<p>
			<label>
				Published by:
				<select name="PublisherType">
					{foreach item=value from=$appFields.PublisherType.values}
						<option {refill field=PublisherType default=$App->PublisherType selected=$value}>{$value|escape}</option>
					{/foreach}
				</select>
			</label>
		</p>
		<p><label>Thumbnail: <input name="Thumbnail" type="file"></label></p>

		<input type="submit" value="{tif $App->isPhantom ? 'Create App' : 'Save Changes'}">
	</form>
{/block}
{extends designs/site.tpl}

{block title}{if $data->isPhantom}Create{else}Edit {$data->Title|escape}{/if} &mdash; Apps &mdash; {$dwoo.parent}{/block}

{block css}
	{$dwoo.parent}
	<style>
		textarea[name=Description] {
			display: block;
			width: 300px;
			height: 4em;
		}
	</style>
{/block}

{block content}
	<div class="simple-page">
	{$App = $data}

    <h2>
        {if $App->isPhantom}
            Create new app
        {else}
            Edit app <strong>{$App->Title|escape}
        {/if}
    </h2>

    {if !$App->isValid}
    <div class="error well">
        <strong>There were problems with your entry:</strong>
        <ul class="errors">
        {foreach item=error key=field from=$App->validationErrors}
            <li>{$error}</li>
        {/foreach}
        </ul>
    </div>
    {/if}

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
					{foreach item=value from=App::getFieldOptions('Maturity', 'values')}
						<option {refill field=Maturity default=$App->Maturity selected=$value}>{$value|escape}</option>
					{/foreach}
				</select>
			</label>
		</p>
		<p>
			<label>
				Platform:
				<select name="Platform">
					{foreach item=value from=App::getFieldOptions('Platform', 'values')}
						<option {refill field=Platform default=$App->Platform selected=$value}>{$value|escape}</option>
					{/foreach}
				</select>
			</label>
		</p>
		<p>
			<label>
				Published by:
				<select name="PublisherType">
					{foreach item=value from=App::getFieldOptions('PublisherType', 'values')}
						<option {refill field=PublisherType default=$App->PublisherType selected=$value}>{$value|escape}</option>
					{/foreach}
				</select>
			</label>
		</p>
		<p>
			<label>
				Tags:
				<input name="tags" placeholder="Transit, Crime" value="{refill field=tags default=Tag::getTagsString($App->Tags)}"/>
			</label>
		</p>
		<p><label>Thumbnail: <input name="Thumbnail" type="file"></label></p>

		<input type="submit" value="{tif $App->isPhantom ? 'Create App' : 'Save Changes'}">
	</form>
	</div>
{/block}
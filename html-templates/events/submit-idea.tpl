{extends designs/site.tpl}

{block content}
	<div class="simple-page">
		<h1>Submit an Idea</h1>
		{$Idea = $data}
	
		{if $Idea->validationErrors}
			{dump $Idea->validationErrors}
		{/if}
	
		<form method="POST">
			<p>
				<label>Title <input name="Title" value="{refill field=Title}"></label>
			</p>
			<p>
				<label>
					Description (<a href="http://daringfireball.net/projects/markdown/syntax">markdown</a> supported)
					<textarea name="Description">{refill field=Description}</textarea>
				</label>
			</p>
			<p>
				<label>
					Name of Idea's "Owner" (if it's not you)
					<input name="OwnerName" value="{refill field=OwnerName}" placeholder="Optional">
				</label>
			</p>
			<input type="submit" class="button">
		</form>
	</div>
{/block}
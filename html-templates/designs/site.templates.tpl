{load_templates "subtemplates/people.tpl"}"

{template tagLink tagData rootUrl}
	<a href="{$rootUrl}?tag={$tagData.Handle}">{$tagData.Title|regex_replace:'/^[^:]+:\s*/':''}{if $tagData.itemsCount} ({$tagData.itemsCount|number_format}){/if}</a>
{/template}

{template appLink App}
	<a href="/apps/{$App->Handle}">{$App->Title|escape}</a>
{/template}

{template userLink User avatar=no avatarSize=32}{strip}
<a href="/people/{$User->Username}">
	{if $avatar}
		{avatar $User size=$avatarSize}
	{/if}
	{$User->FullName}
</a>
{/strip}{/template}

{template comment Comment headingLevel=h5 showHeading=true showProject=false articleClass=""}
	<article class="comment {$articleClass}">
		{if $showHeading}
			<{$headingLevel}>
				{$Comment->Message}
			</{$headingLevel}>
		{/if}
		<blockquote>
			<small>Posted on {$Comment->Created|date_format:"%c"} by {userLink $Comment->Creator avatar=off}</small>
		</blockquote>
	</article>
{/template}

{template commentForm Context url=no}
	{if $.Session->Person}
		<form id="postCommentForm" action="{tif $url ? $url : cat('/' 'requests' '/' $Context->Handle '/comment')}" method="POST">
			<fieldset class="comment stretch">
				<div class="author"></div>
				
				<div class="message">
					<label for="Message">
						<span>{$.User->FullName}</span>
						<textarea id="Message" name="Message"></textarea>
					</label>
					
					<p class="hint">You can use <a href="http://daringfireball.net/projects/markdown/basics">Markdown</a> for formatting.</p>
	
					<input type="submit" class="submit" value="Post Comment">
				</div>
			</fieldset>		
		</form>
	{else}
		<p class="login-hint"><a href="/login?return=requests/{$Context->Handle}">Log in</a> to post a comment.</p>
	{/if}
{/template}

{template commentsList comments contextLinks=off}
	<div class="comments">
	{foreach item=Comment from=$comments}
		<div class="comment" id="comment-{$Comment->ID}">
			<div class="author">
				<a href="/members/{$Comment->Author->Username}">{avatar $Comment->Author size=16}</a>
			</div>
			<div class="message">
				<div class="message-body">{userLink $Comment->Author} {$Comment->Message|markdown}</div>
				<time>{$Comment->Created|date_format:'%c'}</time>
				{if $Comment->userCanWrite}
					{*<a href="/comments/{$Comment->ID}/edit" class="edit">Edit</a>*}
					<a href="/comments/{$Comment->ID}/delete" class="delete action-link">Delete</a>
				{/if}
			</div>
		</div>
	{foreachelse}
		<p class="nocomments">No comments have been posted yet.</p>		
	{/foreach}
	</div>
{/template}
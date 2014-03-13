<ul class="unstyled item-list">
	{foreach from=$aComments item=oComment name="cmt"}
		{assign var="oUser" value=$oComment->getUser()}
		{assign var="oTopic" value=$oComment->getTarget()}
		{assign var="oBlog" value=$oTopic->getBlog()}
		
		<li class="js-title-comment" title="{$oComment->getText()|strip_tags|trim|truncate:100:'...'|escape:'html'}">
			<a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(48)}" alt="{$oUser->getLogin()}" class="avatar" /></a>
			<p class="muted">
				<small>
					<a href="{$oUser->getUserWebPath()}" class="author">{$oUser->getLogin()}</a>
					<time datetime="{date_format date=$oComment->getDate() format='c'}">
						{date_format date=$oComment->getDate() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}
					</time>
				</small>
			</p>
			<a href="{if $oConfig->GetValue('module.comment.nested_per_page')}{router page='comments'}{else}{$oTopic->getUrl()}#comment{/if}{$oComment->getId()}" class="stream-topic">{$oTopic->getTitle()|escape:'html'}</a>
			<small class="text-error">{$oTopic->getCountComment()}</small>
		</li>
	{/foreach}
</ul>

<footer class="muted">
	<small>
		<a href="{router page='rss'}allcomments/" class="muted">RSS</a>
	</small>
</footer>

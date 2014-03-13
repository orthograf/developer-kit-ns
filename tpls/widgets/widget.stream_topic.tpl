<ul class="unstyled item-list">
	   {foreach $aTopics as $oTopic}
        {$oUser=$oTopic->getUser()}
        {$oBlog=$oTopic->getBlog()}
		
		<li class="js-title-topic" title="{$oTopic->getText()|strip_tags|trim|truncate:150:'...'|escape:'html'}">
			<a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(48)}" alt="{$oUser->getLogin()}" class="avatar" /></a>
			<p class="muted">
				<small>
					<a href="{$oUser->getUserWebPath()}" class="author">{$oUser->getLogin()}</a>
					<time datetime="{date_format date=$oTopic->getDate() format='c'}">{date_format date=$oTopic->getDateAdd() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}</time>
				</small>
			</p>
			<a href="{$oBlog->getUrlFull()}" class="text-success blog-name">{$oBlog->getTitle()|escape:'html'}</a> &rarr;
			<a href="{$oTopic->getUrl()}" class="stream-topic">{$oTopic->getTitle()|escape:'html'}</a>
			<small class="text-error">{$oTopic->getCountComment()}</small>
		</li>
	{/foreach}
</ul>

<footer class="muted">
	<small>
		<a href="{router page='rss'}new/" class="muted">RSS</a>
	</small>
</footer>

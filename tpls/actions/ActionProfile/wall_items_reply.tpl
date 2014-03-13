{foreach from=$aReplyWall item=oReplyWall}
	{assign var="oReplyUser" value=$oReplyWall->getUser()}
	<div id="wall-reply-item-{$oReplyWall->getId()}" class="js-wall-reply-item comment wall-comment-reply">
		<a href="{$oReplyUser->getUserWebPath()}"><img src="{$oReplyUser->getProfileAvatarPath(48)}" alt="{$oReplyUser->getLogin()}" class="comment-avatar" /></a>
		
		<small>
			<ul class="unstyled inline comment-info">
				<li class="comment-author"><a href="{$oReplyUser->getUserWebPath()}">{$oReplyUser->getLogin()}</a></li>
				<li class="muted comment-date"><time datetime="{date_format date=$oReplyWall->getDateAdd() format='c'}">{date_format date=$oReplyWall->getDateAdd() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}</time></li>
			</ul>
		</small>
		
		<div class="comment-content text">
			{$oReplyWall->getText()}
		</div>
		
		{if $oReplyWall->isAllowDelete()}
			<small>
				<ul class="unstyled inline comment-actions">
					<li><a href="#" onclick="return ls.wall.remove({$oReplyWall->getId()});" class="text-error link-dotted">{$aLang.wall_action_delete}</a></li>
				</ul>
			</small>
		{/if}
	</div>
{/foreach}

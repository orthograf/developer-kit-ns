{$oBlog=$oTopic->getBlog()}
{$oUser=$oTopic->getUser()}
{$oVote=$oTopic->getVote()}
{$oFavourite=$oTopic->getFavourite()}


	<footer class="topic-footer">
		<small>
			<ul class="muted unstyled inline topic-tags js-favourite-insert-after-form js-favourite-tags-topic-{$oTopic->getId()}">
				<li><span class="glyphicon glyphicon-tags"></span></li>
			
				{strip}
					{if $oTopic->getTagsArray()}
						{foreach from=$oTopic->getTagsArray() item=sTag name=tags_list}
							<li>{if !$smarty.foreach.tags_list.first}, {/if}<a rel="tag" href="{router page='tag'}{$sTag|escape:'url'}/" class="muted">{$sTag|escape:'html'}</a></li>
						{/foreach}
					{else}
						<li>{$aLang.topic_tags_empty}</li>
					{/if}
				
					{if $oUserCurrent}
						{if $oFavourite}
							{foreach from=$oFavourite->getTagsArray() item=sTag name=tags_list_user}
								<li class="topic-tags-user js-favourite-tag-user">, <a rel="tag" href="{$oUserCurrent->getUserWebPath()}favourites/topics/tag/{$sTag|escape:'url'}/" class="text-success">{$sTag|escape:'html'}</a></li>
							{/foreach}
						{/if}
					
						<li class="topic-tags-edit js-favourite-tag-edit" {if !$oFavourite}style="display:none;"{/if}>
							<a href="#" onclick="return ls.favourite.showEditTags({$oTopic->getId()},'topic',this);" class="text-warning link-dotted">{$aLang.favourite_form_tags_button_show}</a>
						</li>
					{/if}
				{/strip}
			</ul>
		</small>
		
		
		<div class="topic-share" id="topic_share_{$oTopic->getId()}">
			{hookb run="topic_share" topic=$oTopic bTopicList=$bTopicList}
				<div class="yashare-auto-init" data-yashareTitle="{$oTopic->getTitle()|escape:'html'}" data-yashareLink="{$oTopic->getUrl()}" data-yashareL10n="ru" data-yashareType="button" data-yashareQuickServices="yaru,vkontakte,facebook,twitter,odnoklassniki,moimir,lj,gplus"></div>
			{/hookb}
		</div>

		
		<small>
			<ul class="muted unstyled inline topic-info">
				<li class="topic-info-author">
					<a href="{$oUser->getProfileUrl()}"><img src="{$oUser->getAvatarUrl(24)}" alt="avatar" class="avatar"/></a>
					<a rel="author" href="{$oUser->getProfileUrl()}">{$oUser->getDisplayName()}</a>
				</li>
				<li class="topic-info-date">
					<time datetime="{date_format date=$oTopic->getDateAdd() format='c'}" title="{date_format date=$oTopic->getDateAdd() format='j F Y, H:i'}">
						{date_format date=$oTopic->getDateAdd() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}
					</time>
				</li>
				<li class="topic-info-favourite">
					<a href="#" onclick="return ls.favourite.toggle({$oTopic->getId()},this,'topic');" class="favourite {if $oUserCurrent && $oTopic->getIsFavourite()}active{/if}"><span class="glyphicon glyphicon-star-empty"></span></a>
					<span class="favourite-count" id="fav_count_topic_{$oTopic->getId()}">{$oTopic->getCountFavourite()}</span>
				</li>
				<li class="topic-info-share"><a href="#" class="glyphicon glyphicon-share-alt" title="{$aLang.topic_share}" onclick="jQuery('#topic_share_{$oTopic->getId()}').slideToggle(); return false;"></a></li>
			
				{if $bTopicList}
					<li class="topic-info-comments">
						{if $oTopic->getCountCommentNew()}
							<a href="{$oTopic->getUrl()}#comments" title="{$aLang.topic_comment_read}" class="text-success new">
								<span class="glyphicon glyphicon-comment icon-active"></span>
								<span>{$oTopic->getCountComment()}</span>
								<span class="count text-error">+{$oTopic->getCountCommentNew()}</span>
							</a>
						{elseif $oTopic->getCountComment()}
							<a href="{$oTopic->getUrl()}#comments" title="{$aLang.topic_comment_read}" class="text-success">
								<span class="glyphicon glyphicon-comment"></span>
								<span>{$oTopic->getCountComment()}</span>
							</a>
						{else}
							<a href="{$oTopic->getUrl()}#comments" title="{$aLang.topic_comment_read}" class="muted">
								<span class="glyphicon glyphicon-comment"></span>
								<span>{$oTopic->getCountComment()}</span>
							</a>
						{/if}
					</li>
				{/if}
			
				<li id="vote_area_topic_{$oTopic->getId()}" class="pull-right vote 
			{if $oVote OR (E::UserId() == $oTopic->getUserId()) OR strtotime($oTopic->getDateAdd()) < ($smarty.now-Config::Get('acl.vote.topic.limit_time'))}
																		{if $oTopic->getRating() > 0}
																			vote-count-positive
																		{elseif $oTopic->getRating() < 0}
																			vote-count-negative
																		{/if}
																	{/if}
																
																	{if $oVote} 
																		voted
																	
																		{if $oVote->getDirection() > 0}
																			voted-up
																		{elseif $oVote->getDirection() < 0}
																			voted-down
																		{/if}
																	{/if}">
					{if $oVote OR (E::UserId() == $oTopic->getUserId()) OR strtotime($oTopic->getDateAdd()) < ($smarty.now-Config::Get('acl.vote.topic.lim it_time'))}
						{assign var="bVoteInfoShow" value=true}
					{/if}
					<div class="vote-down" onclick="return ls.vote.vote({$oTopic->getId()},this,-1,'topic');"><span class="glyphicon glyphicon-thumbs-down"></span></div>
					<div class="vote-count {if $bVoteInfoShow}js-infobox-vote-topic{/if}" id="vote_total_topic_{$oTopic->getId()}" title="{$aLang.topic_vote_count}: {$oTopic->getCountVote()}">
						{if $bVoteInfoShow}
							{if $oTopic->getRating() > 0}+{/if}{$oTopic->getRating()}
						{else} 
							<a href="#" onclick="return ls.vote.vote({$oTopic->getId()},this,0,'topic');">?</a> 
						{/if}
					</div>
					<div class="vote-up" onclick="return ls.vote.vote({$oTopic->getId()},this,1,'topic');"><span class="glyphicon glyphicon-thumbs-up"></span></div>
					{if $bVoteInfoShow}
						<div id="vote-info-topic-{$oTopic->getId()}" style="display: none;">
							<ul class="unstyled vote-topic-info">								
								<li><span class="glyphicon glyphicon-thumbs-up"></span>{$oTopic->getCountVoteUp()}</li>
								<li><span class="glyphicon glyphicon-thumbs-down"></span>{$oTopic->getCountVoteDown()}</li>
								<li><span class="glyphicon glyphicon-eye-open"></span>{$oTopic->getCountVoteAbstain()}</li>
								{hook run='topic_show_vote_stats' topic=$oTopic}
							</ul>
						</div>
					{/if}
				</li>
			
				{hook run='topic_show_info' topic=$oTopic}
			</ul>
		</small>


		{if !$bTopicList}
			{hook run='topic_show_end' topic=$oTopic}
		{/if}
	</footer>
</article> <!-- /.topic -->

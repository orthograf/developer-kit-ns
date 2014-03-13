{extends file='_index.tpl'}

{block name="layout_content"}
    {$oUserOwner=$oBlog->getOwner()}
    {$oVote=$oBlog->getVote()}

<script type="text/javascript">
	jQuery(function($){
		ls.lang.load({lang_load name="blog_fold_info,blog_expand_info"});
	});
</script>

{if E::IsAdmin()}
	<div id="blog_delete_form" class="modal">
	
	<div class="modal-dialog">
        <div class="modal-content">
		
		<header class="modal-header">
			<button type="button" class="close jqmClose" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3>{$aLang.blog_admin_delete_title}</h3>
		</header>
		
			<div class="modal-body">
				<form action="{router page='blog'}delete/{$oBlog->getId()}/" method="POST" class="modal-content">
					<p><label for="topic_move_to">{$aLang.blog_admin_delete_move}:</label>
					<select name="topic_move_to" id="topic_move_to" class="input-block-level">
						<option value="-1">{$aLang.blog_delete_clear}</option>
						{if $aBlogs}
							<optgroup label="{$aLang.blogs}">
								{foreach from=$aBlogs item=oBlogDelete}
									<option value="{$oBlogDelete->getId()}">{$oBlogDelete->getTitle()|escape:'html'}</option>
								{/foreach}
							</optgroup>
						{/if}
					</select></p>
				
					<input type="hidden" value="{$ALTO_SECURITY_KEY}" name="security_ls_key" />
					<button type="submit" class="btn btn-primary">{$aLang.blog_delete}</button>
				</form>
			</div>
		</div>
		</div>
	</div>
{/if}


<div class="blog">
	<header class="blog-header">
		<small>
			<div id="vote_area_blog_{$oBlog->getId()}" class="vote {if $oBlog->getRating() > 0}vote-count-positive{elseif $oBlog->getRating() < 0}vote-count-negative{/if} {if $oVote} voted {if $oVote->getDirection()>0}voted-up{elseif $oVote->getDirection()<0}voted-down{/if}{/if}">
				<div class="muted vote-label">Рейтинг</div>
				<a href="#" class="muted vote-down" onclick="return ls.vote.vote({$oBlog->getId()},this,-1,'blog');"><span class="glyphicon glyphicon-thumbs-down"></span></i></a>
				<div id="vote_total_blog_{$oBlog->getId()}" class="vote-count count" title="{$aLang.blog_vote_count}: {$oBlog->getCountVote()}">{if $oBlog->getRating() > 0}+{/if}{$oBlog->getRating()}</div>
				<a href="#" class="muted vote-up" onclick="return ls.vote.vote({$oBlog->getId()},this,1,'blog');"><span class="glyphicon glyphicon-thumbs-up"></span></i></a>
			</div>
		</small>
		
		<img src="{$oBlog->getAvatarPath(64)}" class="avatar" />
		
		<h2>{$oBlog->getTitle()|escape:'html'}{if $oBlog->getType()=='close'} <i title="{$aLang.blog_closed}" class="icon icon-lock"></i>{/if}</h2>
		
		{if $oUserCurrent and ($oUserCurrent->getId()==$oBlog->getOwnerId() or $oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() )}
			<small>
				<ul class="unstyled inline actions">
					<li>
						<a href="{router page='blog'}edit/{$oBlog->getId()}/" title="{$aLang.blog_edit}" class="text-warning">{$aLang.blog_edit}</a></li>
						{if E::IsAdmin()}
							<li><a href="#" title="{$aLang.blog_delete}" id="blog_delete_show" class="text-error">{$aLang.blog_delete}</a>
						{else}
							<a href="{router page='blog'}delete/{$oBlog->getId()}/?security_ls_key={$ALTO_SECURITY_KEY}" title="{$aLang.blog_delete}" onclick="return confirm('{$aLang.blog_admin_delete_confirm}');" >{$aLang.blog_delete}</a>
						{/if}
					</li>
				</ul>
			</small>
		{/if}
	</header>
	
	
	<div class="blog-mini" id="blog-mini">
		<div class="row-fluid">
			<div class="span6">
				<small class="muted">
					<span id="blog_user_count_{$oBlog->getId()}">{$iCountBlogUsers}</span> {$iCountBlogUsers|declension:$aLang.reader_declension:'russian'},
					{$oBlog->getCountTopic()} {$oBlog->getCountTopic()|declension:$aLang.topic_declension:'russian'}
				</small>
			</div>
			<div class="span6 blog-mini-header">
				<small>
					<a href="#" class="link-dotted" onclick="ls.blog.toggleInfo(); return false;">{$aLang.blog_expand_info}</a>
					<a href="{router page='rss'}blog/{$oBlog->getUrl()}/">RSS</a>
				</small>
				{if $oUserCurrent and $oUserCurrent->getId()!=$oBlog->getOwnerId()}
					<button type="submit" class="btn btn-small {if $oBlog->getUserIsJoin()}active{/if}" id="button-blog-join-first-{$oBlog->getId()}" data-button-additional="button-blog-join-second-{$oBlog->getId()}" data-only-text="1" onclick="ls.blog.toggleJoin(this, {$oBlog->getId()}); return false;">{if $oBlog->getUserIsJoin()}{$aLang.blog_leave}{else}{$aLang.blog_join}{/if}</button>
				{/if}
			</div>
		</div>
	</div>
	
	
	<div class="blog-more-content" id="blog-more-content" style="display: none;">
		<div class="blog-content">
			<p class="blog-description">{$oBlog->getDescription()}</p>
		</div>
		
		<footer class="blog-footer">
			<small>
				{hook run='blog_info_begin' oBlog=$oBlog}
			
				<div class="row-fluid">
					<div class="span6">
						<dl class="dl-horizontal blog-info">
							<dt>{$aLang.infobox_blog_create}</dt>
							<dd>{date_format date=$oBlog->getDateAdd() format="j F Y"}</dd>
						
							<dt>{$aLang.infobox_blog_topics}</dt>
							<dd>{$oBlog->getCountTopic()}</dd>
						
							<dt><a href="{$oBlog->getUrlFull()}users/">{$aLang.infobox_blog_users}</a></dt>
							<dd>{$iCountBlogUsers}</dd>
						
							<dt>{$aLang.infobox_blog_rating}</dt>
							<dd class="text-success rating">{$oBlog->getRating()}</dd>
						</dl>
					</div>
			
					<div class="span6">
						<strong>{$aLang.blog_user_administrators} ({$iCountBlogAdministrators}):</strong><br />							
						<span class="user-avatar">
							<a href="{$oUserOwner->getProfileUrl()}"><img src="{$oUserOwner->getAvatarUrl(24)}" alt="avatar" /></a>		
							<a href="{$oUserOwner->getProfileUrl()}">{$oUserOwner->getDisplayName()}</a>
						</span>
						{if $aBlogAdministrators}			
							{foreach from=$aBlogAdministrators item=oBlogUser}
								{assign var="oUser" value=$oBlogUser->getUser()}  									
								<span class="user-avatar">
									<a href="{$oUser->getProfileUrl()}"><img src="{$oUser->getAvatarUrl(24)}" alt="avatar" /></a>		
									<a href="{$oUser->getProfileUrl()}">{$oUser->getDisplayName()}</a>
								</span>
							{/foreach}	
						{/if}<br /><br />

						<strong>{$aLang.blog_user_moderators} ({$iCountBlogModerators}):</strong><br />
						{if $aBlogModerators}						
							{foreach from=$aBlogModerators item=oBlogUser}  
								{assign var="oUser" value=$oBlogUser->getUser()}									
								<span class="user-avatar">
									<a href="{$oUser->getProfileUrl()}"><img src="{$oUser->getAvatarUrl(24)}" alt="avatar" /></a>		
									<a href="{$oUser->getProfileUrl()}">{$oUser->getDisplayName()}</a>
								</span>
							{/foreach}							
						{else}
							<span class="muted">{$aLang.blog_user_moderators_empty}</span>
						{/if}
					</div>
				</div>
			
				{hook run='blog_info_end' oBlog=$oBlog}
			</small>
		</footer>
	</div>
	
</div>

{hook run='blog_info' oBlog=$oBlog}

<div class="row-fluid nav-filter-wrapper">
	<div class="span12">
	<ul class="nav nav-pills pull-left">
		<li {if $sMenuSubItemSelect=='good'}class="active"{/if}><a href="{$sMenuSubBlogUrl}">{$aLang.blog_menu_collective_good}</a></li>
		<li {if $sMenuSubItemSelect=='new'}class="active"{/if}><a href="{$sMenuSubBlogUrl}newall/">{$aLang.blog_menu_collective_new}{if $iCountTopicsBlogNew>0} +{$iCountTopicsBlogNew}{/if}</a></li>
		<li {if $sMenuSubItemSelect=='discussed'}class="active"{/if}><a href="{$sMenuSubBlogUrl}discussed/">{$aLang.blog_menu_collective_discussed}</a></li>
		<li {if $sMenuSubItemSelect=='top'}class="active"{/if}><a href="{$sMenuSubBlogUrl}top/">{$aLang.blog_menu_collective_top}</a></li>
		{hook run='menu_blog_blog_item'}
	</ul>

	{if $sPeriodSelectCurrent}
		<ul class="nav nav-pills pull-right nav-pills">
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					{if $sPeriodSelectCurrent=='1'}{$aLang.blog_menu_top_period_24h}{/if}
					{if $sPeriodSelectCurrent=='7'}{$aLang.blog_menu_top_period_7d}{/if}
					{if $sPeriodSelectCurrent=='30'}{$aLang.blog_menu_top_period_30d}{/if}
					{if $sPeriodSelectCurrent=='all'}{$aLang.blog_menu_top_period_all}{/if}
					<b class="caret"></b>
				</a>
				
				<ul class="dropdown-menu">				
					<li {if $sPeriodSelectCurrent=='1'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=1">{$aLang.blog_menu_top_period_24h}</a></li>
					<li {if $sPeriodSelectCurrent=='7'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=7">{$aLang.blog_menu_top_period_7d}</a></li>
					<li {if $sPeriodSelectCurrent=='30'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=30">{$aLang.blog_menu_top_period_30d}</a></li>
					<li {if $sPeriodSelectCurrent=='all'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=all">{$aLang.blog_menu_top_period_all}</a></li>
				</li>
			</li>
		</ul>
	{/if}
	</div>
</div>

{if $bCloseBlog}
	{$aLang.blog_close_show}
{else}
	{include file='topics/topic_list.tpl'}
{/if}


{/block}

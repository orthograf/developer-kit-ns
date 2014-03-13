{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{assign var="oVote" value=$oTopic->getVote()}

<article class="topic topic-type-{$oTopic->getType()} js-topic">
	<header class="topic-header">
		{if $bTopicList}<h2 class="topic-title">{else}<h1 class="topic-title">{/if}
			{if $bTopicList}
				<a href="{$oTopic->getUrl()}">{$oTopic->getTitle()|escape:'html'}</a>
			{else}
				{$oTopic->getTitle()|escape:'html'}
			{/if}
			
			{if $oTopic->getPublish() == 0}   
				<i class="icon-file muted" title="{$aLang.topic_unpublish}"></i>
			{/if}
			
			{if $oTopic->getType() == 'link'} 
				<i class="icon-globe muted" title="{$aLang.topic_link}"></i>
			{/if}
		{if $bTopicList}</h2>{else}</h1>{/if}

		<div class="topic-info">
			<a href="{$oBlog->getUrlFull()}" class="text-success topic-blog">{$oBlog->getTitle()|escape:'html'}</a>
			
			<ul class="unstyled inline actions">								   
				{if $oUserCurrent and ($oUserCurrent->getId()==$oTopic->getUserId() or $oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getUserIsModerator() or $oBlog->getOwnerId()==$oUserCurrent->getId())}
					<li><a href="{$oTopic->getUrlEdit()}" title="{$aLang.topic_edit}" class="text-warning">{$aLang.topic_edit}</a></li>
				{/if}
				
				{if $oUserCurrent and ($oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getOwnerId()==$oUserCurrent->getId())}
					<li><a href="{router page='content'}delete/{$oTopic->getId()}/?security_ls_key={$ALTO_SECURITY_KEY}" title="{$aLang.topic_delete}" onclick="return confirm('{$aLang.topic_delete_confirm}');" class="text-error">{$aLang.topic_delete}</a></li>
				{/if}
			</ul>
		</div>
	</header>

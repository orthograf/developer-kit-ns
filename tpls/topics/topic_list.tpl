{if count($aTopics)>0}
    {wgroup_add group='toolbar' name='toolbar_topic.tpl' iCountTopic=count($aTopics)}

	{foreach from=$aTopics item=oTopic}
		{if E::Topic_IsAllowTopicType($oTopic->getType())}
			{assign var="sTopicTemplateName" value="topics/topic_topic.tpl"}
			{include file=$sTopicTemplateName bTopicList=true}
		{/if}
	{/foreach}

	{include file='paging.tpl' aPaging=$aPaging}
{else}
	{$aLang.blog_no_topic}
{/if}

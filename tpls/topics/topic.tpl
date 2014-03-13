{if E::Topic_IsAllowTopicType($oTopic->getType())}
    {assign var="sTopicTemplateName" value="topics/topic_topic.tpl"}
    {include file=$sTopicTemplateName}
{/if}
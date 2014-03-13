{extends file="_index.tpl"}

{block name="layout_vars"}
    {if $sEvent!='add'}
        {$menu_content='create'}
    {/if}
{/block}

{block name="layout_content"}
	{include file='topics/topic_list.tpl'}
{/block}

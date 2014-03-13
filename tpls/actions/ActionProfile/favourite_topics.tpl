{extends file="_index.tpl"}

{block name="layout_vars"}
    {$menu="people"}
{/block}

{block name="layout_content"}
	<div class="action-header">
		{include file='actions/ActionProfile/profile_top.tpl'}
		{include file='menus/menu.profile_favourite.tpl'}
	</div>	
	
{if $oUserCurrent and $oUserCurrent->getId()==$oUserProfile->getId()}
	{$aBlockParams.user=$oUserProfile}
    {widget name=tagsFavouriteTopic params=$aBlockParams}
{/if}
{include file='topics/topic_list.tpl'}
{/block}

{extends file='_index.tpl'}

{block name="layout_vars"}
    {$menu="people"}
{/block}

{block name="layout_content"}
	<h2 class="page-header">{$aLang.people}</h2>
	
		{include file='user_list.tpl' aUsersList=$aUsersLast}
		{include file='paging.tpl' aPaging=$aPaging}

{/block}

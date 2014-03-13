{extends file='_index.tpl'}

{block name="layout_vars"}
    {$menu="people"}
{/block}

{block name="layout_content"}

<h2 class="page-header">{$aLang.people}</h2>

<div id="block-more-content">
	<form action="" method="POST" id="form-users-search" onsubmit="return false;" class="search-item">
		<input id="search-user-login" type="text" placeholder="{$aLang.user_search_title_hint}" autocomplete="off" name="user_login" value="" class="input-block-level" onkeyup="ls.timer.run(ls.user.searchUsers,'users_search',['form-users-search'],1000);">
		<div class="input-submit" onclick="jQuery('#form-users-search').submit()"></div>
<ul id="user-prefix-filter" class="unstyled inline search-abc">
			<li class="active"><a href="#" class="link-dotted" onclick="return ls.user.searchUsersByPrefix('',this);">{$aLang.user_search_filter_all}</a></li>
			{foreach from=$aPrefixUser item=sPrefixUser}
				<li><a href="#" class="link-dotted" onclick="return ls.user.searchUsersByPrefix('{$sPrefixUser}',this);">{$sPrefixUser}</a></li>
			{/foreach}
		</ul>
	</form>
</div>

<div id="users-list-search" style="display:none;"></div>

<div id="users-list-original">
	{router page='people' assign=sUsersRootPage}
	{include file='user_list.tpl' aUsersList=$aUsersRating bUsersUseOrder=true sUsersRootPage=$sUsersRootPage}
</div>

{/block}

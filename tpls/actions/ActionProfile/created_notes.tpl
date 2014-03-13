{extends file="_index.tpl"}

{block name="layout_vars"}
    {$menu="people"}
{/block}

{block name="layout_content"}
	
	<div class="action-header">
	{include file='actions/ActionProfile/profile_top.tpl'}
	</div>

{if $aNotes}
	<table class="table table-profile-notes" cellspacing="0">
		{foreach from=$aNotes item=oNote}
			<tr>
				<td class="cell-username"><small><a href="{$oNote->getTargetUser()->getProfileUrl()}">{$oNote->getTargetUser()->getDisplayName()}</a></small></td>
				<td class="cell-note">{$oNote->getText()}</td>
				<td class="muted cell-date"><small>{date_format date=$oNote->getDateAdd() format="j F Y"}</small></td>
			</tr>
		{/foreach}
	</table>
{else}
	<div class="notice-empty alert alert-info">{$aLang.user_note_list_empty}</div>
{/if}
{include file='paging.tpl' aPaging=$aPaging}
{/block}

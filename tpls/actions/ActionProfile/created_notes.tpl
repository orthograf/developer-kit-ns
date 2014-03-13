{include file='header.tpl' menu='people'}
{include file='actions/ActionProfile/profile_top.tpl'}
{include file='menu.profile_created.tpl'}
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
	<div class="notice-empty">{$aLang.user_note_list_empty}</div>
{/if}
{include file='paging.tpl' aPaging=$aPaging}
{include file='footer.tpl'}

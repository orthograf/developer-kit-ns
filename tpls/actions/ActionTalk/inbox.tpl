{extends file="_index.tpl"}

{* block name="layout_vars"
    $noShowSystemMessage=false
block *}

{block name="layout_content"}

{include file='menus/menu.talk.tpl'}


{if $aTalks}
	{include file='actions/ActionTalk/filter.tpl'}

	<form action="{router page='talk'}" method="post" id="form_talks_list">
		<input type="hidden" name="security_ls_key" value="{$ALTO_SECURITY_KEY}" />
		<input type="hidden" name="submit_talk_read" id="form_talks_list_submit_read" value="" />
		<input type="hidden" name="submit_talk_del" id="form_talks_list_submit_del" value="" />

		<button type="submit" onclick="ls.talk.makeReadTalks()" class="btn">{$aLang.talk_inbox_make_read}</button>
		<button type="submit" onclick="if (confirm('{$aLang.talk_inbox_delete_confirm}')){ ls.talk.removeTalks() };" class="btn">{$aLang.talk_inbox_delete}</button>
		<br /><br />
		
		<table class="table table-hover table-talk">
			<thead>
				<tr>
					<th class="cell-checkbox"><input type="checkbox" name="" class="input-checkbox" onclick="ls.tools.checkAll('form_talks_checkbox', this, true);"></th>
					<th class="cell-recipients"><small>{$aLang.talk_inbox_target}</small></th>
					<th class="cell-favourite"></th>
					<th class="cell-title"><small>{$aLang.talk_inbox_title}</small></th>
					<th class="cell-date ta-r"><small>{$aLang.talk_inbox_date}</small></th>
				</tr>
			</thead>

			<tbody>
				{foreach from=$aTalks item=oTalk}
					{assign var="oTalkUserAuthor" value=$oTalk->getTalkUser()}
					<tr>
						<td class="cell-checkbox"><input type="checkbox" name="talk_select[{$oTalk->getId()}]" class="form_talks_checkbox input-checkbox" /></td>
						<td class="muted">
							<small>
								{strip}
									{assign var="aTalkUserOther" value=[]}
									{foreach from=$oTalk->getTalkUsers() item=oTalkUser name=users}
										{if $oTalkUser->getUserId()!=$oUserCurrent->getId()}
											{$aTalkUserOther[]=$oTalkUser}
										{/if}
									{/foreach}
									{foreach from=$aTalkUserOther item=oTalkUser name=users}
										{assign var="oUser" value=$oTalkUser->getUser()}
										{if !$smarty.foreach.users.first}, {/if}<a href="{$oUser->getUserWebPath()}" class="user {if $oTalkUser->getUserActive()!=$TALK_USER_ACTIVE}muted inactive{/if}">{$oUser->getLogin()}</a>
									{/foreach}
								{/strip}
							</small>
						</td>
						<td class="cell-favourite">
							<a href="#" onclick="return ls.favourite.toggle({$oTalk->getId()},this,'talk');" class="muted favourite {if $oTalk->getIsFavourite()}active{/if}"><i class="icon-star-empty"></i></a>
						</td>
						<td>
							{strip}
								<a href="{router page='talk'}read/{$oTalk->getId()}/" class="text-success js-title-talk" title="{$oTalk->getTextLast()|strip_tags|truncate:100:'...'|escape:'html'}">
									{if $oTalkUserAuthor->getCommentCountNew() or !$oTalkUserAuthor->getDateLast()}
										<strong>{$oTalk->getTitle()|escape:'html'}</strong>
									{else}
										{$oTalk->getTitle()|escape:'html'}
									{/if}
								</a>
							{/strip}
							&nbsp;
							{if $oTalk->getCountComment()}
								<span class="muted">({$oTalk->getCountComment()}{if $oTalkUserAuthor->getCommentCountNew()}<span class="text-info">+{$oTalkUserAuthor->getCommentCountNew()}</span>{/if})</span>
							{/if}
							{if $oUserCurrent->getId()==$oTalk->getUserIdLast()}
								<span class="text-success">&rarr;</span>
							{else}
								<span class="text-error">&larr;</span>
							{/if}
						</td>
						<td class="muted cell-date ta-r"><small>{date_format date=$oTalk->getDate() format="j F Y, H:i"}</small></td>
					</tr>
				{/foreach}
			</tbody>
		</table>
	</form>
{else}
	<div class="notice-empty">{$aLang.talk_inbox_empty}</div>
{/if}


{include file='paging.tpl' aPaging=$aPaging}
{/block}

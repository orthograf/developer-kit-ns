{include file='header.tpl'}
{include file='menu.talk.tpl'}


{if $aTalks}
	<table class="table table-talk">
		<thead>
			<tr>
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
				{if $oTalkUserAuthor->getCommentCountNew() or !$oTalkUserAuthor->getDateLast()}
					<a href="{router page='talk'}read/{$oTalk->getId()}/" class="text-success"><strong>{$oTalk->getTitle()|escape:'html'}</strong></a>
				{else}
					<a href="{router page='talk'}read/{$oTalk->getId()}/" class="text-success">{$oTalk->getTitle()|escape:'html'}</a>
				{/if}
				&nbsp;
				{if $oTalk->getCountComment()}
					<span class="muted">({$oTalk->getCountComment()}{if $oTalkUserAuthor->getCommentCountNew()}<span class="text-info">+{$oTalkUserAuthor->getCommentCountNew()}</span>{/if})</span>
				{/if}
				</td>
				<td class="muted cell-date ta-r"><small>{date_format date=$oTalk->getDate()}</small></td>
			</tr>
		{/foreach}
		</tbody>
	</table>
{else}
	<div class="notice-empty">{$aLang.talk_favourite_empty}</div>
{/if}


{include file='paging.tpl' aPaging=$aPaging}
{include file='footer.tpl'}

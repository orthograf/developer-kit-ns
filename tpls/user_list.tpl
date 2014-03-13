<table class="table table-hover table-users">
	{if $bUsersUseOrder}
		<thead>
			<tr>
				<th class="cell-name"><small><a href="{$sUsersRootPage}?order=user_login&order_way={if $sUsersOrder=='user_login'}{$sUsersOrderWayNext}{else}{$sUsersOrderWay}{/if}" {if $sUsersOrder=='user_login'}class="{$sUsersOrderWay}"{/if}><span>{$aLang.user}</span></a></small></th>
				<th class="cell-date"><small>{$aLang.user_date_last}</small></th>
				<th class="cell-skill"><small><a href="{$sUsersRootPage}?order=user_skill&order_way={if $sUsersOrder=='user_skill'}{$sUsersOrderWayNext}{else}{$sUsersOrderWay}{/if}" {if $sUsersOrder=='user_skill'}class="{$sUsersOrderWay}"{/if}><span>{$aLang.user_skill}</span></a></small></th>
				<th class="cell-rating"><small><a href="{$sUsersRootPage}?order=user_rating&order_way={if $sUsersOrder=='user_rating'}{$sUsersOrderWayNext}{else}{$sUsersOrderWay}{/if}" {if $sUsersOrder=='user_rating'}class="{$sUsersOrderWay}"{/if}><span>{$aLang.user_rating}</span></a></small></th>
			</tr>
		</thead>
	{else}
		<thead>
			<tr>
				<th class="cell-name"><small>{$aLang.user}</small></th>
				<th class="cell-date"><small>{$aLang.user_date_last}</small></th>
				<th class="cell-skill"><small>{$aLang.user_skill}</small></th>
				<th class="cell-rating"><small>{$aLang.user_rating}</small></th>
			</tr>
		</thead>
	{/if}

	<tbody>
		{if $aUsersList}
			{foreach from=$aUsersList item=oUserList}
				{assign var="oSession" value=$oUserList->getSession()}
				{assign var="oUserNote" value=$oUserList->getUserNote()}
				<tr>
					<td class="cell-name">
						<a href="{$oUserList->getProfileUrl()}"><img src="{$oUserList->getAvatarUrl(48)}" alt="{$oUserList->getLogin()}" class="avatar visible-desktop" /></a>
						<div class="name {if !$oUserList->getProfileName()}no-realname{/if}">
							<p class="username">
								<a href="{$oUserList->getUserWebPath()}">{$oUserList->getLogin()}</a>
								{if $oUserNote}
									<i class="icon-comment muted js-infobox" title="{$oUserNote->getText()|escape:'html'}"></i>
								{/if}
							</p>
							{if $oUserList->getProfileName()}<p class="muted realname"><small>{$oUserList->getProfileName()}</small></p>{/if}
						</div>
					</td>
					<td class="muted cell-date">
						<small>
							{if $oSession}
								{date_format date=$oSession->getDateLast() hours_back="12" minutes_back="60" now="60" day="day H:i" format="d.m.y, H:i"}
							{/if}
						</small>
					</td>
					<td class="text-info cell-skill"><small>{$oUserList->getSkill()}</small></td>
					<td class="cell-rating{if $oUserList->getRating() < 0} text-error negative{else} text-success{/if}"><small>{$oUserList->getRating()}</small></td>
				</tr>
			{/foreach}
		{else}
			<tr>
				<td colspan="5">
					{if $sUserListEmpty}
						{$sUserListEmpty}
					{else}
						{$aLang.user_empty}
					{/if}
				</td>
			</tr>
		{/if}
	</tbody>
</table>

{include file='paging.tpl' aPaging=$aPaging}

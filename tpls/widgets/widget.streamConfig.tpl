{if $oUserCurrent}
	{literal}
		<script type="text/javascript">
			jQuery(document).ready( function() {
				jQuery('#stream_users_complete').keydown(function (event) {
					if (event.which == 13) {
						ls.stream.appendUser()
					}
				});
			 });
		</script>
	{/literal}


	<section class="block block-type-activity">
		<header class="block-header">
			<h3>{$aLang.stream_block_config_title}</h3>
		</header>
		
		<div class="block-content">
			<p class="muted"><small>{$aLang.stream_settings_note_filter}</small></p>
			
			<ul class="unstyled activity-settings-filter">
				{foreach from=$aStreamEventTypes key=sType item=aEventType}
					{if !(Config::Get('module.stream.disable_vote_events') && substr($sType, 0, 4) == 'vote')}
						<li>
							<label class="checkbox">
								<input class="streamEventTypeCheckbox input-checkbox"
									type="checkbox"
									id="strn_et_{$sType}"
									{if in_array($sType, $aStreamTypesList)}checked="checked"{/if}
									onClick="ls.stream.switchEventType('{$sType}')" />
								{assign var=langKey value="stream_event_type_`$sType`"}
								{$aLang.$langKey}
							</label>
						</li>
					{/if}
				{/foreach}
			</ul>
		</div>
	</section>


	<section class="block block-type-activity">
		<header class="block-header">
			<h3>{$aLang.stream_block_users_title}</h3>
		</header>
		
		<div class="block-content">
			<p class="muted"><small>{$aLang.stream_settings_note_follow_user}</small></p>
			
			<div class="input-append">
				<input type="text" id="stream_users_complete" autocomplete="off" class="span6 autocomplete-users input-text input-width-150" />
				<a href="javascript:ls.stream.appendUser()" class="btn">{$aLang.stream_block_config_append}</a>
			</div>
			
			{if count($aStreamSubscribedUsers)}
				<ul id="stream_block_users_list" class="unstyled user-list-mini max-height-200">
					{foreach from=$aStreamSubscribedUsers item=oUser}
						{assign var=iUserId value=$oUser->getId()}
						
						{if !isset($aStreamFriends.$iUserId)}
							<li>
								<label class="checkbox">
									<input class="streamUserCheckbox input-checkbox"
											type="checkbox"
											id="strm_u_{$iUserId}"
											checked="checked"
											onClick="if (jQuery(this).prop('checked')) { ls.stream.subscribe({$iUserId}) } else { ls.stream.unsubscribe({$iUserId}) } " />
									<a href="{$oUser->getProfileUrl()}" title="{$oUser->getDisplayName()}"><img src="{$oUser->getAvatarUrl(24)}" alt="avatar" class="avatar" /></a>
									<a href="{$oUser->getProfileUrl()}">{$oUser->getDisplayName()}</a>
								</label>
							</li>
						{/if}
					{/foreach}
				</ul>
			{else}
				<ul id="stream_block_users_list" class="unstyled max-height-200"></ul>
				<p id="stream_no_subscribed_users">{$aLang.stream_no_subscribed_users}</p>
			{/if}
		</div>
	</section>
		
		
		
	<section class="block block-type-activity">
		<header class="block-header">
			<h3>{$aLang.stream_block_users_friends}</h3>
		</header>
		
		<div class="block-content">
			<p class="muted"><small>{$aLang.stream_settings_note_follow_friend}</small></p>
			
			{if count($aStreamFriends)}
				<ul class="unstyled stream-settings-friends max-height-200">
					{foreach from=$aStreamFriends item=oUser}
						{assign var=iUserId value=$oUser->getId()}
						<li>
							<label class="checkbox">
								<input class="streamUserCheckbox input-checkbox"
										type="checkbox"
										id="strm_u_{$iUserId}"
										{if isset($aStreamSubscribedUsers.$iUserId)} checked="checked"{/if}
										onClick="if (jQuery(this).prop('checked')) { ls.stream.subscribe({$iUserId}) } else { ls.stream.unsubscribe({$iUserId}) } " />
								<a href="{$oUser->getUserWebPath()}" title="{$oUser->getLogin()}"><img src="{$oUser->getProfileAvatarPath(24)}" alt="avatar" class="avatar" /></a>
								<a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a>
							</label>
						</li>
					{/foreach}
				</ul>
			{else}
				<p class="muted"><small>{$aLang.stream_no_subscribed_users}</small></p>
			{/if}
		</div>
	</section>
{/if}

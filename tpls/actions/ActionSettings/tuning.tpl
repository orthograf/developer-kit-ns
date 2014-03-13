{include file='header.tpl'}


{include file='menu.settings.tpl'}

{hook run='settings_tuning_begin'}

<form action="{router page='settings'}tuning/" method="POST" enctype="multipart/form-data" class="wrapper-content form-actions">
	{hook run='form_settings_tuning_begin'}

	<input type="hidden" name="security_ls_key" value="{$ALTO_SECURITY_KEY}" />
	
	<fieldset>
		<legend>{$aLang.settings_tuning_notice}</legend>

		<label class="checkbox"><input {if $oUserCurrent->getSettingsNoticeNewTopic()}checked{/if} type="checkbox" id="settings_notice_new_topic" name="settings_notice_new_topic" value="1" class="input-checkbox" /> {$aLang.settings_tuning_notice_new_topic}</label>
		<label class="checkbox"><input {if $oUserCurrent->getSettingsNoticeNewComment()}checked{/if} type="checkbox" id="settings_notice_new_comment" name="settings_notice_new_comment" value="1" class="input-checkbox" /> {$aLang.settings_tuning_notice_new_comment}</label>
		<label class="checkbox"><input {if $oUserCurrent->getSettingsNoticeNewTalk()}checked{/if} type="checkbox" id="settings_notice_new_talk" name="settings_notice_new_talk" value="1" class="input-checkbox" /> {$aLang.settings_tuning_notice_new_talk}</label>
		<label class="checkbox"><input {if $oUserCurrent->getSettingsNoticeReplyComment()}checked{/if} type="checkbox" id="settings_notice_reply_comment" name="settings_notice_reply_comment" value="1" class="input-checkbox" /> {$aLang.settings_tuning_notice_reply_comment}</label>
		<label class="checkbox"><input {if $oUserCurrent->getSettingsNoticeNewFriend()}checked{/if} type="checkbox" id="settings_notice_new_friend" name="settings_notice_new_friend" value="1" class="input-checkbox" /> {$aLang.settings_tuning_notice_new_friend}</label>
	</fieldset>
	
	<br />
	<br />

	<fieldset>
		<legend>{$aLang.settings_tuning_general}</legend>

		<label>{$aLang.settings_tuning_general_timezone}:</label>
		<select name="settings_general_timezone" class="input-block-level">
			{foreach from=$aTimezoneList item=sTimezone}
				<option value="{$sTimezone}" {if $_aRequest.settings_general_timezone==$sTimezone}selected="selected"{/if}>{$aLang.timezone_list[$sTimezone]}</option>
			{/foreach}
		</select>
		
	</fieldset>
	
	<br />
	<br />
	
	{hook run='form_settings_tuning_end'}
	
	<button type="submit" name="submit_settings_tuning" class="btn btn-primary">{$aLang.settings_profile_submit}</button>
</form>

{hook run='settings_tuning_end'}

{include file='footer.tpl'}

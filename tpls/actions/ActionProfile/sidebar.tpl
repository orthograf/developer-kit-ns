{hook run='profile_sidebar_begin' oUserProfile=$oUserProfile}


<section class="block block-type-profile">
	<div class="profile-photo-wrapper">
		<div class="status {if $oUserProfile->isOnline()}status-online{else}status-offline{/if}"><small>{if $oUserProfile->isOnline()}{$aLang.user_status_online}{else}{$aLang.user_status_offline}{/if}</small></div>
		<a href="{$oUserProfile->getUserWebPath()}"><img src="{$oUserProfile->getPhotoUrl()}" alt="photo" class="profile-photo" id="foto-img" /></a>
	</div>
	
	{if $sAction=='settings' AND E::UserId() == $oUserProfile->getId()}
		<script type="text/javascript">
			jQuery(function($){
				$('#foto-upload').file({ name:'foto' }).choose(function(e, input) {
					ls.user.uploadFoto(null,input);
				});
			});
		</script>
		
		<p class="upload-photo">
			<a href="#" id="foto-upload" class="link-dotted">{if $oUserCurrent->getProfileFoto()}{$aLang.settings_profile_photo_change}{else}{$aLang.settings_profile_photo_upload}{/if}</a>&nbsp;&nbsp;&nbsp;
			<a href="#" id="foto-remove" class="link-dotted text-error" onclick="return ls.user.removeFoto();" style="{if !$oUserCurrent->getProfileFoto()}display:none;{/if}">{$aLang.settings_profile_foto_delete}</a>
		</p>

		<div class="modal modal-upload-photo" id="foto-resize">
			<header class="modal-header">
				<h3>{$aLang.uploadimg}</h3>
			</header>
			
			<div class="modal-body">
				<img src="" alt="" id="foto-resize-original-img"><br />
				<button type="submit" class="btn btn-primary" onclick="return ls.user.resizeFoto();">{$aLang.settings_profile_avatar_resize_apply}</button>
				<button type="submit" class="btn" onclick="return ls.user.cancelFoto();">{$aLang.settings_profile_avatar_resize_cancel}</button>
			</div>
			
			<footer class="modal-footer"></footer>
		</div>
	{/if}
</section>


{if $oUserCurrent && $oUserCurrent->getId()!=$oUserProfile->getId()}
	<script type="text/javascript">
		jQuery(function($){
			ls.lang.load({lang_load name="profile_user_unfollow,profile_user_follow"});
		});
	</script>

	<section class="block block-type-profile-actions">
		<div class="block-content">
			<ul class="unstyled profile-actions" id="profile_actions">
				{include file='actions/ActionProfile/friend_item.tpl' oUserFriend=$oUserProfile->getUserFriend()}
				<li><a href="{router page='talk'}add/?talk_users={$oUserProfile->getLogin()}">{$aLang.user_write_prvmsg}</a></li>						
				<li>
					<a href="#" onclick="ls.user.followToggle(this, {$oUserProfile->getId()}); return false;" class="{if $oUserProfile->isFollow()}text-error followed{/if}">
						{if $oUserProfile->isFollow()}{$aLang.profile_user_unfollow}{else}{$aLang.profile_user_follow}{/if}
					</a>
				</li>						
			</ul>
		</div>
	</section>
{/if}	


{hook run='profile_sidebar_menu_before' oUserProfile=$oUserProfile}


<section class="block block-type-profile-nav">
	<ul class="nav nav-list">
		{hook run='profile_sidebar_menu_item_first' oUserProfile=$oUserProfile}
		<li {if $sAction=='profile' && ($aParams[0]=='whois' or $aParams[0]=='')}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}">{$aLang.user_menu_profile_whois}</a></li>
		<li {if $sAction=='profile' && $aParams[0]=='wall'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}wall/">{$aLang.user_menu_profile_wall}{if ($iCountWallUser)>0} ({$iCountWallUser}){/if}</a></li>
		<li {if $sAction=='profile' && $aParams[0]=='created'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}created/topics/">{$aLang.user_menu_publication}{if ($iCountCreated)>0} ({$iCountCreated}){/if}</a></li>
		<li {if $sAction=='profile' && $aParams[0]=='favourites'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}favourites/topics/">{$aLang.user_menu_profile_favourites}{if ($iCountFavourite)>0} ({$iCountFavourite}){/if}</a></li>
		<li {if $sAction=='profile' && $aParams[0]=='friends'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}friends/">{$aLang.user_menu_profile_friends}{if ($iCountFriendsUser)>0} ({$iCountFriendsUser}){/if}</a></li>
		<li {if $sAction=='profile' && $aParams[0]=='stream'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}stream/">{$aLang.user_menu_profile_stream}</a></li>
		
		{if $oUserCurrent and $oUserCurrent->getId() == $oUserProfile->getId()}
			<li class="divider"></li>
			<li {if $sAction=='talk'}class="active"{/if}><a href="{router page='talk'}">{$aLang.talk_menu_inbox}{if $iUserCurrentCountTalkNew} ({$iUserCurrentCountTalkNew}){/if}</a></li>
			<li {if $sAction=='settings'}class="active"{/if}><a href="{router page='settings'}">{$aLang.settings_menu}</a></li>
		{/if}
		{hook run='profile_sidebar_menu_item_last' oUserProfile=$oUserProfile}
	</ul>
</section>


{if E::UserId() != $oUserProfile->getId()}
	<section class="block block-type-profile-note">
		{if $oUserNote}
			<script type="text/javascript">
				ls.usernote.sText = {json var = $oUserNote->getText()};
			</script>
		{/if}

		<div id="usernote-note" class="profile-note" {if !$oUserNote}style="display: none;"{/if}>
			<p id="usernote-note-text">
				{if $oUserNote}
					{$oUserNote->getText()}
				{/if}
			</p>
			
			<ul class="unstyled inline actions">
				<li><a href="#" onclick="return ls.usernote.showForm();" class="link-dotted text-warning">{$aLang.user_note_form_edit}</a></li>
				<li><a href="#" onclick="return ls.usernote.remove({$oUserProfile->getId()});" class="link-dotted text-error">{$aLang.user_note_form_delete}</a></li>
			</ul>
		</div>
		
		<div id="usernote-form" style="display: none;">
			<p><textarea rows="4" cols="20" id="usernote-form-text" class="input-block-level"></textarea></p>
			<button type="submit" onclick="return ls.usernote.save({$oUserProfile->getId()});" class="btn btn-primary">{$aLang.user_note_form_save}</button>
			<button type="submit" onclick="return ls.usernote.hideForm();" class="btn">{$aLang.user_note_form_cancel}</button>
		</div>
		
		<a href="#" onclick="return ls.usernote.showForm();" id="usernote-button-add" class="link-dotted" {if $oUserNote}style="display:none;"{/if}>{$aLang.user_note_add}</a>
	</section>
{/if}


{hook run='profile_sidebar_end' oUserProfile=$oUserProfile}

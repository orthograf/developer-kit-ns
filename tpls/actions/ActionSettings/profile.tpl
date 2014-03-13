{extends file="_index.tpl"}

{block name="layout_content"}

{include file='menus/menu.settings.tpl'}

<script type="text/javascript">
	jQuery(document).ready(function($){
		ls.lang.load({lang_load name="geo_select_city,geo_select_region"});
		ls.geo.initSelect();
		ls.userfield.iCountMax='{cfg name="module.user.userfield_max_identical"}';
	});
</script>


{hook run='settings_profile_begin'}

<p id="profile_user_field_template" style="display:none;" class="js-user-field-item">
    <select name="profile_user_field_type[]" onchange="ls.userfield.changeFormField(this);">
        {foreach from=$aUserFieldsContact item=oFieldAll}
            <option value="{$oFieldAll->getId()}">{$oFieldAll->getTitle()|escape:'html'}</option>
        {/foreach}
    </select>
    <input type="text" name="profile_user_field_value[]" value="" class="input-text input-width-200">
    <a class="icon-remove" title="{$aLang.user_field_delete}" href="#" onclick="return ls.userfield.removeFormField(this);"></a>
</p>

<form method="post" enctype="multipart/form-data" class="form-profile">
	<div class="wrapper-content form-actions">	

		{hook run='form_settings_profile_begin'}

		<input type="hidden" name="security_ls_key" value="{$ALTO_SECURITY_KEY}">
	
		<fieldset>
			<legend>{$aLang.settings_profile_section_base}</legend>
			
			<div class="row-fluid">
				<div class="span8">
		            {*user name*}
					<label for="profile_name">{$aLang.settings_profile_name}:</label>
					<input type="text" name="profile_name" id="profile_name" value="{$oUserCurrent->getProfileName()|escape:'html'}" class="span9">
					<span class="help-block"><small>{$aLang.settings_profile_name_notice}</small></span>
					<br />
		            {*user sex*}
					<label for="profile_sex">{$aLang.settings_profile_sex}:</label>
					<select name="profile_sex" id="profile_sex" class="span6">
						<option value="man" {if $oUserCurrent->getProfileSex()=='man'}selected{/if}>{$aLang.settings_profile_sex_man}</option>
						<option value="woman" {if $oUserCurrent->getProfileSex()=='woman'}selected{/if}>{$aLang.settings_profile_sex_woman}</option>
						<option value="other" {if $oUserCurrent->getProfileSex()=='other'}selected{/if}>{$aLang.settings_profile_sex_other}</option>
					</select>
					<br />
					<br />
		            {*user birthday*}
					<label for="">{$aLang.settings_profile_birthday}:</label>
					<select name="profile_birthday_day" class="span3">
						<option value="">{$aLang.date_day}</option>
						{section name=date_day start=1 loop=32 step=1}
							<option value="{$smarty.section.date_day.index}" {if $smarty.section.date_day.index==$oUserCurrent->getProfileBirthday()|date_format:"%d"}selected{/if}>{$smarty.section.date_day.index}</option>
						{/section}
					</select>
				
					<select name="profile_birthday_month" class="span5">
						<option value="">{$aLang.date_month}</option>
						{section name=date_month start=1 loop=13 step=1}
							<option value="{$smarty.section.date_month.index}" {if $smarty.section.date_month.index==$oUserCurrent->getProfileBirthday()|date_format:"%m"}selected{/if}>{$aLang.month_array[$smarty.section.date_month.index][0]}</option>
						{/section}
					</select>
				
					<select name="profile_birthday_year" class="span4">
						<option value="">{$aLang.date_year}</option>
						{section name=date_year loop=$smarty.now|date_format:"%Y"+1 max=$smarty.now|date_format:"%Y"-2012+130 step=-1}
							<option value="{$smarty.section.date_year.index}" {if $smarty.section.date_year.index==$oUserCurrent->getProfileBirthday()|date_format:"%Y"}selected{/if}>{$smarty.section.date_year.index}</option>
						{/section}
					</select>
					<br />
					<br />
			
				</div>
				{*avatar*}
				<div class="span4">
					<p id="profile_user_field_template" style="display:none;" class="js-user-field-item">
						<select name="profile_user_field_type[]" onchange="ls.userfield.changeFormField(this);" class="span3">
							{foreach from=$aUserFieldsContact item=oFieldAll}
								<option value="{$oFieldAll->getId()}">{$oFieldAll->getTitle()|escape:'html'}</option>
							{/foreach}
						</select>
						<input type="text" name="profile_user_field_value[]" value="" class="span3">
						<a class="icon-remove" title="{$aLang.user_field_delete}" href="#" onclick="return ls.userfield.removeFormField(this);"></a>
					</p>
		
					<div class="pull-right avatar-change">
						<img src="{$oUserCurrent->getProfileAvatarPath(100)}" id="avatar-img" />

						<div>
							<small>
								<a href="#" id="avatar-upload" class="link-dotted">{if $oUserCurrent->getProfileAvatar()}{$aLang.settings_profile_avatar_change}{else}{$aLang.settings_profile_avatar_upload}{/if}</a><br />
								<a href="#" id="avatar-remove" class="link-dotted text-error" onclick="return ls.user.removeAvatar();" style="{if !$oUserCurrent->getProfileAvatar()}display:none;{/if}">{$aLang.settings_profile_avatar_delete}</a>
							</small>
						</div>
		
						<div id="avatar-resize" class="modal modal-upload-avatar">
							<header class="modal-header">
								<h3>{$aLang.uploadimg}</h3>
							</header>
			
							<div class="modal-body">
								<p><img src="" alt="" id="avatar-resize-original-img"></p>
								<button type="submit" class="btn btn-primary" onclick="return ls.user.resizeAvatar();">{$aLang.settings_profile_avatar_resize_apply}</button>
								<button type="submit" class="btn" onclick="return ls.user.cancelAvatar();">{$aLang.settings_profile_avatar_resize_cancel}</button>
							</div>
							
							<footer class="modal-footer"></footer>
						</div>
					</div>
				</div>

			</div>
			{* /row-fluid *}

            {* profile about *}
			<label for="profile_about">{$aLang.settings_profile_about}:</label>
			<textarea name="profile_about" id="profile_about" class="input-block-level" rows="5">{$oUserCurrent->getProfileAbout()|escape:'html'}</textarea>
			<br />

            {*geo*}
			<div class="js-geo-select">
				<label for="">{$aLang.profile_place}:</label>
				<p>
					<select class="js-geo-country span6" name="geo_country">
						<option value="">{$aLang.geo_select_country}</option>
						{if $aGeoCountries}
							{foreach from=$aGeoCountries item=oGeoCountry}
								<option value="{$oGeoCountry->getId()}" {if $oGeoTarget and $oGeoTarget->getCountryId()==$oGeoCountry->getId()}selected="selected"{/if}>{$oGeoCountry->getName()}</option>
							{/foreach}
						{/if}
					</select>
				</p>

				<p>
					<select class="js-geo-region span6" name="geo_region" {if !$oGeoTarget or !$oGeoTarget->getCountryId()}style="display:none;"{/if}>
						<option value="">{$aLang.geo_select_region}</option>
						{if $aGeoRegions}
							{foreach from=$aGeoRegions item=oGeoRegion}
								<option value="{$oGeoRegion->getId()}" {if $oGeoTarget and $oGeoTarget->getRegionId()==$oGeoRegion->getId()}selected="selected"{/if}>{$oGeoRegion->getName()}</option>
							{/foreach}
						{/if}
					</select>
				</p>

				
				<select class="js-geo-city span6" name="geo_city" {if !$oGeoTarget or !$oGeoTarget->getRegionId()}style="display:none;"{/if}>
					<option value="">{$aLang.geo_select_city}</option>
					{if $aGeoCities}
						{foreach from=$aGeoCities item=oGeoCity}
							<option value="{$oGeoCity->getId()}" {if $oGeoTarget and $oGeoTarget->getCityId()==$oGeoCity->getId()}selected="selected"{/if}>{$oGeoCity->getName()}</option>
						{/foreach}
					{/if}
				</select>
			</div>
            {*/geo*}
		
			{assign var="aUserFieldValues" value=$oUserCurrent->getUserFieldValues(false,'')}
			{if count($aUserFieldValues)}
				{foreach from=$aUserFieldValues item=oField}
					<label for="profile_user_field_{$oField->getId()}">{$oField->getTitle()|escape:'html'}:</label>
					<input type="text" class="span6" name="profile_user_field_{$oField->getId()}" id="profile_user_field_{$oField->getId()}" value="{$oField->getValue()|escape:'html'}"/>
				{/foreach}
			{/if}
			{* персональный блог *}
            <label for="blog_title">{$aLang.settings_profile_section_blog}:</label>
            <input type="text" name="blog_title" id="blog_title" value="{$oUserCurrent->getBlog()->getBlogTitle()|escape:'html'}" class="span9">
            <br />

        </fieldset>



    </div>
	
	
	<div class="wrapper-content form-actions wrapper-content-dark">
		<fieldset>
			<legend>{$aLang.settings_profile_section_contacts}</legend>

			{assign var="aUserFieldContactValues" value=$oUserCurrent->getUserFieldValues(true,array('contact','social'))}
			<div id="user-field-contact-contener">
				{foreach from=$aUserFieldContactValues item=oField}
					<p class="js-user-field-item">
						<select name="profile_user_field_type[]"  onchange="ls.userfield.changeFormField(this);" class="span3">
							{foreach from=$aUserFieldsContact item=oFieldAll}
								<option value="{$oFieldAll->getId()}" {if $oFieldAll->getId()==$oField->getId()}selected="selected"{/if}>{$oFieldAll->getTitle()|escape:'html'}</option>
							{/foreach}
						</select>
						<input type="text" name="profile_user_field_value[]" value="{$oField->getValue()|escape:'html'}" class="span3">
						<a class="icon-remove muted" title="{$aLang.user_field_delete}" href="#" onclick="return ls.userfield.removeFormField(this);"></a>
					</p>
				{/foreach}
			</div>
			{if $aUserFieldsContact}
				<a href="#" onclick="return ls.userfield.addFormField();">{$aLang.user_field_add}</a>
			{/if}
		</fieldset>
	</div>


	<div class="wrapper-content form-actions">
		<script type="text/javascript">
			jQuery(function($){
				$('#avatar-upload').file({ name:'avatar' }).choose(function(e, input) {
					ls.user.uploadAvatar(null,input);
				});
			});
		</script>

		{hook run='form_settings_profile_end'}
	
		<button type="submit" name="submit_profile_edit" class="btn btn-primary" />{$aLang.settings_profile_submit}</button>
	</div>
</form>

{hook run='settings_profile_end'}

{/block}

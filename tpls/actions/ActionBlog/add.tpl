{extends file="_index.tpl"}

{block name="layout_vars"}
    {if $sEvent=='add'}
        {$menu_content="create"}
    {/if}
{/block}

{block name="layout_content"}

{if $sEvent!='add'}
	{include file='menus/menu.blog_edit.tpl'}
{/if}

{include file='editor.tpl' sImgToLoad='blog_description' sSettingsTinymce='ls.settings.getTinymceComment()' sSettingsMarkitup='ls.settings.getMarkitupComment()'}
	
<script type="text/javascript">
	jQuery(document).ready(function($){
		ls.lang.load({lang_load name="blog_create_type_open_notice,blog_create_type_close_notice"});
		ls.blog.loadInfoType($('#blog_type').val());
	});
</script>

<form method="post" enctype="multipart/form-data" class="wrapper-content">
	{hook run='form_add_blog_begin'}
	
	<input type="hidden" name="security_key" value="{$ALTO_SECURITY_KEY}" />

	<p>
        <label for="blog_title">{$aLang.blog_create_title}:</label>
	<input type="text" id="blog_title" name="blog_title" value="{$_aRequest.blog_title}" 
               class="input-block-level" />
	<span class="help-block"><small>{$aLang.blog_create_title_notice}</small></span>
        </p>
	
	<p>
        <label for="blog_url">{$aLang.blog_create_url}:</label>
	<input type="text" id="blog_url" name="blog_url" value="{$_aRequest.blog_url}" 
               class="input-block-level" 
               {if $_aRequest.blog_id and !$oUserCurrent->isAdministrator()}disabled{/if} />
	<span class="help-block"><small>{$aLang.blog_create_url_notice}</small></span></p>
	
        <p>
        <label for="blog_type">{$aLang.blog_create_type}:</label>
	<select name="blog_type" id="blog_type" class="input-width-200"
                onChange="ls.blog.loadInfoType(jQuery(this).val());">
            {foreach $aBlogTypes as $oBlogType}
                <option value="{$oBlogType->getTypeCode()}"
                        {if $_aRequest.blog_type=={$oBlogType->getTypeCode()}}selected{/if}>
                    {$oBlogType->getName()}
                </option>
            {/foreach}
        </select>
	<span class="help-block"><small>{$aLang.blog_create_type_open_notice}</small></span>
        </p>
	
	<p>
        <label for="blog_description">{$aLang.blog_create_description}:</label>
	<textarea name="blog_description" id="blog_description" rows="15" 
                  class="input-text input-width-full js-editor-wysiwyg js-editor-markitup input-width-full">{$_aRequest.blog_description}</textarea>
	<span class="help-block"><small>{$aLang.blog_create_description_notice}</small></span>
        </p>
	
	<p>
        <label for="blog_limit_rating_topic">{$aLang.blog_create_rating}:</label>
	<input type="text" id="blog_limit_rating_topic" name="blog_limit_rating_topic" 
               value="{$_aRequest.blog_limit_rating_topic}" class="span4" />
	<span class="help-block"><small>{$aLang.blog_create_rating_notice}</small></span>
        </p>

	<p>
		{if $oBlogEdit AND $oBlogEdit->getAvatar()}
			<div class="avatar-edit">
				<img src="{$oBlogEdit->getAvatarUrl(100)}">
				
				<label class="checkbox"><input type="checkbox" id="avatar_delete" name="avatar_delete" value="on" 
                                       class="input-checkbox">{$aLang.blog_create_avatar_delete}</label>
			</div>
		{/if}
		
		<label for="avatar">{$aLang.blog_create_avatar}:</label>
		<input type="file" name="avatar" id="avatar">
	</p>


	{hook run='form_add_blog_end'}
	<br />
	
	<button type="submit" name="submit_blog_add" class="btn btn-primary">{$aLang.blog_create_submit}</button>
</form>


{/block}

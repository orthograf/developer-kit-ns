{include file='header.tpl'}
{include file='menu.talk.tpl'}


{include file='actions/ActionTalk/friends.tpl'}

{hook run='talk_add_begin'}

<div class="topic" style="display: none;">
	<div class="content" id="text_preview"></div>
</div>

{include file='inc.editor.tpl' sImgToLoad='talk_text'}

<form action="" method="POST" enctype="multipart/form-data" class="wrapper-content form-actions">
	{hook run='form_add_talk_begin'}
	
	<input type="hidden" name="security_key" value="{$ALTO_SECURITY_KEY}" />

	<p><label for="talk_users">{$aLang.talk_create_users}:</label>
	<input type="text" class="input-block-level autocomplete-users-sep" id="talk_users" name="talk_users" value="{$_aRequest.talk_users}" /></p>

	<p><label for="talk_title">{$aLang.talk_create_title}:</label>
	<input type="text" class="input-block-level" id="talk_title" name="talk_title" value="{$_aRequest.talk_title}" /></p>

	 <p>
        <label for="talk_text">{$aLang.talk_create_text}:</label>
        <textarea name="talk_text" id="talk_text" rows="12"
                  class="input-text input-width-full js-editor-wysiwyg js-editor-markitup input-width-full">{$_aRequest.talk_text}</textarea>
         </p>
	{hook run='form_add_talk_end'}
	
	<button type="submit" class="btn btn-primary" name="submit_talk_add">{$aLang.talk_create_submit}</button>
	<button type="submit" class="btn" name="submit_preview" onclick="jQuery('#text_preview').parent().show(); ls.tools.textPreview('talk_text',false); return false;">{$aLang.topic_create_submit_preview}</button>		
</form>

{hook run='talk_add_end'}


{include file='footer.tpl'}

{if !$sImgToLoad}
    {assign var="sImgToLoad" value="topic_text"}
{/if}
{include file='modals/window_load_img.tpl' sToLoad=$sImgToLoad}

{if Config::Get('view.wysiwyg')}
    {include file="editors/editor.tinymce.tpl"}
{else}
    {include file="editors/editor.markitup.tpl"}
{/if}

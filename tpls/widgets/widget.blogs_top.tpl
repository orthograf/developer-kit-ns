<ul class="unstyled item-list">
	{foreach from=$aBlogs item=oBlog}
		<li>
			<a href="{$oBlog->getUrlFull()}"><img src="{$oBlog->getAvatarPath(48)}" class="avatar" /></a>
			
			<a href="{$oBlog->getUrlFull()}" class="blog-top" >{$oBlog->getTitle()|escape:'html'}</a>
			{if $oBlog->getType()=='close'}<i title="{$aLang.blog_closed}" class="icon icon-lock muted"></i>{/if}
			
			<p class="muted"><small>{$aLang.blog_rating}: <strong>{$oBlog->getRating()}</strong></small></p>
		</li>
	{/foreach}
</ul>

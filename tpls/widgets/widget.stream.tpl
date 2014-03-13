<section class="block block-type-stream">
	<header class="block-header">
		<h3><a href="{router page='comments'}" title="{$aLang.block_stream_comments_all}">{$aLang.block_stream}</a></h3>
		<div class="icon-refresh muted block-update js-block-stream-update"></div>
	</header>

	{hook run='block_stream_nav_item' assign="sItemsHook"}
	
	<div class="block-content">
		<ul class="nav nav-pills block-content-navs js-block-stream-nav" {if $sItemsHook}style="display: none;"{/if}>
			<li class="active js-block-stream-item" data-type="comment"><a href="#">{$aLang.block_stream_comments}</a></li>
			<li class="js-block-stream-item" data-type="topic"><a href="#">{$aLang.block_stream_topics}</a></li>
			{$sItemsHook}
		</ul>
		
		<div class="block-content-body js-block-stream-content">
			{$sStreamComments}
		</div>
	</div>
</section>
        
               
     


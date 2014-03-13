{if $aPaging and $aPaging.iCountPage>1} 
	<div class="pagination">
	
		<ul>
			{if $aPaging.iPrevPage}
				<li class="prev"><a href="{$aPaging.sBaseUrl}/page{$aPaging.iPrevPage}/{$aPaging.sGetParams}" class="js-paging-prev-page" title="{$aLang.paging_previos}">&larr;</a></li>
			{else}
				<li class="muted prev"><span>&larr;</span></li>
			{/if}
		
			{if $aPaging.iCurrentPage>1}<li><a href="{$aPaging.sBaseUrl}/{$aPaging.sGetParams}" title="{$aLang.paging_first}">...</a></li>{/if}
		
			{foreach from=$aPaging.aPagesLeft item=iPage}
				<li><a href="{$aPaging.sBaseUrl}/page{$iPage}/{$aPaging.sGetParams}">{$iPage}</a></li>
			{/foreach}
		
			<li class="active"><span>{$aPaging.iCurrentPage}</span></li>
		
			{foreach from=$aPaging.aPagesRight item=iPage}
				<li><a href="{$aPaging.sBaseUrl}/page{$iPage}/{$aPaging.sGetParams}">{$iPage}</a></li>
			{/foreach}
		
			{if $aPaging.iCurrentPage<$aPaging.iCountPage}<li><a href="{$aPaging.sBaseUrl}/page{$aPaging.iCountPage}/{$aPaging.sGetParams}" title="{$aLang.paging_last}">...</a></li>{/if}					
		
			{if $aPaging.iNextPage}
				<li class="next"><a href="{$aPaging.sBaseUrl}/page{$aPaging.iNextPage}/{$aPaging.sGetParams}" class="js-paging-next-page" title="{$aLang.paging_next}">&rarr;</a></li>
			{else}
				<li class="muted next"><span>&rarr;</span></li>
			{/if}
		</ul>
		
	</div>
{/if}

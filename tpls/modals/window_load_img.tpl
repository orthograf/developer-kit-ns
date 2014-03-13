<div class="modal modal-image-upload" id="window_upload_img">
	<div class="modal-dialog">
        <div class="modal-content">
		
		<header class="modal-header">
		<button type="button" class="close jqmClose" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>{$aLang.uploadimg}</h3>
	</header>
	
	<div class="modal-body">
		<ul class="nav nav-pills">
			<li class="active js-block-upload-img-item" data-type="pc"><a href="#">{$aLang.uploadimg_from_pc}</a></li>
			<li class="js-block-upload-img-item" data-type="link"><a href="#">{$aLang.uploadimg_from_link}</a></li>
		</ul>
	
		<form method="POST" action="" enctype="multipart/form-data" id="block_upload_img_content_pc" onsubmit="return false;" class="tab-content js-block-upload-img-content" data-type="pc">
			<p><label for="img_file">{$aLang.uploadimg_file}:</label>
			<input type="file" name="img_file" id="img_file" value="" /></p>
			
			{hook run="uploadimg_source"}
			
			<label for="form-image-align">{$aLang.uploadimg_align}:</label>
			<select name="align" id="form-image-align" class="input-block-level">
				<option value="">{$aLang.uploadimg_align_no}</option>
				<option value="left">{$aLang.uploadimg_align_left}</option>
				<option value="right">{$aLang.uploadimg_align_right}</option>
				<option value="center">{$aLang.uploadimg_align_center}</option>
			</select>
			
			<p><label for="form-image-title">{$aLang.uploadimg_title}:</label>
			<input type="text" name="title" id="form-image-title" value="" class="input-block-level" /></p>
			
			{hook run="uploadimg_additional"}
			
			<button type="submit" class="btn btn-primary" onclick="ls.ajaxUploadImg('block_upload_img_content_pc','{$sToLoad}');">{$aLang.uploadimg_submit}</button>
			<button type="submit" class="btn jqmClose">{$aLang.uploadimg_cancel}</button>
		</form>
		
		
		<form method="POST" action="" enctype="multipart/form-data" id="block_upload_img_content_link" onsubmit="return false;" style="display: none;" class="tab-content js-block-upload-img-content" data-type="link">
			<label for="img_file">{$aLang.uploadimg_url}:</label>
			<input type="text" name="img_url" id="img_url" value="http://" class="input-block-level" />

			<label for="form-image-url-align">{$aLang.uploadimg_align}:</label>
			<select name="align" id="form-image-url-align" class="input-block-level">
				<option value="">{$aLang.uploadimg_align_no}</option>
				<option value="left">{$aLang.uploadimg_align_left}</option>
				<option value="right">{$aLang.uploadimg_align_right}</option>
				<option value="center">{$aLang.uploadimg_align_center}</option>
			</select>

			<p><label for="form-image-url-title">{$aLang.uploadimg_title}:</label>
				<input type="text" name="title" id="form-image-url-title" value="" class="input-block-level" /></p>

			{hook run="uploadimg_link_additional"}

			<button type="submit" class="btn btn-primary" onclick="ls.topic.insertImageToEditor(jQuery('#img_url').val(),jQuery('#form-image-url-align').val(),jQuery('#form-image-url-title').val());">{$aLang.uploadimg_link_submit_paste}</button>
			{$aLang.or}
			<button type="submit" class="btn btn-primary" onclick="ls.ajaxUploadImg('block_upload_img_content_link','{$sToLoad}');">{$aLang.uploadimg_link_submit_load}</button>
			<button type="submit" class="btn jqmClose">{$aLang.uploadimg_cancel}</button>
		</form>
	</div>
	
	<footer class="modal-footer"></footer>
</div>
	</div></div>
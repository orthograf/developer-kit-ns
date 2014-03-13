{if $oField}
	{assign var=field_id value=$oField->getFieldId()}

	<p>
        <label for="properties-{$oField->getFieldId()}">{$oField->getFieldName()}:</label>
	    <textarea class="mce-editor markitup-editor input-block-level" name="fields[{$oField->getFieldId()}]" id="properties-{$oField->getFieldId()}" rows="5">{if $_aRequest.fields.$field_id}{$_aRequest.fields.$field_id}{elseif $oTopic && $oTopic->getExtraField($oField->getFieldId())}{$oTopic->getExtraField($oField->getFieldId())}{/if}</textarea>
	    <small class="help-block">{$oField->getFieldDescription()}</small>
	</p>


{/if}
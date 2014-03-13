{if $oField}
	{assign var=field_id value=$oField->getFieldId()}

	<p>
        <label for="fields-{$oField->getFieldId()}">{$oField->getFieldName()}:</label>
	    <input type="text" class="input-block-level" name="fields[{$oField->getFieldId()}]" id="fields-{$oField->getFieldId()}" value="{if $_aRequest.fields.$field_id}{$_aRequest.fields.$field_id}{/if}"/>
        <small class="help-block">{$oField->getFieldDescription()}</small>
    </p>

{/if}
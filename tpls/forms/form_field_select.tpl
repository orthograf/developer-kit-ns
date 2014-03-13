{if $oField}
	{assign var=field_id value=$oField->getFieldId()}

	<p>
        <label for="properties-{$oField->getFieldId()}">{$oField->getFieldName()}:</label>
	    <select name="fields[{$oField->getFieldId()}]" id="properties-{$oField->getFieldId()}" >
		    {foreach from=$oField->getSelectVal() item=sValue}
		    <option value="{$sValue}" {if $_aRequest.fields.$field_id==$sValue || ($oTopicEdit && $oTopicEdit->getExtraValueCck($oField->getFieldId()))}selected{/if}>{$sValue}</option>
		    {/foreach}
	    </select>
        <small class="help-block">{$oField->getFieldDescription()}</small>
	</p>
{/if}
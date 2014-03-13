<ul class="unstyled poll-result" id="poll-result-original-{$oTopic->getId()}">
	{foreach from=$oTopic->getQuestionAnswers() key=key item=aAnswer}
		<li {if $oTopic->getQuestionAnswerMax()==$aAnswer.count}class="most"{/if}>
			<strong>{$aAnswer.text|escape:'html'}</strong> <span class="muted">({$aAnswer.count})</span>
			<span class="pull-right">{$oTopic->getQuestionAnswerPercent($key)}%</span>
			<div class="progress {if $oTopic->getQuestionAnswerMax()==$aAnswer.count}progress-success{else}progress-info{/if}">
				<div class="bar" style="width: {$oTopic->getQuestionAnswerPercent($key)}%;"></div>
			</div>
		</li>
	{/foreach}
</ul>


<ul class="unstyled poll-result" id="poll-result-sort-{$oTopic->getId()}" style="display: none;">
	{foreach from=$oTopic->getQuestionAnswers(true) key=key item=aAnswer}
		<li {if $oTopic->getQuestionAnswerMax()==$aAnswer.count}class="most"{/if}>
			<strong>{$aAnswer.text|escape:'html'}</strong> <span class="muted">({$aAnswer.count})</span>
			<span class="pull-right">{$oTopic->getQuestionAnswerPercent($key)}%</span>
			<div class="progress {if $oTopic->getQuestionAnswerMax()==$aAnswer.count}progress-success{else}progress-info{/if}">
				<div class="bar" style="width: {$oTopic->getQuestionAnswerPercent($key)}%;"></div>
			</div>
		</li>
	{/foreach}
</ul>

<button type="submit" class="btn btn-icon" title="{$aLang.topic_question_vote_result_sort}" onclick="return ls.poll.switchResult(this, {$oTopic->getId()});"><i class="icon-align-left"></i></button>

<span class="muted pull-right poll-total poll-total-result"><small>{$aLang.topic_question_vote_result}: {$oTopic->getQuestionCountVote()} | {$aLang.topic_question_abstain_result}: {$oTopic->getQuestionCountVoteAbstain()}</small></span>
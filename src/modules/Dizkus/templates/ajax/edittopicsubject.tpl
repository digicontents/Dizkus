<div style="font-size:12px; letter-spacing:0; margin-top:5px; text-align:left;" id="topicsubjectedit_editor">
    <form id="topicsubject_{$topic.topic_id}_form" class="dzk_form" action="javascript:void(0);">
        <div>
            <input type="text" style="width: 50%;" id="topicsubjectedit_subject" name="topicsubjectedit_subject" value="{$topic.topic_title|safetext}" />
            <button class="dzk_img ok" type="submit"    id="topicsubjectedit_save">{gt text="Submit"}</button>
            <button class="dzk_img cancel" type="reset" id="topicsubjectedit_cancel">{gt text="Cancel"}</button>
            <input type="hidden" id="topicsubjectedit_authid" name="topicsubjectedit_authid" value="{insert name='generateauthkey' module='Dizkus'}" />
        </div>
    </form>
</div>

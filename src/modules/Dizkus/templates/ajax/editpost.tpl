<div class="dzk_ajaxeditpost" id="postingtext_{$post.post_id}_editor">
    <div class="ajaxeditpoststatusbox">
        <strong>{gt text="Status"}:</strong> <span id="postingtext_{$post.post_id}_status">{gt text="Unchanged"}</span>
    </div>
    {notifydisplayhooks eventname='dizkus.ui_hooks.editor.display_view' id=$postingtextareaid}	
    <textarea id="{$postingtextareaid}" class="dzk_texpand" rows="10" cols="60" name="postingtext_{$post.post_id}_edit">{$post.post_rawtext}</textarea>
    <div class="dzk_subcols z-clearfix">
        <div id="editpostoptions" class="dzk_col_left">
            <ul>
                <li><input type="checkbox" name="attach_signature" id="postingtext_{$post.post_id}_attach_signature" {if $post.has_signature eq true}checked="checked"{/if} value="1" /><label for="postingtext_{$post.post_id}_attach_signature">&nbsp;{gt text="Attach my signature"}</label></li>
                {if $post.poster_data.moderate eq true}
                <li><input id="postingtext_{$post.post_id}_delete" type="checkbox"  value="1" /><label for="postingtext_{$post.post_id}_delete">&nbsp;{gt text="Delete post"}</label></li>
                {/if}
                <li id="quickreplybuttons">
                    <button class="dzk_img ok"  type="submit" name="submit" id="postingtext_{$post.post_id}_save" type="button" value="{gt text="Submit"}">{gt text="Submit"}</button>
                    <button class="dzk_img cancel" type="submit" name="submit" id="postingtext_{$post.post_id}_cancel" type="button" value="{gt text="Cancel"}">{gt text="Cancel"}</button>
                </li>
            </ul>
        </div>
    </div>
</div>

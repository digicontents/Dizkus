<?php
/**
 * pnForum
 *
 * @copyright (c) 2001-now, pnForum Development Team
 * @link http://www.pnforum.de
 * @version $Id$
 * @license GNU/GPL - http://www.gnu.org/copyleft/gpl.html
 * @package pnForum
 */

/**
 * jumpbox plugin
 * creates a dropdown list with all available forums for the current user.
 * seleting a forum issue a direct forward to the viewforum() function
 *
 */
function smarty_function_jumpbox($params, &$smarty)
{
    extract($params);
	unset($params);

    if(!pnModAPILoad('pnForum', 'admin')) {
        $smarty->trigger_error("loading pnForum adminapi failed");
        return;
    }

    $out = "";
    $forums = pnModAPIFunc('pnForum', 'admin', 'readforums');
    if(count($forums)>0) {
        include_once('modules/pnForum/common.php');
        $out ='<form action="' . DataUtil::formatForDisplay(pnModURL('pnForum', 'user', 'viewforum')) . '" method="get">
               <label for="pnforum_forum"><strong>' . DataUtil::formatForDisplay(_PNFORUM_FORUM) . ': </strong></label>
               <select name="forum" id="pnforum_forum" onchange="location.href=this.options[this.selectedIndex].value">
	           <option value="'.DataUtil::formatForDisplay(pnModURL('pnForum', 'user', 'main')).'">' . DataUtil::formatForDisplay(_PNFORUM_QUICKSELECTFORUM) . '</option>';
        foreach($forums as $forum) {
            if(allowedtoreadcategoryandforum($forum['cat_id'], $forum['forum_id'])) {
            	$out .= '<option value="' . DataUtil::formatForDisplay(pnModURL('pnForum', 'user', 'viewforum', array('forum' => $forum['forum_id']))) . '">' . DataUtil::formatForDisplay($forum['cat_title']) . '&nbsp;::&nbsp;' . DataUtil::formatForDisplay($forum['forum_name']) . '</option>';
            }
        }
        $out .= '</select>
                 </form>';
    }
    return $out;

}

<?php
/**
 * Dizkus
 *
 * @copyright (c) 2001-now, Dizkus Development Team
 * @link http://code.zikula.org/dizkus
 * @version $Id: function.adminlink.php 1338 2010-07-15 17:52:38Z Landseer $
 * @license GNU/GPL - http://www.gnu.org/copyleft/gpl.html
 * @package Dizkus
 */

// id, type
/**
 * adminlink plugin
 * adds a link to the configuration of a category or forum
 *
 * @params $params['type'] string, either 'category' or 'forum'
 * @params $params['id']   int     category or forum id, depending of $type
 */ 
function smarty_function_getForumName($params, &$smarty) 
{
    extract($params);
    $forum = DBUtil::selectObjectByID('dizkus_forums', $id, 'forum_id');
    $url = ModUtil::url('Dizkus', 'user', 'viewforum', array('forum'=>$id));
    return '<a href="'.$url.'">'.$forum['forum_name'].'</a>';
}

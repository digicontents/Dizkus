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
function smarty_function_adminlink($params, &$smarty) 
{
    if (SecurityUtil::checkPermission(0, 'Dizkus::', "::", ACCESS_ADMIN)) { 
        if (empty($params['id']) || empty($params['type'])) {
            $smarty->trigger_error(__("Error! Missing parameter(s) for admin link."));
            return;
        }
        
        if ($params['type'] == 'category') {
            return '<a href="' . DataUtil::formatForDisplay(ModUtil::url('Dizkus', 'admin', 'category', array('cat_id'=>(int)$params['id']))) . '">[' . DataUtil::formatForDisplay(__('Edit category title')) . ']</a>';
        } elseif ($params['type'] == 'forum') {
            return '<a href="' . DataUtil::formatForDisplay(ModUtil::url('Dizkus', 'admin', 'forum', array('forum_id' => (int)$params['id']))) . '">['.DataUtil::formatForDisplay(__('Edit forum')) . ']</a>';
        }
    }

    return;
}

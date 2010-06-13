<?php
/**
 * Dizkus
 *
 * @copyright (c) 2001-now, Dizkus Development Team
 * @link http://code.zikula.org/dizkus
 * @version $Id$
 * @license GNU/GPL - http://www.gnu.org/copyleft/gpl.html
 * @package Dizkus
 */

include_once 'modules/Dizkus/common.php';

class Dizkus_Hook extends Zikula_Controller {
    
    /**
     * showdiscussionlink
     * displayhook function
     *
     * @params $objectid string the id of the item to be discussed in the forum
     */
    public function showdiscussionlink($args)
    {
        if (!isset($args['objectid']) || empty($args['objectid']) ) {
            return showforumerror($this->__('Error! The action you wanted to perform was not successful for some reason, maybe because of a problem with what you input. Please check and try again.'), __FILE__, __LINE__);
        }
    
        $topic_id = ModUtil::apiFunc('Dizkus', 'user', 'get_topicid_by_reference',
                                 array('reference' => ModUtil::getIDFromName(ModUtil::getName()) . '-' . $args['objectid']));
    
        if ($topic_id <> false) {
            list($last_visit, $last_visit_unix) = ModUtil::apiFunc('Dizkus', 'user', 'setcookies');
    
            $topic = ModUtil::apiFunc('Dizkus', 'user', 'readtopic',
                                  array('topic_id'   => $topic_id,
                                        'count'      => false));
    
            $render = pnRender::getInstance('Dizkus', false, null, true);
    
            $render->assign('topic', $topic);
    
            return $render->fetch('dizkus_hook_display.html');
        }
    
        return false;
    }

}
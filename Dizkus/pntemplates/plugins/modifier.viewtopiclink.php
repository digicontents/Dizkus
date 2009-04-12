<?php
/**
 * Dizkus
 *
 * @copyright (c) 2001-now, Dizkus Development Team
 * @link http://www.dizkus.com
 * @version $Id$
 * @license GNU/GPL - http://www.gnu.org/copyleft/gpl.html
 * @package Dizkus
 */

/**
 * pnRender plugin
 *
 * This file is a plugin for pnRender, the Zikula implementation of Smarty
 *
 * @package      Xanthia_Templating_Environment
 * @subpackage   pnRender
 * @version      $Id$
 * @author       The Zikula development team
 * @link         http://www.zikula.org  The Zikula Home Page
 * @copyright    Copyright (C) 2002 by the Zikula Development Team
 * @license      http://www.gnu.org/copyleft/gpl.html GNU General Public License
 */


/**
 * Smarty modifier to create a link to a topic
 *
 * Available parameters:

 * Example
 *
 *   <!--[$topic_id|viewtopiclink]-->
 *
 *
 * @author       Frank Schummertz
 * @author       The Dizkus team
 * @since        16. Sept. 2003
 * @param        array    $string     the contents to transform
 * @return       string   the modified output
 */
function smarty_modifier_viewtopiclink($topic_id=null, $subject=null, $forum_name=null, $class=null, $start=null, $last_post_id=null)
{
    if(!isset($topic_id)) {
        return '';
    }

    if(isset($class) && !empty($class)) {
        $class = 'class="' . DataUtil::formatForDisplay($class) . '"';
    }

    $args = array('topic' => (int)$topic_id);
    if(isset($start)) {
        $args['start'] = (int)$start;
    }

    $url = pnModURL('Dizkus', 'user', 'viewtopic', $args);
    if(isset($last_post_id)) {
        $url .= '#pid' . (int)$last_post_id;
    }
    $title = _DZK_GOTO_TOPIC;
    if(isset($forum_name) && !empty($forum_name)) {
        $title .= ' ' . DataUtil::formatForDisplay($forum_name) . ' ::';
    }
    if(isset($subject) && !empty($subject)) {
        $subject = DataUtil::formatForDisplay($subject);
        $title .= ' ' . $subject;
    }
    return '<a '. $class .' href="' . DataUtil::formatForDisplay($url) . '" title="' . $title .'">' . $subject . '</a>';
}

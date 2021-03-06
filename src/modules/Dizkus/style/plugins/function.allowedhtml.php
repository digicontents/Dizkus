<?php
/**
 * Dizkus
 *
 * @copyright (c) 2001-now, Dizkus Development Team
 * @link http://code.zikula.org/dizkus
 * @version $Id: function.allowedhtml.php 1338 2010-07-15 17:52:38Z Landseer $
 * @license GNU/GPL - http://www.gnu.org/copyleft/gpl.html
 * @package Dizkus
 */

/**
 * allowedhtml plugin
 * lists all allowed html tags
 *
 */
function smarty_function_allowedhtml($params, &$smarty) 
{
    $out = "<br />".__('Allowed HTML:')."<br />";
    $AllowableHTML = System::getVar('AllowableHTML');
    while (list($key, $access, ) = each($AllowableHTML)) {
    	if ($access > 0) $out .= " &lt;".$key."&gt;";
    }

    return $out;
}

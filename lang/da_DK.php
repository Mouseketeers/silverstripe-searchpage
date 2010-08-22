<?php

/**
 * Danish (Denmark) language pack
 * @package modules: search
 * @subpackage i18n
 */

i18n::include_locale_file('modules: search', 'en_US');

global $lang;

if(array_key_exists('da_DK', $lang) && is_array($lang['da_DK'])) {
	$lang['da_DK'] = array_merge($lang['en_US'], $lang['da_DK']);
} else {
	$lang['da_DK'] = $lang['en_US'];
}
$lang['da_DK']['Search']['INLINELABEL'] = 'Indtast søgeord';
?>
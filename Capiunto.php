<?php
/**
 * Initialization file for the Capiunto extension.
 *
 * @license GPL-2.0-or-later
 *
 * @author Marius Hoch < hoo@online.de >
 */

if ( function_exists( 'wfLoadExtension' ) ) {
	wfLoadExtension( 'Capiunto' );
	// Keep i18n globals so mergeMessageFileList.php doesn't break
	$wgMessagesDirs['Capiunto'] = __DIR__ . '/i18n';
	wfWarn(
		'Deprecated PHP entry point used for Capiunto extension. Please use wfLoadExtension instead, ' .
		'see https://www.mediawiki.org/wiki/Extension_registration for more details.'
	);
	return;
} else {
	die( 'This version of the Capiunto extension requires MediaWiki 1.25+' );
}

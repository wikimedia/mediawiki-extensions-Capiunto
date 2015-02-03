<?php
namespace Capiunto;

use OutputPage;
use Skin;
use RecursiveIteratorIterator;
use RecursiveDirectoryIterator;

/**
 * File defining the hook handlers for the Capiunto extension.
 *
 * @license GNU GPL v2+
 *
 * @author Marius Hoch < hoo@online.de >
 */
class Hooks {
	/**
	 * Hook to add PHPUnit test cases.
	 * @see https://www.mediawiki.org/wiki/Manual:Hooks/UnitTestsList
	 *
	 * @param string[] &$paths
	 *
	 * @return bool
	 */
	public static function registerUnitTests( array &$paths ) {
		$paths[] = __DIR__ . '/../tests/phpunit/';

		return true;
	}

	/**
	 * External Lua library for Scribunto
	 *
	 * @param string $engine
	 * @param array $extraLibraries
	 * @return bool
	 */
	public static function registerScribuntoLibraries( $engine, array &$extraLibraries ) {
		if ( $engine !== 'lua' ) {
			return true;
		}

		$extraLibraries['capiunto'] = array(
			'class' => '\Capiunto\LuaLibrary',
			'deferLoad' => true
		);

		return true;
	}

	/**
	 * External Lua library paths for Scribunto
	 *
	 * @param string $engine
	 * @param array $extraLibraryPaths
	 * @return bool
	 */
	public static function registerScribuntoExternalLibraryPaths( $engine, array &$extraLibraryPaths ) {
		if ( $engine !== 'lua' ) {
			return true;
		}

		// Path containing pure Lua libraries that don't need to interact with PHP
		$extraLibraryPaths[] = __DIR__ . '/lua/pure';

		return true;
	}

	/**
	 * Adds css for infoboxes.
	 * @see https://www.mediawiki.org/wiki/Manual:Hooks/BeforePageDisplay
	 *
	 * @param OutputPage &$out
	 * @param Skin &$skin
	 *
	 * @return bool
	 */
	public static function onBeforePageDisplay( OutputPage &$out, Skin &$skin ) {
		// @FIXME: Find a way to do this conditionally from Lua
		$out->addModules( 'capiunto.infobox.main' );
		return true;
	}

}

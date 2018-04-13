<?php

namespace Capiunto;

/**
 * File defining the hook handlers for the Capiunto extension.
 *
 * @license GPL-2.0-or-later
 *
 * @author Marius Hoch < hoo@online.de >
 */
class Hooks {

	/**
	 * External Lua library for Scribunto
	 *
	 * @param string $engine
	 * @param array &$extraLibraries
	 * @return bool
	 */
	public static function registerScribuntoLibraries( $engine, array &$extraLibraries ) {
		if ( $engine !== 'lua' ) {
			return true;
		}

		$extraLibraries['capiunto'] = [
			'class' => LuaLibrary::class,
			'deferLoad' => true
		];

		return true;
	}

	/**
	 * External Lua library paths for Scribunto
	 *
	 * @param string $engine
	 * @param array &$extraLibraryPaths
	 * @return bool
	 */
	public static function registerScribuntoExternalLibraryPaths(
		$engine,
		array &$extraLibraryPaths
	) {
		if ( $engine !== 'lua' ) {
			return true;
		}

		// Path containing pure Lua libraries that don't need to interact with PHP
		$extraLibraryPaths[] = __DIR__ . '/lua/pure';

		return true;
	}

}

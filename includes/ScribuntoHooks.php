<?php

namespace Capiunto;

use MediaWiki\Extension\Scribunto\Hooks\ScribuntoExternalLibrariesHook;
use MediaWiki\Extension\Scribunto\Hooks\ScribuntoExternalLibraryPathsHook;

/**
 * File defining the hook handlers for the Capiunto extension.
 * All hooks from the Scribunto extension which is optional to use with this extension.
 *
 * @license GPL-2.0-or-later
 *
 * @author Marius Hoch < hoo@online.de >
 */
class ScribuntoHooks implements
	ScribuntoExternalLibrariesHook,
	ScribuntoExternalLibraryPathsHook
{

	/**
	 * External Lua library for Scribunto
	 *
	 * @param string $engine
	 * @param array &$extraLibraries
	 */
	public function onScribuntoExternalLibraries( string $engine, array &$extraLibraries ): void {
		if ( $engine !== 'lua' ) {
			return;
		}

		$extraLibraries['capiunto'] = [
			'class' => LuaLibrary::class,
			'deferLoad' => true
		];
	}

	/**
	 * External Lua library paths for Scribunto
	 *
	 * @param string $engine
	 * @param array &$extraLibraryPaths
	 */
	public function onScribuntoExternalLibraryPaths(
		string $engine,
		array &$extraLibraryPaths
	): void {
		if ( $engine !== 'lua' ) {
			return;
		}

		// Path containing pure Lua libraries that don't need to interact with PHP
		$extraLibraryPaths[] = __DIR__ . '/lua/pure';
	}

}

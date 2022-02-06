<?php

namespace Capiunto;

use Scribunto_LuaLibraryBase;

/**
 * Registers our lua modules to Scribunto
 *
 * @license GPL-2.0-or-later
 * @author Marius Hoch < hoo@online.de >
 */

class LuaLibrary extends Scribunto_LuaLibraryBase {

	/**
	 * Register the library
	 *
	 * @return array
	 */
	public function register() {
		return $this->getEngine()->registerInterface(
			__DIR__ . '/lua/Infobox.lua',
			[
				'addResourceLoaderModules' => [ $this, 'addResourceLoaderModules' ]
			],
			[]
		);
	}

	/**
	 * Allows Lua to dynamically add the RL modules required for Infoboxes.
	 */
	public function addResourceLoaderModules() {
		$this->getParser()->getOutput()->addModuleStyles( [ 'capiunto.infobox.main' ] );
	}

}

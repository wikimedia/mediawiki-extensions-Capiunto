<?php

namespace Capiunto;

use Scribunto_LuaLibraryBase;

/**
 * Registers our lua modules to Scribunto
 *
 * @licence GNU GPL v2+
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
			array(),
			array()
		);
	}

}

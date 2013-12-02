<?php

namespace Capiunto;

use Scribunto_LuaLibraryBase;

/**
 * Registers and defines functions to Scriunto
 *
 * @licence GNU GPL v2+
 * @author Marius Hoch < hoo@online.de >
 */

class LuaLibrary extends Scribunto_LuaLibraryBase {

	/**
	 * Register the library
	 */
	public function register() {
		$this->getEngine()->registerInterface( __DIR__ . '/../resources/' . 'htmlBuilder.lua', array(), array() );
		$this->getEngine()->registerInterface( __DIR__ . '/../resources/' . 'infobox.lua', array(), array() );
	}

}

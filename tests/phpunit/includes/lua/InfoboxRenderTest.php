<?php

namespace Capiunto\Test;

use Scribunto_LuaEngineTestBase;

/**
 * Tests for mw.capiunto.Infobox._render
 *
 * @license GPL-2.0-or-later
 *
 * @author Marius Hoch < hoo@online.de >
 */
class InfoboxRenderModuleTest extends Scribunto_LuaEngineTestBase {

	protected static $moduleName = 'InfoboxRenderModuleTests';

	function getTestModules() {
		return parent::getTestModules() + [
			'InfoboxRenderModuleTests' => __DIR__ . '/InfoboxRenderTests.lua',
		];
	}

}

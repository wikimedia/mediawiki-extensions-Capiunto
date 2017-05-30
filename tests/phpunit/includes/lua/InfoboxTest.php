<?php

namespace Capiunto\Test;

use Scribunto_LuaEngineTestBase;

/**
 * Tests for capiunto
 *
 * @license GNU GPL v2+
 *
 * @author Marius Hoch < hoo@online.de >
 */
class InfoboxModuleTest extends Scribunto_LuaEngineTestBase {

	protected static $moduleName = 'InfoboxModuleTests';

	function getTestModules() {
		return parent::getTestModules() + [
			'InfoboxModuleTests' => __DIR__ . '/InfoboxTests.lua',
		];
	}

}

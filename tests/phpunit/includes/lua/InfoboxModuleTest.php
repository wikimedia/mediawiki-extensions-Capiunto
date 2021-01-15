<?php

namespace Capiunto\Test;

use Scribunto_LuaEngineTestBase;

/**
 * Tests for capiunto
 *
 * @license GPL-2.0-or-later
 *
 * @author Marius Hoch < hoo@online.de >
 *
 * @covers \Capiunto\LuaLibrary
 */
class InfoboxModuleTest extends Scribunto_LuaEngineTestBase {

	/** @inheritDoc */
	protected static $moduleName = 'InfoboxModuleTests';

	/** @inheritDoc */
	public function getTestModules() {
		return parent::getTestModules() + [
			'InfoboxModuleTests' => __DIR__ . '/InfoboxTests.lua',
		];
	}

}

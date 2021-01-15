<?php

namespace Capiunto\Test;

use Scribunto_LuaEngineTestBase;

/**
 * Tests for mw.capiunto.Infobox._render
 *
 * @license GPL-2.0-or-later
 *
 * @author Marius Hoch < hoo@online.de >
 * @coversNothing Covers lua code
 */
class InfoboxRenderModuleTest extends Scribunto_LuaEngineTestBase {

	/** @inheritDoc */
	protected static $moduleName = 'InfoboxRenderModuleTests';

	/** @inheritDoc */
	public function getTestModules() {
		return parent::getTestModules() + [
			'InfoboxRenderModuleTests' => __DIR__ . '/InfoboxRenderTests.lua',
		];
	}

}

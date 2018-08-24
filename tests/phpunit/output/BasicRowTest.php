<?php

namespace Capiunto\Test;

use HamcrestPHPUnitIntegration;
use Scribunto_LuaEngine;
use Scribunto_LuaEngineTestBase;

/**
 * A basic Infobox output test
 *
 * @license GPL-2.0-or-later
 *
 * @author Marius Hoch < hoo@online.de >
 * @coversNothing Covers lua code
 */
class BasicRowTest extends Scribunto_LuaEngineTestBase {
	use HamcrestPHPUnitIntegration;

	public function provideLuaData() {
		// We need this to override the defaults in Scribunto_LuaEngineTestBase
		return [
			[ 'a', 'b', 'c' ]
		];
	}

	/**
	 * @dataProvider provideLuaData
	 */
	public function testLua( $key, $testName, $expected ) {
		$this->assertTrue( true );
	}

	public function testOutput() {
		/** @var Scribunto_LuaEngine $engine */
		$engine = $this->getEngine();
		$interpreter = $engine->getInterpreter();

		$lua = file_get_contents( __DIR__ . '/BasicRowTest.lua' );

		list( $box ) = $interpreter->callFunction(
			$interpreter->loadString( $lua, 'Basic infobox integration test' )
		);

		$this->assertThatHamcrest(
			"Basic row infobox integration test didn't create expected html",
			$box,
			is(
				htmlPiece(
					havingChild(
						both(
							tagMatchingOutline( '<table class="mw-capiunto-infobox"/>' )
						)->andAlso(
							havingChild( withTagName( 'caption' ) )
						)
					)
				)
			)
		);
	}

}

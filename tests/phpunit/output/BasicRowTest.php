<?php

namespace Capiunto\Test;

/**
 * A basic Infobox output test
 *
 * @license GNU GPL v2+
 *
 * @author Marius Hoch < hoo@online.de >
 */
class RowInfobox extends \Scribunto_LuaEngineTestBase {
	public function provideLuaData() {
		// We need to override this to prevent the parent from doing things we don't want/need
		return array();
	}

	public function testLua() {
		$this->assertTrue( true, "Scribunto expects all tests to go through this…" );
	}

	public function testOutput() {
		$engine = $this->getEngine();
		$interpreter = $engine->getInterpreter();

		$lua = file_get_contents( __DIR__ . '/BasicRowTest.lua' );

		list( $box ) = $interpreter->callFunction(
			$interpreter->loadString( $lua, 'Basic infobox integration test' )
		);

		$this->assertValidHtmlSnippet( $box );

		$matcher = array(
			'tag' => 'table',
			'attributes' => array( 'class' => 'mw-capiunto-infobox' ),
			'descendant' => array( 'tag' => 'caption' )
		);

		$this->assertTag(
			$matcher,
			$box,
			"Basic row infobox integration test didn't create expected html"
		);

	}
}

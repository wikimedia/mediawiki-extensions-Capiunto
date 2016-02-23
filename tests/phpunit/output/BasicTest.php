<?php

namespace Capiunto\Test;

use Scribunto_LuaEngine;
use Scribunto_LuaEngineTestBase;

/**
 * A basic Infobox output test
 *
 * @license GNU GPL v2+
 *
 * @author Marius Hoch < hoo@online.de >
 */
class BasicTest extends Scribunto_LuaEngineTestBase {

	public function provideLuaData() {
		return array();
	}

	public function testLua() {
		$this->assertTrue( true );
	}

	public function testOutput() {
		/** @var Scribunto_LuaEngine $engine */
		$engine = $this->getEngine();
		$interpreter = $engine->getInterpreter();

		$lua = file_get_contents( __DIR__ . '/BasicTest.lua' );

		list( $box ) = $interpreter->callFunction(
			$interpreter->loadString( $lua, 'Basic infobox integration test' )
		);

		$this->assertValidHtmlSnippet( $box );

		$matcher = array(
			'tag' => 'table',
			'attributes' => array( 'class' => 'mw-capiunto-infobox' ),
			'descendant' => array( 'tag' => 'th' )
		);

		$this->assertTag(
			$matcher,
			$box,
			"Basic infobox integration test didn't create expected html"
		);
	}

}

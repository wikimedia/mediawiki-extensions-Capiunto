--[[
	Unit tests for the CapiuntoInfoboxRender module

	@license GNU GPL v2+
	@author Marius Hoch < hoo@online.de >
]]

local testframework = require 'Module:TestFramework'
local render = require 'CapiuntoInfoboxRender'

-- Tests

local function testRenderWrapper( options )
	local html = mw.html.create( '' )

	render.renderWrapper( html, options )
	return html
end

local function testRenderHeader( options, header, class )
	local html = mw.html.create( '' )

	render.renderHeader( html, options, header, class )
	return html
end

local function testRenderRow( options, row )
	local html = mw.html.create( '' )

	render.renderRow( html, options, row )
	return html
end

local function testRenderWikitext( text )
	local html = mw.html.create( '' )

	render.renderWikitext( html, text )
	return html
end

local function testRenderTitle( options )
	local html = mw.html.create( '' )

	render.renderTitle( html, options )
	return html
end

local function testRenderSubHeader( options )
	local html = mw.html.create( '' )

	render.renderSubHeaders( html, options )
	return html
end

local function testRenderTopRow( options )
	local html = mw.html.create( '' )

	render.renderTopRow( html, options )
	return html
end

local function testRenderBottomRow( options )
	local html = mw.html.create( '' )

	render.renderBottomRow( html, options )
	return html
end

local function testRenderImages( options )
	local html = mw.html.create( '' )

	render.renderImages( html, options )
	return html
end

local function testRenderRows( options )
	local html = mw.html.create( '' )

	render.renderRows( html, options )
	return html
end

-- Tests
local tests = {
	{ name = 'CapiuntoInfoboxRender.renderWrapper 1', func = testRenderWrapper, type='ToString',
	  args = { {} },
	  expect = { '<table class="mw-capiunto-infobox" cellspacing="3"></table>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderWrapper 2', func = testRenderWrapper, type='ToString',
	  args = { { isChild = true } },
	  expect = { '' }
	},
	{ name = 'CapiuntoInfoboxRender.renderWrapper 3', func = testRenderWrapper, type='ToString',
	  args = { { isChild = true, title = 'foo' } },
	  expect = { 'foo' }
	},
	{ name = 'CapiuntoInfoboxRender.renderWrapper 4', func = testRenderWrapper, type='ToString',
	  args = { { isSubbox = true } },
	  expect = {
		'<table class="mw-capiunto-infobox mw-capiunto-infobox-subbox" cellspacing="3"></table>'
	  }
	},
	{ name = 'CapiuntoInfoboxRender.renderHeader 1', func = testRenderHeader, type='ToString',
	  args = { {}, 'foo' },
	  expect = { '<tr><th colspan="2" class="mw-capiunto-infobox-header">foo</th></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderHeader 2', func = testRenderHeader, type='ToString',
	  args = { {}, 'foo', 'bar' },
	  expect = { '<tr><th colspan="2" class="mw-capiunto-infobox-header bar">foo</th></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderHeader 3', func = testRenderHeader, type='ToString',
	  args = { { headerStyle = 'what:ever' }, 'foo', 'bar' },
	  expect = { '<tr><th colspan="2" class="mw-capiunto-infobox-header bar" style="what:ever">foo</th></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderRow 1', func = testRenderRow, type='ToString',
	  args = { {}, { data = 'foo' } },
	  expect = { '<tr><td colspan="2" class="mw-capiunto-infobox-spanning">\nfoo</td></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderRow 2', func = testRenderRow, type='ToString',
	  args = { {}, { data = 'foo', label = 'bar' } },
	  expect = { '<tr><th scope="row" class="mw-capiunto-infobox-label">bar</th><td>\nfoo</td></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderRow 3', func = testRenderRow, type='ToString',
	  args = { { labelStyle = 'a:b' }, { data = 'foo', label = 'bar' } },
	  expect = { '<tr><th scope="row" class="mw-capiunto-infobox-label" style="a:b">bar</th><td>\nfoo</td></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderRow 4', func = testRenderRow, type='ToString',
	  args = { {}, { data = 'foo', class='meh', dataStyle="a:b" } },
	  expect = { '<tr><td colspan="2" class="mw-capiunto-infobox-spanning meh" style="a:b">\nfoo</td></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderWikitext 1', func = testRenderWikitext, type='ToString',
	  args = { 'abc' },
	  expect = { '<tr><td colspan="2" class="mw-capiunto-infobox-spanning">\nabc</td></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderTitle 1', func = testRenderTitle, type='ToString',
	  args = { { title = 'cd' } },
	  expect = { '<caption>cd</caption>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderTitle 2', func = testRenderTitle, type='ToString',
	  args = { { title = 'cd', titleClass = 'ab', titleStyle = 'wikidata:awesome' } },
	  expect = { '<caption class="ab" style="wikidata:awesome">cd</caption>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderSubHeaders 1', func = testRenderSubHeader, type='ToString',
	  args = { { subHeaders = { { text = 'foo' } } } },
	  expect = { '<tr><td colspan="2" class="mw-capiunto-infobox-spanning">\nfoo</td></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderSubHeaders 2', func = testRenderSubHeader, type='ToString',
	  args = { { subHeaders = { { text = 'foo', style = 'a' } } } },
	  expect = { '<tr><td colspan="2" class="mw-capiunto-infobox-spanning" style="a">\nfoo</td></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderTopRow 1', func = testRenderTopRow, type='ToString',
	  args = { {} },
	  expect = { '' }
	},
	{ name = 'CapiuntoInfoboxRender.renderTopRow 2', func = testRenderTopRow, type='ToString',
	  args = { { top = 'foo' } },
	  expect = { '<tr><th colspan="2" class="mw-capiunto-infobox-top">foo</th></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderTopRow 3', func = testRenderTopRow, type='ToString',
	  args = { { top = 'foo', topClass = 'a', topStyle='b' } },
	  expect = { '<tr><th colspan="2" class="mw-capiunto-infobox-top a" style="b">foo</th></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderBottomRow 1', func = testRenderBottomRow, type='ToString',
	  args = { {} },
	  expect = { '' }
	},
	{ name = 'CapiuntoInfoboxRender.renderBottomRow 2', func = testRenderBottomRow, type='ToString',
	  args = { { bottom = 'foo' } },
	  expect = { '<tr><td colspan="2" class="mw-capiunto-infobox-bottom">\nfoo</td></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderBottomRow 2', func = testRenderBottomRow, type='ToString',
	  args = { { bottom = 'foo', bottomClass = 'a', bottomStyle = 'b' } },
	  expect = { '<tr><td colspan="2" class="mw-capiunto-infobox-bottom a" style="b">\nfoo</td></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderImages 1', func = testRenderImages, type='ToString',
	  args = { { } },
	  expect = { '' }
	},
	{ name = 'CapiuntoInfoboxRender.renderImages 2', func = testRenderImages, type='ToString',
	  args = { { captionStyle = 'a:b', images = { { image = '[[File:Foo.bar]]', caption="a" } }, } },
	  expect = { '<tr><td colspan="2" class="mw-capiunto-infobox-spanning">\n[[File:Foo.bar]]<br /><div style="a:b">a</div></td></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderImages 3', func = testRenderImages, type='ToString',
	  args = { { imageStyle = 'a', imageClass="b", images = { { image = 'img' } }, } },
	  expect = { '<tr><td colspan="2" class="mw-capiunto-infobox-spanning b" style="a">\nimg</td></tr>' }
	},
	{ name = 'CapiuntoInfoboxRender.renderImages 4', func = testRenderImages, type='ToString',
	  args =
	  { { images = {
			{ image = '[[File:Foo.bar]]' },
			{ image = '[[File:A]]', caption = 'Capt.' },
			{ image = '[[File:B]]', caption = 'C', class = 'D-Class' },
	  } } },
	  expect = {
		'<tr><td colspan="2" class="mw-capiunto-infobox-spanning">\n[[File:Foo.bar]]</td></tr>' ..
		'<tr><td colspan="2" class="mw-capiunto-infobox-spanning">\n[[File:A]]<br /><div>Capt.</div></td></tr>' ..
		'<tr class="D-Class"><td colspan="2" class="mw-capiunto-infobox-spanning">\n[[File:B]]<br /><div>C</div></td></tr>'
	  }
	},
	{ name = 'CapiuntoInfoboxRender.renderRows 1', func = testRenderRows, type='ToString',
	  args = { { } },
	  expect = { '' }
	},
	{ name = 'CapiuntoInfoboxRender.renderRows 2', func = testRenderRows, type='ToString',
	  args =
	  { { rows = {
			{ data = 'foo', label = 'bar' },
			{ header = 'foo', class = 'bar' },
			{ wikitext = 'Berlin' },
			{ data = 'foo', class='meh' },
	  }, labelStyle="a:b" } },
	  expect = {
		'<tr><th scope="row" class="mw-capiunto-infobox-label" style="a:b">bar</th><td>\nfoo</td></tr>' ..
		'<tr><th colspan="2" class="mw-capiunto-infobox-header bar">foo</th></tr>' ..
		'<tr><td colspan="2" class="mw-capiunto-infobox-spanning">\nBerlin</td></tr>' ..
		'<tr><td colspan="2" class="mw-capiunto-infobox-spanning meh">\nfoo</td></tr>'
	  }
	},
}

return testframework.getTestProvider( tests )

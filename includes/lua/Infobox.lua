--[[
	A Lua module for wrapping infoboxes.

	Originally written on the English Wikipedia by
	Toohool and Mr. Stradivarius.

	Code released under the GPL v2+ as per:
	https://en.wikipedia.org/w/index.php?diff=next&oldid=581399786
	https://en.wikipedia.org/w/index.php?diff=next&oldid=581403025

	@license GNU GPL v2+
	@author Marius Hoch < hoo@online.de >
]]

local infobox = {}
local metatable = {}
local methodtable = {}
local php = mw_interface

metatable.__index = methodtable

metatable.__tostring = function( t )
	return tostring( t:getHtml() )
end

local function verifyStringNumNil( val, name )
	if val ~= nil and type( val ) ~= 'string' and type( val ) ~= 'number' then
		error( name .. ' must be either of type string, number or nil', 3 )
	end
end

local function verifyStringNum( val, name )
	if type( val ) ~= 'string' and type( val ) ~= 'number' then
		error( name .. ' must be either of type string or number', 3 )
	end
end

-- Gets an mw.html table representing the infobox
function methodtable.getHtml( t )
	local html = mw.html.create( '' )
	local args = t.args
	local render = require( 'CapiuntoInfoboxRender' )

	html = render.renderWrapper( html, args )

	if not args.isChild then
		render.renderTitle( html, args )
		render.renderTopRow( html, args )
	end

	render.renderSubHeaders( html, args )
	render.renderImages( html, args )
	render.renderRows( html, args )
	render.renderBottomRow( html, args )

	-- Add the Scribunto modules needed to properly display the generated HTML
	php.addResourceLoaderModules()

	return html
end

-- Add an additional title field below the title and the top-text
--
-- @param text
-- @param style
-- @param class
function methodtable.addSubHeader( t, text, class, style )
	verifyStringNum( text, 'text' )
	verifyStringNumNil( class, 'class' )
	verifyStringNumNil( style, 'style' )

	t.args.subHeaders = t.args.subHeaders or {}
	local i = #t.args.subHeaders + 1

	t.args.subHeaders[i] =
		{ text = text, style = style, class = class }

	return t;
end

-- Adds a header row to the infobox
--
-- @param header
-- @param class
function methodtable.addHeader( t, header, class )
	verifyStringNum( header, 'header' )
	verifyStringNumNil( class, 'class' )

	t.args.rows = t.args.rows or {}
	local i = #t.args.rows + 1

	t.args.rows[i] =
		{ header = header, class = class }

	return t;
end

-- Adds a simple data row to the infobox
--
-- @param label
-- @param data
-- @param class
-- @param rowClass
function methodtable.addRow( t, label, data, class, rowClass )
	verifyStringNumNil( label, 'label' )
	verifyStringNum( data, 'data' )
	verifyStringNumNil( rowClass, 'rowClass' )
	verifyStringNumNil( class, 'class' )

	t.args.rows = t.args.rows or {}
	local i = #t.args.rows + 1

	t.args.rows[i] =
		{ data = data, label = label, rowClass = rowClass, class = class }

	return t;
end

-- Add arbitrary wikitext to the infobox.
-- This can be eg. a subinfobox or whatever
--
-- @param text
function methodtable.addWikitext( t, text )
	if type( text ) == 'table' then
		text = tostring( text )
	end

	if type( text ) ~= 'string' and type( text ) ~= 'number' then
		-- Tables have already been converted above, so we don't have to worry about them here.
		error( 'text must be either of type string, number or table', 2 )
	end

	t.args.rows = t.args.rows or {}
	local i = #t.args.rows + 1

	t.args.rows[i] =
		{ wikitext = text }

	return t
end

-- Adds an image to the top of the infobox
--
-- @param image
-- @param caption
-- @param class
function methodtable.addImage( t, image, caption, class )
	verifyStringNum( image, 'image' )
	verifyStringNumNil( caption, 'caption' )
	verifyStringNumNil( class, 'class' )

	t.args.images = t.args.images or {}
	local i = #t.args.images + 1

	t.args.images[i] =
		{ image = image, caption = caption, class = class }

	return t;
end

function infobox.create( options )
	local function verifyStringNumNil( val, name )
		if val ~= nil and type( val ) ~= 'string' and type( val ) ~= 'number' then
			error( 'Option ' .. name .. ' must be either of type string, number or nil', 3 )
		end

		return val
	end

	options = options or {}

	local box = {}
	setmetatable( box, metatable )

	box.args = {}
	box.args.isChild			= options.isChild and true
	box.args.isSubbox			= options.isSubbox and true

	-- Title
	box.args.title			= verifyStringNumNil( options.title, 'title' )
	box.args.titleClass		= verifyStringNumNil( options.titleClass, 'titleClass' )
	box.args.titleStyle		= verifyStringNumNil( options.titleStyle, 'titleStyle' )

	-- Top text
	box.args.top			= verifyStringNumNil( options.top, 'top' )
	box.args.topClass		= verifyStringNumNil( options.topClass, 'topClass' )
	box.args.topStyle		= verifyStringNumNil( options.topStyle, 'topStyle' )

	-- Image options
	box.args.captionStyle	= verifyStringNumNil( options.captionStyle, 'captionStyle' )
	box.args.imageStyle		= verifyStringNumNil( options.imageStyle, 'imageStyle' )
	box.args.imageClass		= verifyStringNumNil( options.imageClass, 'imageClass' )

	-- Bottom text
	box.args.bottom			= verifyStringNumNil( options.bottom, 'bottom' )
	box.args.bottomClass	= verifyStringNumNil( options.bottomClass, 'bottomClass' )
	box.args.bottomStyle	= verifyStringNumNil( options.bottomStyle, 'bottomStyle' )

	-- Data styling
	box.args.bodyClass		= verifyStringNumNil( options.bodyClass, 'bodyClass' )
	box.args.bodyStyle		= verifyStringNumNil( options.bodyStyle, 'bodyStyle' )
	box.args.headerStyle	= verifyStringNumNil( options.headerStyle, 'headerStyle' )
	box.args.labelStyle		= verifyStringNumNil( options.labelStyle, 'labelStyle' )
	box.args.dataStyle		= verifyStringNumNil( options.dataStyle, 'dataStyle' )

	return box
end

mw_interface = nil

return infobox

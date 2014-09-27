local capiunto = require 'capiunto'
local box = capiunto.create( {
	title = 'Infobox Data Test!'
} )
box
	:addHeader( 'A header' )
	:addRow( 'An item', 'with a value' )

return tostring( box:getHtml() )

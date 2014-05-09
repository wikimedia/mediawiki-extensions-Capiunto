local box = mw.capiunto.Infobox.create( {
	title = 'Infobox Data Test!'
} )
box
	:addHeader( 'A header' )
	:addRow( 'An item', 'with a value' )

return tostring( box:getHtml() )

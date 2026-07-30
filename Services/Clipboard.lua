local Clipboard = {}



function Clipboard.Copy(text)

	if setclipboard then

		setclipboard(text)

		return true


	elseif toclipboard then

		toclipboard(text)

		return true

	end



	return false

end



return Clipboard

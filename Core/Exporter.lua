local Exporter = {}



function Exporter.Copy(text)

	if setclipboard then

		setclipboard(text)

	elseif toclipboard then

		toclipboard(text)

	end

end




function Exporter.ToLua(entry)

	return string.format(
		"-- %s\n%s\n%s",
		entry.Remote,
		entry.Arguments,
		entry.Traceback
	)

end



return Exporter

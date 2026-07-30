local Decoder =
	require(
		script.Parent.Decoder
	)


local Formatter = {}



local function escape(str)

	return str:gsub(
		"[%c\\\"]",
		function(c)

			return string.format(
				"\\x%02X",
				string.byte(c)
			)

		end
	)

end



function Formatter.Value(value,depth)

	depth = depth or 0

	value =
		Decoder.Try(value)


	if depth > 5 then
		return "{...}"
	end



	local t = typeof(value)



	if t == "string" then

		return '"'..escape(value)..'"'



	elseif t == "Instance" then

		return value:GetFullName()



	elseif t == "Vector3" then

		return string.format(
			"Vector3.new(%0.3f,%0.3f,%0.3f)",
			value.X,
			value.Y,
			value.Z
		)



	elseif t == "CFrame" then

		return "CFrame.new("..
			table.concat(
				{value:GetComponents()},
				","
			)
		..")"



	elseif t == "table" then


		local output = {"{"}


		for key,val in pairs(value) do

			output[#output+1] =
				string.rep(
					" ",
					depth*2
				)
				..
				"["..
				Formatter.Value(key,depth+1)
				..
				"] = "
				..
				Formatter.Value(val,depth+1)

		end


		output[#output+1] = "}"


		return table.concat(
			output,
			"\n"
		)



	elseif t == "nil" then

		return "nil"



	else

		return tostring(value)

	end

end




function Formatter.Arguments(args,start)

	local result = {}


	for i=start,#args do

		result[#result+1] =
			string.format(
				"Argument %d:\n%s",
				i-start+1,
				Formatter.Value(args[i])
			)

	end


	return table.concat(
		result,
		"\n\n"
	)

end



return Formatter

local Decoder = {}



function Decoder.Try(value)

	if typeof(value) == "string" then

		local success, result = pcall(function()

			local ReplicatedStorage = game:GetService("ReplicatedStorage")

			local Modules =
				require(
					ReplicatedStorage.SharedModules.Global
				)

			return Modules.Network:GetObject(
				value,
				"CharacterPart"
			)

		end)


		if success and result then
			return result
		end

	end



	if typeof(value) == "table" then

		if value[1] == "NPC" then

			return string.format(
				"NPC(%s,%s)",
				tostring(value[2]),
				tostring(value[3])
			)

		end

	end



	return value

end



return Decoder

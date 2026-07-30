local Storage = {}

local ConfigName = "DynamicSpyV2_Config.json"



function Storage:Save(data)

	if not writefile then
		return false
	end


	local HttpService =
		game:GetService("HttpService")


	local success, result =
		pcall(function()

			writefile(
				ConfigName,
				HttpService:JSONEncode(data)
			)

		end)


	return success

end





function Storage:Load()

	if not readfile or not isfile then
		return nil
	end



	if not isfile(ConfigName) then
		return nil
	end



	local HttpService =
		game:GetService("HttpService")



	local success, result =
		pcall(function()

			return HttpService:JSONDecode(
				readfile(ConfigName)
			)

		end)



	if success then
		return result
	end



	return nil

end




function Storage:Clear()

	if delfile and isfile and isfile(ConfigName) then

		delfile(
			ConfigName
		)

	end

end



return Storage

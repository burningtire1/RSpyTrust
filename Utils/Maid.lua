local Maid = {}
Maid.__index = Maid



function Maid.new()

	return setmetatable({

		Tasks = {}

	}, Maid)

end



function Maid:Add(task)

	table.insert(
		self.Tasks,
		task
	)

	return task

end



function Maid:Cleanup()

	for _,task in ipairs(self.Tasks) do


		if typeof(task) == "RBXScriptConnection" then

			task:Disconnect()


		elseif typeof(task) == "Instance" then

			task:Destroy()


		elseif type(task) == "function" then

			task()

		end


	end


	table.clear(
		self.Tasks
	)

end



return Maid

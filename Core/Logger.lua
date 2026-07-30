local Config =
	require(
		script.Parent.Parent.Config
	)


local Formatter =
	require(
		script.Parent.Formatter
	)


local Registry =
	require(
		script.Parent.Registry
	)


local Signal =
	require(
		script.Parent.Parent.Utils.Signal
	)



local Logger = {}



Logger.Entries = {}

Logger.EntryAdded =
	Signal.new()



Logger.FireCount = 0

Logger.InvokeCount = 0





function Logger:Add(method,args,startIndex)


	local remote = args[2]


	if not remote then
		return
	end



	local name =
		typeof(remote) == "Instance"
		and remote.Name
		or tostring(remote)



	if Config.BlockedRemotes[name] then
		return
	end




	local entry = {


		Remote = name,

		Method = method,

		Timestamp = os.time(),


		Arguments =
			Formatter.Arguments(
				args,
				startIndex
			),


		Traceback =
			debug.traceback(
				"",
				3
			)

	}




	table.insert(
		self.Entries,
		entry
	)




	if #self.Entries >
		Config.MaxEntries then

		table.remove(
			self.Entries,
			1
		)

	end



	Registry:Add(
		name,
		method
	)



	if method == "FireServer" then

		self.FireCount += 1

	else

		self.InvokeCount += 1

	end



	self.EntryAdded:Fire(
		entry
	)


end



return Logger

local Registry = {}


Registry.Remotes = {}



function Registry:Add(name,method)

	local remote =
		self.Remotes[name]


	if not remote then

		remote = {

			Name = name,

			Fire = 0,

			Invoke = 0,

			FirstSeen = os.clock(),

			LastSeen = os.clock()

		}


		self.Remotes[name] = remote

	end



	remote.LastSeen =
		os.clock()



	if method == "FireServer" then

		remote.Fire += 1

	else

		remote.Invoke += 1

	end


end




function Registry:Get()

	local list = {}


	for _,remote in pairs(self.Remotes) do

		table.insert(
			list,
			remote
		)

	end



	table.sort(
		list,
		function(a,b)

			return
				(a.Fire+a.Invoke)
				>
				(b.Fire+b.Invoke)

		end
	)



	return list

end



return Registry

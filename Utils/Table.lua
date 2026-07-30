local Table = {}



function Table.Count(tbl)

	local count = 0


	for _ in pairs(tbl) do

		count += 1

	end


	return count

end




function Table.DeepCopy(tbl)

	local copy = {}


	for key,value in pairs(tbl) do


		if type(value) == "table" then

			copy[key] =
				Table.DeepCopy(value)

		else

			copy[key] = value

		end


	end


	return copy

end




function Table.Merge(a,b)

	local result =
		Table.DeepCopy(a)


	for key,value in pairs(b) do

		result[key] = value

	end


	return result

end




function Table.Find(tbl,value)

	for index,item in pairs(tbl) do

		if item == value then

			return index

		end

	end


	return nil

end




function Table.Clear(tbl)

	for key in pairs(tbl) do

		tbl[key] = nil

	end

end



return Table

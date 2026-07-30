local Theme =
	require(
		script.Parent.Theme
	)



local Components = {}



function Components.Corner(instance,radius)

	local corner =
		Instance.new(
			"UICorner"
		)

	corner.CornerRadius =
		radius or Theme.Radius.Medium


	corner.Parent =
		instance


	return corner

end




function Components.Label(parent,text,size)

	local label =
		Instance.new(
			"TextLabel"
		)


	label.BackgroundTransparency = 1

	label.Text =
		text


	label.TextColor3 =
		Theme.Colors.Text


	label.Font =
		Theme.Fonts.Main


	label.TextSize =
		size or 14


	label.TextXAlignment =
		Enum.TextXAlignment.Left


	label.Parent =
		parent



	return label

end





function Components.Button(parent,text)

	local button =
		Instance.new(
			"TextButton"
		)


	button.BackgroundColor3 =
		Theme.Colors.Card


	button.Text =
		text


	button.TextColor3 =
		Theme.Colors.Text


	button.Font =
		Theme.Fonts.Bold


	button.TextSize =
		13


	button.AutoButtonColor =
		false


	button.Parent =
		parent



	Components.Corner(
		button
	)



	return button

end





function Components.Frame(parent)

	local frame =
		Instance.new(
			"Frame"
		)


	frame.BackgroundColor3 =
		Theme.Colors.Surface


	frame.BorderSizePixel =
		0


	frame.Parent =
		parent



	Components.Corner(
		frame
	)



	return frame

end



return Components

local Theme =
	require(
		script.Parent.Theme
	)


local Components =
	require(
		script.Parent.Components
	)


local Animation =
	require(
		script.Parent.Animation
	)



local Window = {}

Window.__index = Window



function Window.new(gui)

	local self =
		setmetatable({},Window)



	self.Gui =
		gui



	self.Main =
		Instance.new(
			"Frame"
		)


	self.Main.Size =
		UDim2.fromOffset(
			900,
			600
		)


	self.Main.Position =
		UDim2.new(
			0.5,
			-450,
			0.5,
			-300
		)


	self.Main.BackgroundColor3 =
		Theme.Colors.Background


	self.Main.BorderSizePixel =
		0


	self.Main.Active =
		true


	self.Main.Draggable =
		true


	self.Main.Parent =
		gui



	Components.Corner(
		self.Main,
		Theme.Radius.Large
	)



	-- Top bar

	self.Header =
		Instance.new(
			"Frame"
		)


	self.Header.Size =
		UDim2.new(
			1,
			0,
			0,
			45
		)


	self.Header.BackgroundColor3 =
		Theme.Colors.Surface


	self.Header.BorderSizePixel =
		0


	self.Header.Parent =
		self.Main



	Components.Corner(
		self.Header
	)



	local title =
		Components.Label(
			self.Header,
			"DynamicSpy V2",
			16
		)


	title.Position =
		UDim2.fromOffset(
			15,
			0
		)


	title.Size =
		UDim2.new(
			1,
			-120,
			1,
			0
		)




	-- close button

	local close =
		Components.Button(
			self.Header,
			"×"
		)


	close.Size =
		UDim2.fromOffset(
			35,
			30
		)


	close.Position =
		UDim2.new(
			1,
			-45,
			0.5,
			-15
		)



	close.MouseButton1Click:Connect(
		function()

			self.Main.Visible =
				false

		end
	)



	-- Sidebar

	self.Sidebar =
		Instance.new(
			"Frame"
		)


	self.Sidebar.Size =
		UDim2.new(
			0,
			180,
			1,
			-45
		)


	self.Sidebar.Position =
		UDim2.fromOffset(
			0,
			45
		)


	self.Sidebar.BackgroundColor3 =
		Theme.Colors.Surface


	self.Sidebar.BorderSizePixel =
		0


	self.Sidebar.Parent =
		self.Main




	-- Content

	self.Content =
		Instance.new(
			"Frame"
		)


	self.Content.Size =
		UDim2.new(
			1,
			-190,
			1,
			-55
		)


	self.Content.Position =
		UDim2.fromOffset(
			190,
			50
		)


	self.Content.BackgroundTransparency =
		1


	self.Content.Parent =
		self.Main



	Animation.FadeIn(
		self.Main
	)



	return self

end




function Window:AddButton(text,callback)

	local button =
		Components.Button(
			self.Sidebar,
			text
		)


	button.Size =
		UDim2.new(
			1,
			-20,
			0,
			40
		)


	button.Position =
		UDim2.fromOffset(
			10,
			10 + (#self.Sidebar:GetChildren()*45)
		)



	button.MouseButton1Click:Connect(
		callback
	)


	return button

end



function Window:Clear()

	for _,child in ipairs(
		self.Content:GetChildren()
	) do

		child:Destroy()

	end

end



return Window

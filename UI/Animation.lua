local TweenService =
	game:GetService(
		"TweenService"
	)



local Animation = {}



function Animation.Tween(
	object,
	properties,
	duration
)

	local tween =
		TweenService:Create(

			object,

			TweenInfo.new(
				duration or .25,
				Enum.EasingStyle.Quart,
				Enum.EasingDirection.Out
			),

			properties

		)


	tween:Play()


	return tween

end




function Animation.FadeIn(frame)

	frame.Visible = true

	frame.BackgroundTransparency = 1


	Animation.Tween(
		frame,
		{
			BackgroundTransparency = 0
		},
		0.3
	)

end




return Animation

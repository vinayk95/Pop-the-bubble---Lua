local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup=self.view
  	local x = display.newImage(sceneGroup,"credits.png",212,150)

end

function scene:show( event )
	local phase = event.phase
	
	if phase == "will" then

		-- Called when the scene is still off screen and is about to move on screen.

		

		display.setDefault( "background", 0.2, 0.5, 1.0 )

	elseif phase == "did" then

		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.

		

	end

end

scene:addEventListener("create",scene)


return scene
local composer = require( "composer" )
local scene = composer.newScene()

---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
-- [Title View]

local physics = require "physics"
physics.start()
physics.setGravity(0,0)

local bg = display.newImage('bg.png',150,240)


function scene:create(event)
	local sceneGroup=self.view
	local levelBtn=display.newImage('level1.png',150,70)
	local levelBtnTwo=display.newImage('level2.png',150,180)
	local levelBtnThree=display.newImage('level3.png',150,290)
	local levelBtnFour=display.newImage('level4.png',150,400)
end
 
scene:addEventListener("create",scene)


return scene
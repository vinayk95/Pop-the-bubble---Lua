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

local function gotoCredits( )
	composer.removeScene("credits")
	composer.gotoScene("credits","slideLeft",800)
end

local function gotoGame( )
	composer.removeScene("Game")
	composer.gotoScene("Game","slideRight",800)
end


function scene:create( event )
	local sceneGroup=self.view

	local bg=display.newImageRect(sceneGroup,"bg.png",1024,1050)
	bg.x=displayContentCentreX
	bg.y=displayContentCentreY

	titleBg = display.newImage(sceneGroup,'title.png', 150, 150)
	playBtn = display.newImage(sceneGroup,'playBtn.png', 150, 252)
	creditsBtn = display.newImage(sceneGroup,'creditsBtn.png', 150, 312)

	titleBg:addEventListener("tap",gotoGame)
	creditsBtn:addEventListener("tap",gotoCredits)
end

scene:addEventListener("create",scene)


return scene

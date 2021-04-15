local composer = require( "composer" )
local scene = composer.newScene()


local physics = require "physics"
physics.start()
physics.setGravity(0,0)

local bg = display.newImage('bg.jpg',150,250)


local titleBg
local playBtn
local creditsBtn
local titleView

-- [Credits]

local creditsView
local creditsViewOne
local creditsViewTwo
local creditsViewThree

-- Bubbles & Bullets Group

local bubbles
local bullets
local bulletsTwo
local bulletsThree
local bulletsFour
local b
local bullet
local bulletTwo
local bulletThree
local bulletFour

-- Walls 

local left
local right
local top
local bottom
local spike
local spike1

-- TextFields

local level
local levelView
local levelBtn
local levelBtnTwo
local levelBtnThree
local levelBtnFour

local required
local levelN
local requiredN
local popped
local poppedN
local alertView 

-- Sound
local backgroundSound = audio.loadSound('bubbleSound.mp3')

local pop = audio.loadSound('pop.mp3')

-- Variables

local lastY

-- Functions


local levelPage = {}
--local startButtonListeners = {}
local showCredits = {}
local hideCredits = {}
local levelOne = {}
local levelTwo = {}
local levelThree = {}
local levelFour = {}
local gameListeners = {}

local createBullets = {}

local onCollision = {}
local update = {}
local updateTwo = {}
local updateThree = {}
local updateFour = {}

local alert = {}




function startButtonListeners(action)
	if(action == 'add') then
		playBtn:addEventListener('tap', levelPage)
		creditsBtn:addEventListener('tap', showCredits)
	else
		playBtn:removeEventListener('tap', levelPage)
		creditsBtn:removeEventListener('tap', showCredits)
	end
end

function levelPage(action)
		--LEVEL 1

		levelBtn=display.newImage('level1.png',150,70)
		levelBtn:addEventListener('tap',levelOne)

		--transition.to(titleView, {time = 300, x = -titleView.height, onComplete = function() startButtonListeners('rmv') display.remove(titleView) titleView = nil levelOne end})

		--LEVEL 2

		levelBtnTwo=display.newImage('level2.png',150,180)
		levelBtnTwo:addEventListener('tap',levelTwo)

		--LEVEL 3

		levelBtnThree=display.newImage('level3.png',150,290)
		levelBtnThree:addEventListener('tap',levelThree)

		--LEVEL 4
	
		levelBtnFour=display.newImage('level4.png',150,400)
		levelBtnFour:addEventListener('tap',levelFour)

		levelView=display.newGroup(levelBtn,levelBtnTwo,levelBtnThree,levelBtnFour)


	titleView.isVisible=false
end

function levelOne:tap(e)
	transition.to(titleView, {time = 300, x = -titleView.height, onComplete = function() levelPage('rmv') display.remove(levelView) titleView = nil gameListeners('add') end})
	--display.remove(titleView)

	-- [Add GFX]
	display.remove(levelView)
	
	-- Walls
	
	left = display.newLine(0, 240, 0, 720)
	right = display.newLine(320, 240, 320, 720)
	right:setStrokeColor(0, 153, 204)
	top = display.newLine(160, 0, 480, 0)
	top:setStrokeColor(0, 153, 204)
	bottom = display.newLine(160, 480, 480, 480)
	
	left.name = 'wall'
	right.name = 'wall'
	top.name = 'wall'
	bottom.name = 'wall'
	
	-- Bubbles
	
	bubbles = display.newGroup()
	
	for i = 1, 5 do
		local rx = 21 + math.floor(math.random() * (display.contentWidth - 100))
		local ry = 1 + math.floor(math.random() * (display.contentHeight - 42))
		
		b = display.newImage('bubble.png', rx, ry)
		b.name = 'bubble'
		
		-- Bubble Physics
		
		physics.addBody(b, 'dynamic', {radius = 21, bounce = 1})
		b:setLinearVelocity(100, 150)
		bubbles:insert(b)
	end
	
	-- Walls Physics
	
	physics.addBody(left, 'static')
	physics.addBody(right, 'static')
	physics.addBody(top, 'static')
	physics.addBody(bottom, 'static')

	-- Level TextField
	
	level = display.newImage('level.png', 50, 20)
	
	levelN = display.newText('1',80 , 20, native.systemFont, 20)
	levelN:setTextColor(255, 255, 255)
	
	-- Popped TextField
	
	popped = display.newImage('popped.png', 140, 20)
	
	poppedN = display.newText('0', 178, 20, native.systemFont, 20)
	poppedN:setTextColor(255, 255, 255)
	
	-- Required TextField
	
	required = display.newImage('required.png', 231, 20)
	
	requiredN = display.newText('4', 275, 20, native.systemFont, 20)
	requiredN:setTextColor(255, 255, 255)
	bullets = display.newGroup()

end

function levelTwo:tap(e)
	transition.to(titleView, {time = 300, x = -titleView.height, onComplete = function() levelPage('rmv') display.remove(levelView) titleView = nil gameListeners('add') end})
	--display.remove(titleView)

	-- [Add GFX]
	display.remove(levelView)
	
	-- Walls
	
	left = display.newLine(0, 240, 0, 720)
	right = display.newLine(320, 240, 320, 720)
	right:setColor(0, 153, 204)
	top = display.newLine(160, 0, 480, 0)
	top:setColor(0, 153, 204)
	bottom = display.newLine(160, 480, 480, 480)
	
	left.name = 'wall'
	right.name = 'wall'
	top.name = 'wall'
	bottom.name = 'wall'
	
	-- Bubbles
	
	bubbles = display.newGroup()
	
	for i = 1, 6 do
		local rx = 21 + math.floor(math.random() * (display.contentWidth - 150))
		local ry = 21 + math.floor(math.random() * (display.contentHeight - 42))
		
		b = display.newImage('bubble.png', rx, ry)
		b.name = 'bubble'
		
		-- Bubble Physics
		
		physics.addBody(b, 'dynamic', {radius = 21, bounce = 1})
		b:setLinearVelocity(150, 100)
		
		bubbles:insert(b)
	end
	
	-- Walls Physics
	
	physics.addBody(left, 'static')
	physics.addBody(right, 'static')
	physics.addBody(top, 'static')
	physics.addBody(bottom, 'static')

--Spike

	spike=display.newImageRect("floors.png",70,15)
	spike.name='spikess'
	spike.x=display.contentCenterX
	spike.y=display.contentCenterY-60

	physics.addBody(spike,'static')
	
	level = display.newImage('level.png', 50, 20)
	
	levelN = display.newText('2',80 , 20, native.systemFont, 20)
	levelN:setTextColor(255, 255, 255)
	
	-- Popped TextField
	
	popped = display.newImage('popped.png', 140, 20)
	
	poppedN = display.newText('0', 178, 20, native.systemFont, 20)
	poppedN:setTextColor(255, 255, 255)
	
	-- Required TextField
	
	required = display.newImage('required.png', 231, 20)
	
	requiredN = display.newText('5', 275, 20, native.systemFont, 20)
	requiredN:setTextColor(255, 255, 255)
	bullets = display.newGroup()

	--gameListeners('add')
end

function levelThree:tap(e)
	transition.to(titleView, {time = 300, x = -titleView.height, onComplete = function() levelPage('rmv') display.remove(levelView) titleView = nil gameListeners('add') end})
	--display.remove(titleView)

	-- [Add GFX]
	display.remove(levelView)
	
	-- Walls
	
	left = display.newLine(0, 240, 0, 720)
	right = display.newLine(320, 240, 320, 720)
	right:setColor(0, 153, 204)
	top = display.newLine(160, 0, 480, 0)
	top:setColor(0, 153, 204)
	bottom = display.newLine(160, 480, 480, 480)
	
	left.name = 'wall'
	right.name = 'wall'
	top.name = 'wall'
	bottom.name = 'wall'
	
	-- Bubbles
	
	bubbles = display.newGroup()
	
	for i = 1, 6 do
		local rx = 21 + math.floor(math.random() * (display.contentWidth - 150))
		local ry = 21 + math.floor(math.random() * (display.contentHeight - 42))
		
		b = display.newImage('bubble.png', rx, ry)
		b.name = 'bubble'
		
		-- Bubble Physics
		
		physics.addBody(b, 'dynamic', {radius = 21, bounce = 1})
		b:setLinearVelocity(100, 100)
		
		bubbles:insert(b)
	end
	
	-- Walls Physics
	
	physics.addBody(left, 'static')
	physics.addBody(right, 'static')
	physics.addBody(top, 'static')
	physics.addBody(bottom, 'static')

--Spike

	spike=display.newImageRect("crate.png",75,75)
	spike.name='spikess'
	spike.x=display.contentCenterX
	spike.y=display.contentCenterY-60

	physics.addBody(spike,'static')

	-- Level TextField
	
	level = display.newImage('level.png', 50, 20)
	
	levelN = display.newText('3',80 , 20, native.systemFont, 20)
	levelN:setTextColor(255, 255, 255)
	
	-- Popped TextField
	
	popped = display.newImage('popped.png', 140, 20)
	
	poppedN = display.newText('0', 178, 20, native.systemFont, 20)
	poppedN:setTextColor(255, 255, 255)
	
	-- Required TextField
	
	required = display.newImage('required.png', 231, 20)
	
	requiredN = display.newText('5', 275, 20, native.systemFont, 20)
	requiredN:setTextColor(255, 255, 255)
	bullets = display.newGroup()

	--gameListeners('add')
end

function levelFour:tap(e)
	transition.to(titleView, {time = 300, x = -titleView.height, onComplete = function() levelPage('rmv') display.remove(levelView) titleView = nil gameListeners('add') end})
	--display.remove(titleView)

	-- [Add GFX]
	display.remove(levelView)
	
	-- Walls
	
	left = display.newLine(0, 240, 0, 720)
	right = display.newLine(320, 240, 320, 720)
	right:setStrokeColor(0, 153, 204)
	top = display.newLine(160, 0, 480, 0)
	top:setStrokeColor(0, 153, 204)
	bottom = display.newLine(160, 480, 480, 480)
	
	left.name = 'wall'
	right.name = 'wall'
	top.name = 'wall'
	bottom.name = 'wall'
	
	-- Bubbles
	
	bubbles = display.newGroup()
	
	for i = 1, 4 do
		local rx = 21 + math.floor(math.random() * (display.contentWidth - 150))
		local ry = 21 + math.floor(math.random() * (display.contentHeight - 42))
		
		b = display.newImage('bubble.png', rx, ry)
		b.name = 'bubble'
		
		-- Bubble Physics
		
		physics.addBody(b, 'dynamic', {radius = 21, bounce = 1})
		b:setLinearVelocity(100, 100)
		
		bubbles:insert(b)
	end
	
	-- Walls Physics
	
	physics.addBody(left, 'static')
	physics.addBody(right, 'static')
	physics.addBody(top, 'static')
	physics.addBody(bottom, 'static')

--Spike

	spike=display.newImageRect("floor.png",30,10)
	spike.x=display.contentCenterX-70
	spike.y=display.contentCenterY-120

	physics.addBody(spike,'static')
	
	spike1=display.newImageRect("floor.png",30,10)
	spike1.x=display.contentCenterX+70
	spike1.y=display.contentCenterY+120

	physics.addBody(spike1,'static')
	
	level = display.newImage('level.png', 50, 20)
	
	levelN = display.newText('4',80 , 20, native.systemFont, 20)
	levelN:setTextColor(255, 255, 255)
	
	-- Popped TextField
	
	popped = display.newImage('popped.png', 140, 20)
	
	poppedN = display.newText('0', 178, 20, native.systemFont, 20)
	poppedN:setTextColor(255, 255, 255)
	
	-- Required TextField
	
	required = display.newImage('required.png', 231, 20)
	
	requiredN = display.newText('4', 275, 20, native.systemFont, 20)
	requiredN:setTextColor(255, 255, 255)
	bullets = display.newGroup()

	--gameListeners('add')
end


function showCredits:tap(e)
	playBtn.isVisible = false
	creditsBtn.isVisible = false
	creditsView = display.newText('Game Developed By\n Vinay Kiran M\n\t\t',150,100,native.systemFont,20 )
		
	lastY = titleBg.y
	transition.to(titleBg, {time = 10, y = (display.contentHeight * 0.5) - (titleBg.height + 80)})
	transition.to(creditsView, {time = 300, y = (display.contentHeight * 0.5) + 55, onComplete = function() creditsView:addEventListener('tap', hideCredits) end})
	
end

function hideCredits:tap(e)
	transition.to(creditsView, {time = 300, y = display.contentHeight + 25, onComplete = function() creditsBtn.isVisible = true playBtn.isVisible = true creditsView:removeEventListener('tap', hideCredits) display.remove(creditsView) creditsView = nil end})
	
	 transition.to(titleBg, {time = 300, y = lastY});
end

function gameListeners(action)
	if(action == 'add') then
		bg:addEventListener('tap', createBullets)
	else
		bg:removeEventListener('tap', createBullets)
		Runtime:removeEventListener('enterFrame', update)
	end
end



function createBullets(e)
	for i = 1, 4 do
		bullet = display.newImage('bullet.png', e.x, e.y)

		-- Set direction
		
		if(i == 1) then bullet.x = bullet.x - 8 physics.addBody(bullet, 'kinematic', {radius = 7}) bullet:setLinearVelocity(-100, 0) end --left
		if(i == 2) then bullet.x = bullet.x + 8 physics.addBody(bullet, 'kinematic', {radius = 7}) bullet:setLinearVelocity(100, 0) end --right
		if(i == 3) then bullet.y = bullet.y - 8 physics.addBody(bullet, 'kinematic', {radius = 7}) bullet:setLinearVelocity(0, -100) end --up
		if(i == 4) then bullet.y = bullet.y + 8 physics.addBody(bullet, 'kinematic', {radius = 7}) bullet:setLinearVelocity(0, 100) end --down
		
		bullet:addEventListener('collision', onCollision)
		bullets:insert(bullet)

		
		bg:removeEventListener('tap', createBullets)
	end
	Runtime:addEventListener('enterFrame', update)
end



function onCollision(e)
	if(e.other.name == 'bubble') then
		audio.play(pop)
		display.remove(e.other)
		poppedN.text = tostring(tonumber(poppedN.text) + 1)
	end
end


function update(e)
	-- Check for offstage bullets

	for i = 1, bullets.numChildren do
		if(bullets[i] ~= nil) then
			if(bullets[i].x < 0 or bullets[i].x > 320 or bullets[i].y < 0 or bullets[i].y > 480) then
				display.remove(bullets[i])
			end
		end
	end
	
	-- Check if required bubbles were popped
	
	if(bullets.numChildren == 0 and tonumber(poppedN.text) >= tonumber(requiredN.text)) then
		alert('win')
	elseif(bullets.numChildren == 0 and tonumber(poppedN.text) < tonumber(requiredN.text)) then
		alert('lose')
	end
end

function updateTwo(e)
	-- Check for offstage bullets

	for i = 1, bullets.numChildren do
		if(bullets[i] ~= nil) then
			if(bullets[i].x < 0 or bullets[i].x > 320 or bullets[i].y < 0 or bullets[i].y > 480) then
				display.remove(bullets[i])
			end
		end
	end
	
	-- Check if required bubbles were popped
	
	if(bullets.numChildren == 0 and tonumber(poppedN.text) >= tonumber(requiredN.text)) then
		alert('win')
	elseif(bullets.numChildren == 0 and tonumber(poppedN.text) < tonumber(requiredN.text)) then
		alert('lose')
	end
end

function updateThree(e)
	-- Check for offstage bullets

	for i = 1, bullets.numChildren do
		if(bullets[i] ~= nil) then
			if(bullets[i].x < 0 or bullets[i].x > 320 or bullets[i].y < 0 or bullets[i].y > 480) then
				display.remove(bullets[i])
			end
		end
	end
	
	-- Check if required bubbles were popped
	
	if(bullets.numChildren == 0 and tonumber(poppedN.text) >= tonumber(requiredN.text)) then
		alert('win')
	elseif(bullets.numChildren == 0 and tonumber(poppedN.text) < tonumber(requiredN.text)) then
		alert('lose')
	end
end

function updateFour(e)
	-- Check for offstage bullets

	for i = 1, bullets.numChildren do
		if(bullets[i] ~= nil) then
			if(bullets[i].x < 0 or bullets[i].x > 320 or bullets[i].y < 0 or bullets[i].y > 480) then
				display.remove(bullets[i])
			end
		end
	end
	
	-- Check if required bubbles were popped
	
	if(bullets.numChildren == 0 and tonumber(poppedN.text) >= tonumber(requiredN.text)) then
		alert('win')
	elseif(bullets.numChildren == 0 and tonumber(poppedN.text) < tonumber(requiredN.text)) then
		alert('lose')
	end
end

function back()
	-- body
	display.remove(alertView)
	display.remove(level)
	display.remove(popped)
	display.remove(required)
	display.remove(poppedN)
	display.remove(levelN)
	display.remove(requiredN)
	display.remove(bubbles)
	display.remove(spike)
	display.remove(spike1)

	--createScene()
	titleBg = display.newImage('title.png', 150, 150)
	playBtn = display.newImage('playBtn.png', 150, 252)
	creditsBtn = display.newImage('creditsBtn.png', 150, 312)
	titleView = display.newGroup(titleBg, playBtn, creditsBtn)

	startButtonListeners('add')
	
end

function alert(action)
	gameListeners('rmv')
	if(action == 'win') then
		alertView = display.newImage('won.png', 80, display.contentHeight * 0.5 - 41)
		alertView.x=display.contentCenterX
		alertView.y=display.contentCenterY
		display.remove('floors.png')
		timer.performWithDelay(2000,back)
	else
		alertView = display.newImage('lost.png', 80, display.contentHeight * 0.5 - 41)
		alertView.x=display.contentCenterX
		alertView.y=display.contentCenterY
		timer.performWithDelay(2000,back)
	end
end


function scene:create( event )
	local sceneGroup=self.view
	titleBg = display.newImage('title.png', 150, 150)
	playBtn = display.newImage('playBtn.png', 150, 252)
	creditsBtn = display.newImage('creditsBtn.png', 150, 312)
	titleView = display.newGroup(titleBg, playBtn, creditsBtn)	

	audio.play(backgroundSound)

	
	startButtonListeners('add')
end

scene:addEventListener("create",scene)

return scene
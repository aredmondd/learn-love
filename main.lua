function love.load()
	FONT = love.graphics.getFont()
	X = 0
	Y = 75
	WIDTH = love.graphics.getWidth()
	HEIGHT = love.graphics.getHeight()
	FORWARD = true
	RECT_WIDTH = 200
	RECT_HEIGHT = 450
	CLICK_COUNT = 0
end

function love.update(dt)
	CLICK = love.mouse.isDown(1) and not oldmousedown

	if CLICK then
		local mouseX, mouseY = love.mouse.getPosition()
		if (mouseX >= X and mouseX <= (X + RECT_WIDTH)) and (mouseY >= Y and mouseY <= (Y + RECT_HEIGHT)) then
			CLICK_COUNT = CLICK_COUNT + 1
		end
	end

	if X + RECT_WIDTH >= WIDTH then
		FORWARD = false
	elseif X <= 0 then
		FORWARD = true
	end

	if FORWARD then
		X = X + RECT_WIDTH * dt
		DISPLAY_X = math.floor(X + 0.5)
	else
		X = X - RECT_WIDTH * dt
		DISPLAY_X = math.floor(X + 0.5)
	end

	local oldmousedown = love.mouse.isDown(1)
end

function love.draw()
	love.graphics.rectangle("line", X, Y, RECT_WIDTH, RECT_HEIGHT)
	love.graphics.print(tostring(CLICK_COUNT), (WIDTH / 2) - (FONT:getWidth(DISPLAY_X) / 2), 25)
end

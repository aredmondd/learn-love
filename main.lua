function love.load()
	FONT = love.graphics.getFont()
	X = 0
	DISPLAY_X = math.floor(X + 0.5)
	WIDTH = love.graphics.getWidth()
	HEIGHT = love.graphics.getHeight()
	FORWARD = true
end

function love.update(dt)
	if X + 200 >= WIDTH then
		FORWARD = false
	elseif X <= 0 then
		FORWARD = true
	end

	if FORWARD then
		X = X + 200 * dt
		DISPLAY_X = math.floor(X + 0.5)
	else
		X = X - 200 * dt
		DISPLAY_X = math.floor(X + 0.5)
	end
end

function love.draw()
	love.graphics.rectangle("line", X, 75, 200, 450)
	love.graphics.print(tostring(DISPLAY_X), (WIDTH / 2) - (FONT:getWidth(DISPLAY_X) / 2), 25)
end

function love.load()
	X = 100
	WIDTH = love.graphics.getWidth()
	FORWARD = true
end

function love.update(dt)
	if X + 200 >= WIDTH then
		FORWARD = false
	elseif X <= 0 then
		FORWARD = true
	end

	if FORWARD then
		X = X + 100 * dt
	else
		X = X - 100 * dt
	end
end

function love.draw()
	love.graphics.rectangle("line", X, 75, 200, 450)
end

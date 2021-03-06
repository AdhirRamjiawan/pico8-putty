pico-8 cartridge // http://www.pico-8.com
version 35
__lua__

local ball = 
{ 
	x=35,
	y=30,
	s=2,
	a=0,
	dx=1,
	dy=1,
	px=0, --pointer x
	py=0, --pointer y
	fx=0, -- final point x
	fy=0, -- final point y
	move=false,
	tl = 0
}

-- travel length
local tl = 100

-- map bounds
local mb = {
	x = 20,
	y = 20,
	x2 = 120,
	y2 = 120
}

function _init()
end

function _update()
	if btn(❎) then
		ball.move = true

		calc_final_point()
	end	
	
	if not ball.move then
  if btn(⬅️) then
  	if (ball.a > 0) then
	 		ball.a = 0
	 	end
	 	
			ball.a -= 1
	 end
	 
	 if btn(➡️) then
	 	if (ball.a < 0) then
	 		ball.a = 0
	 	end
			ball.a += 1
		end
		
		update_dir_point()
	end
	
	if ball.move then

		ball.x += ball.s * ball.dx
		ball.y += line_eq() * ball.dy
		
		ball.tl += 1
				
		update_dir()
	end
	
	if ball.tl >= tl
	then
		ball.move = false
		ball.tl = 0
	end
	
end

function _draw()
	cls()
	print("putty")
	print(ball.x)
	print(ball.y)
	print(ball.fx)
	print(ball.fy)
	
	rect(mb.x, mb.y, mb.x2, mb.y2)
	
	circ(ball.x, ball.y, ball.s)
	
	if not ball.move then
		line(
	    ball.x,
	    ball.y,
	    ball.px,
	    ball.py)
	end
end

function update_dir()
	if ball.x < mb.x and ball.dx < 0 then
		ball.dx = 1
	end
	
	if ball.x > mb.x2 and	ball.dx > 0 then
		ball.dx = -1
	end
	
	if ball.y < mb.y and ball.dy < 0 then
		ball.dy = 1
	end
	
	if ball.y > mb.y2 and ball.dy > 0 then
		ball.dy = -1
	end
end

function update_dir_point()


	if not btn(⬅️) and not btn(➡️) then
		return
	end

	ball.r = (ball.a * 0.01745)

	local x = ball.px - ball.x
	local y = ball.py - ball.y
	
	ball.px = (x*cos(ball.r))-(y*sin(ball.r))
	ball.py = (y*cos(ball.r))+(x*sin(ball.r))
	
	ball.px += ball.x
	ball.py += ball.y
end

function calc_final_point()
	ball.fx = 2 + sin(ball.r)
	ball.fy = 2 + cos(ball.r)
end

function line_eq()
	local x = ball.x
	local y = ball.y
	local x2 = ball.fx
	local y2 = ball.fy
	local m = (y2-y)/(x2-x)
--	local c = -1 * (m * x)
	return (m*x2) + y2
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

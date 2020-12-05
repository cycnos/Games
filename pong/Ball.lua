Ball = Class{}

function Ball:init(x,y,width,height)
    self.width = width
    self.height = height
    self.x = x
    self.y = y 
    self.vx = 50
    self.vy = 50
end

function Ball:render()
    love.graphics.rectangle('fill',self.x,self.y,self.width,self.height)
end

function Ball:isCollidingWithPad(paddle)
    if self.x > paddle.x + paddle.width or paddle.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end

function Ball:invertSpeeds()
    self.vx = self.vx * -1
    self.vy = self.vy * -1
end


function Ball:update(dt)
    self.x = self.x + self.vx * dt
    self.y = self.y + self.vy * dt

    if self.y <= 0 then 
        self.vy = self.vy * -1
    end

    if self.y + self.height > VIRTUAL_HEIGHT then 
        self.vy = self.vy * -1
    end
end

function Ball:reset()
    self.x = VIRTUAL_WIDTH / 2 - 2
    self.y = VIRTUAL_HEIGHT / 2 - 2
    self.dx = 0
    self.dy = 0
end

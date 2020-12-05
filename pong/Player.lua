Player = Class{}

function Player:init(x,y,width,height,commandDown,commandUp)
    self.x = x
    self.y = y 
    self.score = 0
    self.width = width
    self.height = height
    self.commandDown = commandDown
    self.commandUp = commandUp
end

function Player:update(dt)
    if love.keyboard.isDown(self.commandDown) and self.y < VIRTUAL_HEIGHT - self.height then 
        self.y = self.y + 2
    end

    if love.keyboard.isDown(self.commandUp) and self.y > 0 then 
        self.y = self.y - 2
    end

end

function Player:render()
    love.graphics.rectangle('fill',self.x,self.y,self.width,self.height)
end

require 'Ball'
require 'Player'
require 'SoundPlayer'

Game = Class{}

Game.TITLE = 'Pong - Remake'
function Game:init() 
    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
    player1 = Player(0,0,10,40,'s','w')
    player2 = Player(VIRTUAL_WIDTH - 10,0,10,40,'down','up')
    scoreFont = love.graphics.newFont('assets/fonts/font.ttf', 32)

end

function Game:update(dt)
    player1:update(dt)
    player2:update(dt)
    ball:update(dt)

    if ball.x <= 0 then 
        SoundPlayer:play('wall_hit')
        ball:reset()
        player2.score = player2.score + 1    
    end
    
    if ball.x + ball.width > VIRTUAL_WIDTH then 
        SoundPlayer:play('wall_hit')
        ball:reset()
        player1.score = player1.score + 1
    end

    if ball:isCollidingWithPad(player1) or ball:isCollidingWithPad(player2) then 
        SoundPlayer:play('pad_hit')
        ball:invertSpeeds()
    end 

end

function Game:render()
    
    drawField()
    drawScore()
    
    player1:render()
    player2:render()
    ball:render()

end

function drawField() 
    love.graphics.line(
        VIRTUAL_WIDTH/2,
        0,
        VIRTUAL_WIDTH/2,
        VIRTUAL_HEIGHT
    )
end

function drawScore()
    love.graphics.setFont(scoreFont)
    love.graphics.print(player1.score,
        VIRTUAL_WIDTH /2 - 30,
        0
    )
    love.graphics.print(player2.score,
        VIRTUAL_WIDTH /2 + 30,
        0
    )
end
SoundPlayer= Class{}

local playlist = {
    ['pad_hit'] = love.audio.newSource('assets/sounds/paddle_hit.wav', 'static'),
    ['wall_hit'] = love.audio.newSource('assets/sounds/wall_hit.wav', 'static')
}

function SoundPlayer:play(sound) 
    playlist[sound]:play()
end
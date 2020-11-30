lume = require "lume"
Object = require "Object"
Room = require "Room"
Player = require 'Player'

function love.load()
    -- pattern lpove configs
    scale = 1.5
    love.keyboard.setKeyRepeat(true)
    love.graphics.setDefaultFilter("nearest",  "nearest")


    player = Player(3, 3, 'player.png')
    
    rooms = {}
    lume.push(rooms,  Room(2, 2, 'tiles.png',  {
        {1,  3,  3,  3,  3,  3,  3,  2},
        {7,  4,  4,  4,  4,  4,  4,  5,  3,  3,  2},
        {7,  4,  4,  4,  4,  4,  4,  4,  4,  4,  7},
        {7,  4,  4,  4,  4,  4,  4,  1,  3,  3,  6},
        {5,  3,  3,  3,  3,  3,  3,  6},
        {0,  0,  0,  0,  0,  0,  0,  0},
        {0,  0,  0,  0,  0,  0,  0,  0},
        {0,  0,  0,  0,  0,  0,  0,  0},
        {0,  0,  0,  0,  0,  0,  0,  0},
    }))
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    love.graphics.scale(scale)
    rooms[1]:draw()
    player:draw()
end

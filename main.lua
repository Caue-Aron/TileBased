lume = require "lume"
Object = require "Object"
Room = require "Room"
Player = require 'Player'
Box = require "Box"

--[[
    {1,  3,  3,  3,  3,  3,  3,  2},
        {7,  4,  4,  4,  4,  4,  4,  5,  3,  3,  2},
        {7,  4,  4,  4,  4,  4,  4,  4,  4,  4,  7},
        {7,  4,  4,  4,  4,  4,  4,  1,  3,  3,  6},
        {5,  3,  3,  3,  3,  3,  3,  6}
--]]

function love.load()
    -- pattern love configs
    scale = 1.5
    love.keyboard.setKeyRepeat(true)
    love.graphics.setDefaultFilter("nearest",  "nearest")


    player = Player(5, 5, 'Sprites/player.png')
    box = Box(7, 5, 'Sprites/Objects.png')

    entities = {}
    lume.push(entities, player, box)
    
    
    rooms = {
        Room(3, 3, 'Sprites/tiles.png',  {
            {1,  3,  3,  3,  3,  3,  3,  2},
            {7,  4,  4,  4,  4,  4,  4,  5,  3,  3,  2},
            {7,  4,  4,  4,  4,  4,  4,  4,  4,  4,  7},
            {7,  4,  4,  4,  4,  4,  4,  4,  4,  4,  7},
            {7,  4,  4,  4,  4,  4,  4,  1,  3,  3,  6},
            {5,  3,  3,  3,  3,  3,  3,  6}
        })
    }
end

function love.update(dt)
    for key, entity in ipairs(entities) do
        entity:update(dt, rooms[1])
    end
end

function love.draw()
    love.graphics.scale(scale)
    rooms[1]:draw()
    for key, entity in ipairs(entities) do
        entity:draw()
    end
end

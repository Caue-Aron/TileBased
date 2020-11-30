Object = require "Object"
lume = require "lume"
Entity = require "Entity"

---@class Player
Player = Entity:extend()
local frame_Vel = 2.5
local frame_Initial = 1
local frame_Final = 1
local frame_Current = 1
local frames = {}
local stop = true

function Player:new(x, y, img)
    Player.super.new(self, x, y, img)

    for i = 0, 2 do
        for j = 0, 3 do
            lume.push(frames, love.graphics.newQuad(
                1 + j * (Entity.size + 1),
                1 + i * (Entity.size + 1),
                Entity.size, Entity.size,
                self.img:getWidth(),
                self.img:getHeight()
            )) 
        end
    end
end

function Player:update(dt)
    self:getInput(dt)

    frame_Current = frame_Current + frame_Vel * dt
    if frame_Current >= frame_Final then
        frame_Current = frame_Initial
    end
end

function Player:draw()
    love.graphics.draw(
        self.img,
        frames[math.floor(frame_Current)],
        self.x, self.y
    )
end

function Player:getInput(dt)
    local key = love.keyboard.isDown

    local x = self.x
    local y = self.y

    if key("down") then
        frame_Initial = 2
        frame_Current = frame_Initial
        frame_Final = 4
        y = y + 4 * self.vel * dt

    elseif key("right") then
        frame_Initial = 5
        frame_Current = frame_Initial
        frame_Final = 9
        x = x + 4 * self.vel * dt
    
    elseif key("left") then
        frame_Initial = 9
        frame_Current = frame_Initial
        frame_Final = 13
        x = x - 4 * self.vel * dt
    else
    end

    self.y = y
    self.x = x
end

return Player
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

    for i = 0, 3 do
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
local stop

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

local lastkey
local str_k
function Player:getInput(dt)
    local key = love.keyboard.isDown

    local x = self.x
    local y = self.y

    if
        not key("down") and not key("left") and
        not key("right") and not key("up")
    then
        stop = true
        frame_Current = frame_Initial + 1
        if frame_Initial == 2 then
            frame_Current = 1
        elseif frame_Initial == 14 then
            frame_Current = 13
        end
        return
    end

    if key("down") then
        str_k = "down"
        frame_Final = 4
        frame_Initial = 2

        if lastkey ~= str_k then
            frame_Current = frame_Initial
            lastkey = str_k
        end

        y = y + 4 * self.vel * dt

        if stop then
            frame_Current = frame_Initial + 1
            stop = false
        end
        
    elseif key("right") then
        str_k = "right"
        frame_Final = 9
        frame_Initial = 5
        
        if lastkey ~= str_k then
            frame_Current = frame_Initial
            lastkey = str_k
        end

        x = x + 4 * self.vel * dt

        if stop then
            frame_Current = frame_Initial + 1
            stop = false
        end
        
    elseif key("left") then
        str_k = "left"
        frame_Initial = 9
        frame_Final = 13

        if lastkey ~= str_k then
            frame_Current = frame_Initial
            lastkey = str_k
        end

        x = x - 4 * self.vel * dt

        if stop then
            frame_Current = frame_Initial + 1
            stop = false
        end

    elseif key("up") then
        str_k = "up"
        frame_Initial = 14
        frame_Final = 16

        if lastkey ~= str_k then
            frame_Current = frame_Initial
            lastkey = str_k
        end

        y = y - 4 * self.vel * dt

        if stop then
            frame_Current = frame_Initial + 1
            stop = false
        end
    end

    

    self.y = y
    self.x = x
end

return Player
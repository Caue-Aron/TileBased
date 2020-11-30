Object = require "Object"
lume = require "lume"
Entity = require "Entity"

---@class room
--[[
    Stores map information such as images of
    the tiles on floor and size
--]]
Room = Entity:extend()

---@param img string
---@param t array_of_numbers

--[[
    for rooms, the x and y represent the position of
    the first tile    
--]]

function Room:new(x, y, img, t)

    Room.super.new(self, x, y, img)
    self.map = t
    self.quads = {}


    for i = 0, 1 do
        for j = 0, 3 do
            lume.push(self.quads, love.graphics.newQuad(
                1 + j * (Entity.size + 1),
                1 + i * (Entity.size + 1),
                Entity.size, Entity.size,
                self.img:getWidth(),
                self.img:getHeight()
            ))
        end
    end

end

function Room:draw()
    for i, rows in ipairs(self.map) do
        for j, tile in ipairs(rows) do
            if tile ~= 0 then
                love.graphics.draw(
                    self.img, self.quads[tile],
                    (j - 1) * Entity.size + self.x,
                    (i - 1) * Entity.size + self.y
                )
            end
        end
    end
end

return Room
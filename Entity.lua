Object = require "Object"
lume = require "lume"

---@class Entity
Entity = Object:extend()

Entity.size = 32

---@param x number
---@param y number
---@param img string
function Entity:new(x, y, img)
    self.x = x * Entity.size
    self.y = y * Entity.size

    self.previous_x = self.x
    self.previous_y = self.y
    self.quad = {}

    self.vel = 10

    self.img = love.graphics.newImage(img)
end

------------------------------------------------------------

function Entity:update(dt, room)
    self.previous_x = self.x
    self.previous_y = self.y
end

function Entity:draw()
    love.graphics.draw(self.img, self.quad, self.x, self.y)
end

-- collisions
function Entity:colision(room)
    if self:colision_wall(room) then
        self.x = self.previous_x
        self.y = self.previous_y
    end
end

function Entity:colision_wall(room)
    local size = Entity.size
    local x = room.x / size - 1
    local y = room.y / size - 1
    local map = room.map

    for i, rows in ipairs(map) do
        for j, wall in ipairs(rows) do

            -- checks if the tile is a wall
            if wall ~= 0 and wall ~= 4 then
                local e = {}
                    e.x = size * (j + 2)
                    e.y = size * (i + 2)
                    
                    e.width = 32
                    e.height = 32

                if  self.x + size > e.x
                and self.x < e.x + e.width
                and self.y + size > e.y
                and self.y < e.y + e.height
                then return true end
            end
        end
    end
end

return Entity
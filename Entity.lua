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

    self.vel = 10

    self.img = love.graphics.newImage(img)
end

return Entity
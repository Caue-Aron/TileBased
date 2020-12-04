Object = require "Object"
lume = require "lume"
Entity = require "Entity"

---@class Box
Box = Entity:extend()

function Box:new(x, y, img)
    Box.super.new(self, x, y, img)

    self.quad = love.graphics.newQuad(
        1, 1,
        Entity.size, Entity.size,
        self.img:getWidth(),
        self.img:getHeight()
    )
end

return Box
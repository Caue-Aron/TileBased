Object = require 'Object'

Class = Object:extend()
function Class:new()
    local f
    function self.setf(newf)
        f = newf + 2    
    end

    function self.getf()
        return f
    end
end

Class2 = Class:extend()
function Class2:new()
    Class2.super.new(self)
end

c = Class2()
c.setf(4)

print(c.getf())
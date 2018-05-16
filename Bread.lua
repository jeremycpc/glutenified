Bread = Class{}

local BREAD_IMAGE = love.graphics.newImage('bread.png')

function Bread:init(orientation, y)
  self.x = VIRTUAL_WIDTH + 64
  self.y = y

  self.width = BREAD_WIDTH
  self.height = BREAD_HEIGHT

  self.orientation = orientation
end

function Bread:update(dt)
end

function Bread:render()
  love.graphics.draw(BREAD_IMAGE, self.x, (self.orientation == 'top' and self.y + BREAD_HEIGHT or self.y),
  0, -- rotation
  1, -- X scale
  self.orientation == 'top' and -1 or 1)
end


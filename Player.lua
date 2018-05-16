Player = Class{}

local GRAVITY = 20

function Player:init()
  self.image = love.graphics.newImage('player.png')
  self.x = VIRTUAL_WIDTH / 2 - 8
  self.y = VIRTUAL_HEIGHT / 2 - 8

  self.width = self.image:getWidth()
  self.height = self.image:getHeight()

  self.dy = 0
end

function Player:collides(bread)
  if (self.x + 2) + (self.width - 4) >= bread.x and self.x + 2 <= bread.x + BREAD_WIDTH then
    if (self.y + 2) + (self.height - 4) >= bread.y and self.y + 2 <= bread.y + BREAD_HEIGHT then
      return true
    end
  end

  return false
end

function Player:update(dt)
  self.dy = self.dy + GRAVITY * dt

  if love.keyboard.wasPressed('space') or love.mouse.wasPressed(1) then
    self.dy = -5
  end

  self.y = self.y + self.dy
end

function Player:render()
  love.graphics.draw(self.image, self.x, self.y)
end

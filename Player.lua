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
  if (self.x + 4) + (self.width - 8) >= bread.x and self.x + 4 <= bread.x + BREAD_WIDTH then
    if (self.y + 4) + (self.height - 8) >= bread.y and self.y + 4 <= bread.y + BREAD_HEIGHT then
      return true
    end
  end

  return false
end

function Player:update(dt)
  self.dy = self.dy + GRAVITY * dt

  if love.keyboard.wasPressed('space') or love.mouse.wasPressed(1) then
    self.dy = -5
    sounds['jump']:play()
  end

  self.y = self.y + self.dy
end

function Player:render()
  love.graphics.draw(self.image, self.x, self.y)
end

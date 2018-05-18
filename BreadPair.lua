BreadPair = Class{}

local GAP_HEIGHT = math.random(70, 90)

function BreadPair:init(y)
  self.score = false

  self.x = VIRTUAL_WIDTH + 32

  self.y = y

  self.breads = {
    ['upper'] = Bread('top', self.y),
    ['lower'] = Bread('bottom', self.y + BREAD_HEIGHT + GAP_HEIGHT)
  }
  self.remove = false
end

function BreadPair:update(dt)
  if self.x > -BREAD_WIDTH then
    self.x = self.x - BREAD_SPEED * dt
    self.breads['lower'].x = self.x
    self.breads['upper'].x = self.x
  else
    self.remove = true
  end
end

function BreadPair:render()
  for l, bread in pairs(self.breads) do
    bread:render()
  end
end

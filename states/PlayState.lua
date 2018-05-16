PlayState = Class{__includes = BaseState}


BREAD_SPEED = 60
BREAD_WIDTH = 1
BREAD_HEIGHT = 288

PLAYER_WIDTH = 38
PLAYER_HEIGHT = 24

function PlayState:init()
  self.player = Player()
  self.breadPairs = {}
  self.spawnTimer = 0
  self.score = 0

  self.lastY = -BREAD_HEIGHT + math.random(80) + 20
end

function PlayState:update(dt)
  self.spawnTimer = self.spawnTimer + dt

  if self.spawnTimer > 3 then
    local y = math.max(-BREAD_HEIGHT + 10,
      math.min(self.lastY + math.random(-20, 20), VIRTUAL_HEIGHT - 90 - BREAD_HEIGHT))
    self.lastY = y

    table.insert(self.breadPairs, BreadPair(y))

    self.spawnTimer = 0
  end

  for k, pair in pairs(self.breadPairs) do
    if not pair.scored then
      if pair.x + BREAD_WIDTH < self.player.x then
        self.score = self.score + 1
        pair.scored = true
      end
    end
    pair:update(dt)
  end

  for k, pair in pairs(self.breadPairs) do
    if pair.remove then
      table.remove(self.breadPairs, k)
    end
  end

  for k, pair in pairs(self.breadPairs) do
    for l, bread in pairs(pair.breads) do
      if self.player:collides(bread) then
        gStateMachine:change('score', {
          score = self.score
        })
      end
    end
  end

  self.player:update(dt)

  if self.player.y > VIRTUAL_HEIGHT - 15 then
    gStateMachine:change('score', {
      score = self.score
    })
  end
end

function PlayState:render()
  for k, pair in pairs(self.breadPairs) do
    pair:render()
  end

  love.graphics.setFont(flappyFont)
  love.graphics.print('Score: '..tostring(self.score), 8, 8)

  self.player:render()
end

function PlayState:enter()
  scrolling = true
end

function PlayState:exit()
  scrolling = false
end

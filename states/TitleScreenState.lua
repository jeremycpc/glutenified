TitleScreenState = Class{__includes = BaseState} --inherits from BaseState

function TitleScreenState:init()
end

function TitleScreenState:update(dt)
  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateMachine:change('countdown')
  end
end

function TitleScreenState:render()
  love.graphics.setFont(flappyFont)
  love.graphics.printf('Glutenified!', 0, 64, VIRTUAL_WIDTH, 'center')

  love.graphics.setFont(mediumFont)
  love.graphics.printf('Press enter', 0, 100, VIRTUAL_WIDTH, 'center')
end

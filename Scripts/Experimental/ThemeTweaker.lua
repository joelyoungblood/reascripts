gfx.init('Basic Theme Adjuster',600,600)
mouseXold, mouseYold = 0, 0

Slider = {}
function Slider:new(o)
  self.__index = self
  self.y = self.y or 0
  setmetatable(o, self)
  return o
end 

function Slider:draw()
  gfx.set(0,1,0)
  gfx.x, gfx.y = 0, self.y+6
  gfx.drawstr(self.desc, 2, 190, self.y+20)
  gfx.rect(200, self.y, 300, 20)
  gfx.x, gfx.y = 510, self.y+6
  gfx.drawstr(self.value)
  gfx.set(0,0,0)
  gfx.rect(200 + ((self.value - self.min_value) * 276 / (self.max_value - self.min_value) + 2), self.y+2, 20, 16)
end

function slidersFromParameters()
  local i=0
  sliders = {}
  while reaper.ThemeLayout_GetParameter(i) ~= nil do -- look through each parameter the theme has created
    local scalar_name, desc, value, default_value, min_value, max_value = reaper.ThemeLayout_GetParameter(i) -- get each parameter's values
    sliders[scalar_name] = Slider:new{y=i*30+10,idx=i,desc=desc, value=value, default_value=default_value, min_value=min_value, max_value=max_value} -- make a slider for it
    i = i+1
  end
end

function runloop()
  c=gfx.getchar()
  for j,k in pairs(sliders) do k:draw()end
  
  -- some crude mouse handling
  local isCap = (gfx.mouse_cap&1)
  if gfx.mouse_x ~= mouseXold or gfx.mouse_y ~= mouseYold or isCap ~= mouseCapOld then
    for j,k in pairs(sliders) do
      if 200<gfx.mouse_x and 500>gfx.mouse_x and k.y+2<gfx.mouse_y and k.y+18>gfx.mouse_y then
        if isCap == 1 then
          if k.dragStart == nil then
            k.dragStart = gfx.mouse_x
            k.dragStartValue = k.value
          end
          local dX = gfx.mouse_x - k.dragStart 
          if dX ~= 0 then
            local v = math.floor(dX * ((k.max_value - k.min_value)/276))
            newValue = k.dragStartValue + v
            if newValue < k.min_value then newValue = k.min_value end
            if newValue > k.max_value then newValue = k.max_value end
            reaper.ThemeLayout_SetParameter(k.idx, newValue, false) -- send the new parameter value to the theme
            k.value = newValue
            reaper.ThemeLayout_RefreshAll() 
            k:draw()
          end
        else k.dragStart, k.dragStartValue = nil, nil  
        end
      end
    end
    mouseXold, mouseYold, mouseCapOld = gfx.mouse_x, gfx.mouse_y, isCap
  end
  if c >= 0 then reaper.runloop(runloop) end
end

slidersFromParameters()
runloop()

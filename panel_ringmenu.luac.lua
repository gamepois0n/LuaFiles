-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\menu\panel_ringmenu.luac 

-- params : ...
-- function num : 0
local JoyPadInputType = {LStick_UP = 0, LStick_DOWN = 1, LStick_LEFT = 2, LStick_RIGHT = 3, UP = 4, DOWN = 5, LEFT = 6, RIGHT = 7}
local UI_IT = CppEnums.UiInputType
PaGlobal_RingMenu = {
_ui = {_menuName = (UI.getChildControl)(Panel_RingMenu, "StaticText_SelectedButtonTitle"), _menuDesc = (UI.getChildControl)(Panel_RingMenu, "StaticText_SelectedButtonDesc"), 
_buttonTemplate = {}
, _center = (UI.getChildControl)(Panel_RingMenu, "Static_CenterPoint")}
, _radius = 231, 
_center = {_x = 0, _y = 0}
, 
_slot = {
[0] = {
input = {JoyPadInputType.RIGHT}
, _func = InventoryWindow_Show}
, 
[1] = {
input = {JoyPadInputType.RIGHT, JoyPadInputType.UP}
}
, 
[2] = {
input = {JoyPadInputType.UP}
}
, 
[3] = {
input = {JoyPadInputType.UP, JoyPadInputType.LEFT}
}
, 
[4] = {
input = {JoyPadInputType.LEFT}
}
, 
[5] = {
input = {JoyPadInputType.LEFT, JoyPadInputType.DOWN}
}
, 
[6] = {
input = {JoyPadInputType.DOWN}
}
, 
[7] = {
input = {JoyPadInputType.DOWN, JoyPadInputType.RIGHT}
}
}
, _currentIndex = 0}
-- DECOMPILER ERROR at PC99: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_RingMenu.initialize = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  (self._center).x = ((self._ui)._center):GetPosX()
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._center).y = ((self._ui)._center):GetPosY()
  local angle = 0
  local angleOffset = 2 * math.pi / 8
  for index = 0, 7 do
    -- DECOMPILER ERROR at PC30: Confused about usage of register: R7 in 'UnsetPending'

    ((self._ui)._buttonTemplate)[index] = (UI.getChildControl)(Panel_RingMenu, "Button_Templete" .. index)
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._slot)[index])._icon = ((self._ui)._buttonTemplate)[index]
    angle = angle + angleOffset
    local x = self._radius * (math.cos)(angle)
    local y = self._radius * (math.sin)(angle)
    ;
    (((self._ui)._buttonTemplate)[index]):SetPosX((self._center).x + x - 50)
    ;
    (((self._ui)._buttonTemplate)[index]):SetPosY((self._center).y + y - 50)
  end
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_RingMenu.SetTarget = function(self)
  -- function num : 0_1
  QuickSlot_Click(self._currentIndex % 10)
  keyCustom_KeyProcessed_Ui((CppEnums.UiInputType).UiInputType_CursorOnOff)
end

FGlobal_RingMenu_Update = function()
  -- function num : 0_2 , upvalues : JoyPadInputType
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if isPadPressed(JoyPadInputType.RIGHT) == true and isPadPressed(JoyPadInputType.UP) == true then
    PaGlobal_RingMenu._currentIndex = 1
  else
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

    if isPadPressed(JoyPadInputType.UP) == true and isPadPressed(JoyPadInputType.LEFT) == true then
      PaGlobal_RingMenu._currentIndex = 3
    else
      -- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

      if isPadPressed(JoyPadInputType.LEFT) == true and isPadPressed(JoyPadInputType.DOWN) == true then
        PaGlobal_RingMenu._currentIndex = 5
      else
        -- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

        if isPadPressed(JoyPadInputType.DOWN) == true and isPadPressed(JoyPadInputType.RIGHT) == true then
          PaGlobal_RingMenu._currentIndex = 7
        else
          -- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

          if isPadPressed(JoyPadInputType.UP) == true then
            PaGlobal_RingMenu._currentIndex = 2
          else
            -- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

            if isPadPressed(JoyPadInputType.DOWN) == true then
              PaGlobal_RingMenu._currentIndex = 6
            else
              -- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

              if isPadPressed(JoyPadInputType.LEFT) == true then
                PaGlobal_RingMenu._currentIndex = 4
              else
                -- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

                if isPadPressed(JoyPadInputType.RIGHT) == true then
                  PaGlobal_RingMenu._currentIndex = 0
                end
              end
            end
          end
        end
      end
    end
  end
  -- DECOMPILER ERROR at PC109: Confused about usage of register: R0 in 'UnsetPending'

  if isPadPressed(JoyPadInputType.LStick_RIGHT) == true and isPadPressed(JoyPadInputType.LStick_UP) == true then
    PaGlobal_RingMenu._currentIndex = 1
  else
    -- DECOMPILER ERROR at PC124: Confused about usage of register: R0 in 'UnsetPending'

    if isPadPressed(JoyPadInputType.LStick_UP) == true and isPadPressed(JoyPadInputType.LStick_LEFT) == true then
      PaGlobal_RingMenu._currentIndex = 3
    else
      -- DECOMPILER ERROR at PC139: Confused about usage of register: R0 in 'UnsetPending'

      if isPadPressed(JoyPadInputType.LStick_LEFT) == true and isPadPressed(JoyPadInputType.LStick_DOWN) == true then
        PaGlobal_RingMenu._currentIndex = 5
      else
        -- DECOMPILER ERROR at PC154: Confused about usage of register: R0 in 'UnsetPending'

        if isPadPressed(JoyPadInputType.LStick_DOWN) == true and isPadPressed(JoyPadInputType.LStick_RIGHT) == true then
          PaGlobal_RingMenu._currentIndex = 7
        else
          -- DECOMPILER ERROR at PC163: Confused about usage of register: R0 in 'UnsetPending'

          if isPadPressed(JoyPadInputType.LStick_UP) == true then
            PaGlobal_RingMenu._currentIndex = 2
          else
            -- DECOMPILER ERROR at PC172: Confused about usage of register: R0 in 'UnsetPending'

            if isPadPressed(JoyPadInputType.LStick_DOWN) == true then
              PaGlobal_RingMenu._currentIndex = 6
            else
              -- DECOMPILER ERROR at PC181: Confused about usage of register: R0 in 'UnsetPending'

              if isPadPressed(JoyPadInputType.LStick_LEFT) == true then
                PaGlobal_RingMenu._currentIndex = 4
              else
                -- DECOMPILER ERROR at PC190: Confused about usage of register: R0 in 'UnsetPending'

                if isPadPressed(JoyPadInputType.LStick_RIGHT) == true then
                  PaGlobal_RingMenu._currentIndex = 0
                end
              end
            end
          end
        end
      end
    end
  end
end

PaGlobal_RingMenu:initialize()
Panel_RingMenu:RegisterUpdateFunc("FGlobal_RingMenu_Update")


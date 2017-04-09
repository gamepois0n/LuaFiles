-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\customization\panel_charactercreation_mainslide.luac 

-- params : ...
-- function num : 0
local Button_MainButton = (UI.getChildControl)(Panel_CustomizationMainSlide, "Button_MainButton")
local Button_Group = (UI.getChildControl)(Panel_CustomizationMainSlide, "Button_Group")
local staticMainImage = {}
staticMainImage[1] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_Weather")
staticMainImage[2] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_Customization")
staticMainImage[3] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_BG")
staticMainImage[4] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_Pose")
local staticPoseImage = {}
staticPoseImage[1] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_look")
staticPoseImage[2] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_costume")
local staticCustom = {}
staticCustom[1] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_Hair")
staticCustom[2] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_Face")
staticCustom[3] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_Form")
local staticWeatherImage = {}
staticWeatherImage[1] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_Weather_01")
staticWeatherImage[2] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_Weather_02")
staticWeatherImage[3] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_Weather_03")
staticWeatherImage[4] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_Weather_04")
staticWeatherImage[5] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_Weather_05")
staticWeatherImage[6] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_Weather_06")
staticWeatherImage[7] = (UI.getChildControl)(Panel_CustomizationMainSlide, "Static_Weather_07")
local slideButtons = {}
local menuFilter = 0
local timer = 0
local isSubEffectPlay = false
Panel_CustomizationMainSlide:RegisterUpdateFunc("MainSlidePanel_UpdatePerFrame")
SlideMenuFilter = function(index)
  -- function num : 0_0 , upvalues : menuFilter
  menuFilter = 5
end

MainSlidePanel_UpdatePerFrame = function(deltaTime)
  -- function num : 0_1 , upvalues : isSubEffectPlay, timer
  if isSubEffectPlay == false then
    if timer > 0.2 then
      isSubEffectPlay = true
      timer = 0
    else
      timer = timer + deltaTime
    end
  end
end

local SlideMenuCloseMain = function()
  -- function num : 0_2 , upvalues : menuFilter, slideButtons
  local scrY = getScreenSizeY()
  for idx = 1, 4 do
    local filterIndex = 0
    if menuFilter < idx then
      filterIndex = -1
    end
    if idx ~= menuFilter then
      local control = (slideButtons[idx]).control
      local aniInfo = control:addMoveAnimation(0, 0.1, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_LINEAR)
      local mainEndPosX = (idx - 1 + filterIndex) * control:GetSizeX()
      local imageControl = (slideButtons[idx]).slideImage
      local aniImageInfo = imageControl:addMoveAnimation(0, 0.1, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_LINEAR)
      local subControlLength = 0
      aniInfo:SetStartPosition(control:GetPosX(), control:GetPosY())
      aniImageInfo:SetStartPosition(control:GetPosX() + (control:GetSizeX() - imageControl:GetSizeX()) / 2, control:GetPosY() + (control:GetSizeY() - imageControl:GetSizeY()) / 2)
      aniInfo:SetEndPosition(mainEndPosX, scrY - control:GetSizeY())
      aniImageInfo:SetEndPosition(mainEndPosX + (control:GetSizeX() - imageControl:GetSizeX()) / 2, scrY - control:GetSizeY() + (control:GetSizeY() - imageControl:GetSizeY()) / 2)
      control:CalcUIAniPos(aniInfo)
      imageControl:CalcUIAniPos(aniImageInfo)
      -- DECOMPILER ERROR at PC99: Confused about usage of register: R12 in 'UnsetPending'

      ;
      (slideButtons[idx]).isOpen = false
      local aniImageColorInfo = imageControl:addColorAnimation(0, 0.2, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_LINEAR)
      local alpha = imageControl:GetAlpha()
      if alpha == 1 then
        aniImageColorInfo:SetStartColor((Defines.Color).C_FFFFFFFF)
      else
        aniImageColorInfo:SetStartColor(2164260863)
      end
      aniImageColorInfo:SetEndColor(2164260863)
      for subidx = 1, (slideButtons[idx]).subControlCount do
        local subControl = ((slideButtons[idx]).subControl)[subidx]
        local subAniInfo = (UIAni.AlphaAnimation)(0, subControl, 0, 0.2)
        subAniInfo:SetHideAtEnd(true)
        subControl:EraseAllEffect()
        local subControlImage = ((slideButtons[idx]).subControlImage)[subidx]
        if subControlImage ~= nil then
          local aniSubInfo = (UIAni.AlphaAnimation)(0, subControlImage, 0, 0.2)
          aniSubInfo:SetHideAtEnd(true)
        end
      end
    end
  end
end

SlideMenuOpenMain = function(index)
  -- function num : 0_3 , upvalues : slideButtons, SlideMenuCloseMain, isSubEffectPlay, menuFilter
  if (slideButtons[index]).isOpen == true then
    SlideMenuCloseMain()
  else
    ;
    ((slideButtons[index]).control):EraseAllEffect()
    ;
    ((slideButtons[index]).control):AddEffect("UI_Customize_Button01", false, 0, 0)
    local scrY = getScreenSizeY()
    isSubEffectPlay = false
    for idx = 1, 4 do
      local filterIndex = 0
      if menuFilter < idx then
        filterIndex = -1
      end
      if idx ~= menuFilter then
        local control = (slideButtons[idx]).control
        local aniInfo = control:addMoveAnimation(0, 0.1, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_LINEAR)
        local mainEndPosX = (idx - 1 + filterIndex) * control:GetSizeX()
        local imageControl = (slideButtons[idx]).slideImage
        local aniImageInfo = imageControl:addMoveAnimation(0, 0.1, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_LINEAR)
        local subControlLength = 0
        if (slideButtons[index]).subControlCount > 0 then
          subControlLength = (slideButtons[index]).subControlCount * (((slideButtons[index]).subControl)[1]):GetSizeX()
        end
        aniInfo:SetStartPosition(control:GetPosX(), control:GetPosY())
        aniImageInfo:SetStartPosition(control:GetPosX() + (control:GetSizeX() - imageControl:GetSizeX()) / 2, control:GetPosY() + (control:GetSizeY() - imageControl:GetSizeY()) / 2)
        if idx <= index then
          aniInfo:SetEndPosition(mainEndPosX, scrY - control:GetSizeY())
          aniImageInfo:SetEndPosition(mainEndPosX + (control:GetSizeX() - imageControl:GetSizeX()) / 2, scrY - control:GetSizeY() + (control:GetSizeY() - imageControl:GetSizeY()) / 2)
        else
          aniInfo:SetEndPosition(mainEndPosX + subControlLength, scrY - control:GetSizeY())
          aniImageInfo:SetEndPosition(mainEndPosX + subControlLength + (control:GetSizeX() - imageControl:GetSizeX()) / 2, scrY - control:GetSizeY() + (control:GetSizeY() - imageControl:GetSizeY()) / 2)
        end
        control:CalcUIAniPos(aniInfo)
        imageControl:CalcUIAniPos(aniImageInfo)
        local aniImageColorInfo = imageControl:addColorAnimation(0, 0.2, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_LINEAR)
        local alpha = imageControl:GetAlpha()
        if idx == index then
          if alpha == 1 then
            aniImageColorInfo:SetStartColor((Defines.Color).C_FFFFFFFF)
          else
            aniImageColorInfo:SetStartColor(2164260863)
          end
          aniImageColorInfo:SetEndColor((Defines.Color).C_FFFFFFFF)
          -- DECOMPILER ERROR at PC194: Confused about usage of register: R15 in 'UnsetPending'

          ;
          (slideButtons[idx]).isOpen = true
          for subidx = 1, (slideButtons[index]).subControlCount do
            local subControl = ((slideButtons[index]).subControl)[subidx]
            local subControlImage = ((slideButtons[index]).subControlImage)[subidx]
            subControl:SetShow(true)
            subControl:EraseAllEffect()
            subControl:SetAlpha(0)
            ;
            (UIAni.AlphaAnimation)(1, subControl, 0, 0.2)
            local subAniInfo = subControl:addMoveAnimation(0, 0.2, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_LINEAR)
            subAniInfo:SetStartPosition(control:GetPosX(), subControl:GetPosY())
            subAniInfo:SetEndPosition(mainEndPosX + control:GetSizeY() + (subidx - 1) * subControl:GetSizeX(), scrY - subControl:GetSizeY())
            subControl:CalcUIAniPos(subAniInfo)
            if subControlImage ~= nil then
              subControlImage:SetShow(true)
              subControlImage:SetAlpha(0)
              ;
              (UIAni.AlphaAnimation)(1, subControlImage, 0, 0.2)
              local subImageAniInfo = subControlImage:addMoveAnimation(0, 0.2, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_LINEAR)
              subImageAniInfo:SetStartPosition(control:GetPosX(), subControl:GetPosY())
              subImageAniInfo:SetEndPosition(mainEndPosX + control:GetSizeY() + (subidx - 1) * subControl:GetSizeX(), scrY - subControl:GetSizeY())
              subControlImage:CalcUIAniPos(subImageAniInfo)
            end
          end
        else
          do
            if alpha == 1 then
              aniImageColorInfo:SetStartColor((Defines.Color).C_FFFFFFFF)
            else
              aniImageColorInfo:SetStartColor(2164260863)
            end
            aniImageColorInfo:SetEndColor(2164260863)
            -- DECOMPILER ERROR at PC315: Confused about usage of register: R15 in 'UnsetPending'

            ;
            (slideButtons[idx]).isOpen = false
            for subidx = 1, (slideButtons[idx]).subControlCount do
              local subControl = ((slideButtons[idx]).subControl)[subidx]
              local aniInfo = (UIAni.AlphaAnimation)(0, subControl, 0, 0.2)
              aniInfo:SetHideAtEnd(true)
              subControl:EraseAllEffect()
              local subControlImage = ((slideButtons[idx]).subControlImage)[subidx]
              if subControlImage ~= nil then
                local aniSubInfo = (UIAni.AlphaAnimation)(0, subControlImage, 0, 0.2)
                aniSubInfo:SetHideAtEnd(true)
              end
            end
            do
              -- DECOMPILER ERROR at PC355: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC355: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC355: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC355: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC355: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end

local createWeatherGroup = function(mainInfo)
  -- function num : 0_4 , upvalues : Button_Group, staticWeatherImage
  local count = getWeatherCount()
  mainInfo.subControlCount = count
  for ii = 1, count do
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R6 in 'UnsetPending'

    (mainInfo.subControl)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_CustomizationMainSlide, "MAIN_BUTTON_SLIDE_WEATHER" .. ii)
    CopyBaseProperty(Button_Group, (mainInfo.subControl)[ii])
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (mainInfo.subControlImage)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CustomizationMainSlide, "MAIN_STATIC_SLIDE_WEATER_IMG_" .. ii)
    CopyBaseProperty(staticWeatherImage[ii], (mainInfo.subControlImage)[ii])
    ;
    ((mainInfo.subControl)[ii]):addInputEvent("Mouse_LUp", "applyWeather(" .. ii - 1 .. ")")
    ;
    ((mainInfo.subControl)[ii]):addInputEvent("Mouse_On", "overSubSlideButton(\"" .. ((mainInfo.subControl)[ii]):GetID() .. "\"" .. ")")
  end
end

local createCustomizationGroup = function(mainInfo)
  -- function num : 0_5 , upvalues : Button_Group, staticCustom
  for ii = 1, 3 do
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R5 in 'UnsetPending'

    (mainInfo.subControl)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_CustomizationMainSlide, "MAIN_BUTTON_SLIDE_CUSTOM" .. ii)
    CopyBaseProperty(Button_Group, (mainInfo.subControl)[ii])
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (mainInfo.subControlImage)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CustomizationMainSlide, "MAIN_STATIC_SLIDE_CUSTOM" .. ii)
    CopyBaseProperty(staticCustom[ii], (mainInfo.subControlImage)[ii])
    ;
    ((mainInfo.subControl)[ii]):addInputEvent("Mouse_LUp", "ChangeCustomUIMode(" .. ii - 1 .. ")")
    ;
    ((mainInfo.subControl)[ii]):addInputEvent("Mouse_On", "overSubSlideButton(\"" .. ((mainInfo.subControl)[ii]):GetID() .. "\"" .. ")")
    mainInfo.subControlCount = ii
  end
end

local createPoseGroup = function(mainInfo)
  -- function num : 0_6 , upvalues : Button_Group, staticPoseImage
  for ii = 1, 2 do
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R5 in 'UnsetPending'

    (mainInfo.subControl)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_CustomizationMainSlide, "MAIN_BUTTON_SLIDE_POSE" .. ii)
    CopyBaseProperty(Button_Group, (mainInfo.subControl)[ii])
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (mainInfo.subControlImage)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CustomizationMainSlide, "MAIN_STATIC_SLIDE_POSE" .. ii)
    CopyBaseProperty(staticPoseImage[ii], (mainInfo.subControlImage)[ii])
    if ii ~= 2 then
      ((mainInfo.subControl)[ii]):addInputEvent("Mouse_LUp", "SelectPoseControl(" .. ii .. ")")
    else
      ;
      ((mainInfo.subControl)[ii]):addInputEvent("Mouse_LUp", "SelectPoseControl(" .. ii .. ")")
    end
    ;
    ((mainInfo.subControl)[ii]):addInputEvent("Mouse_On", "overSubSlideButton(\"" .. ((mainInfo.subControl)[ii]):GetID() .. "\"" .. ")")
    mainInfo.subControlCount = ii
  end
end

ChangeCustomUIMode = function(index)
  -- function num : 0_7
  selectPoseControl(0)
  CloseFrameSlide()
  SelectCustomizationGroup(index)
end

overSubSlideButton = function(name)
  -- function num : 0_8 , upvalues : isSubEffectPlay
  if isSubEffectPlay == true then
    local control = (UI.getChildControl)(Panel_CustomizationMainSlide, name)
    control:EraseAllEffect()
    control:AddEffect("UI_Customize_Button01_Mini", false, 0, 0)
  end
end

local createBackgroundGroup = function(mainInfo)
  -- function num : 0_9 , upvalues : Button_Group
  local count = 5
  mainInfo.subControlCount = count
  for ii = 1, count do
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R6 in 'UnsetPending'

    (mainInfo.subControl)[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_CustomizationMainSlide, "MAIN_BUTTON_SLIDE_BG" .. ii)
    CopyBaseProperty(Button_Group, (mainInfo.subControl)[ii])
    ;
    ((mainInfo.subControl)[ii]):addInputEvent("Mouse_LUp", "applyBackground(" .. ii - 1 .. ")")
    ;
    ((mainInfo.subControl)[ii]):addInputEvent("Mouse_On", "overSubSlideButton(\"" .. ((mainInfo.subControl)[ii]):GetID() .. "\"" .. ")")
  end
end

SlideMenuCreateUI = function()
  -- function num : 0_10 , upvalues : Button_MainButton, staticMainImage, slideButtons, createWeatherGroup, createCustomizationGroup, createBackgroundGroup, createPoseGroup
  for idx = 1, 4 do
    local mainInfo = {control = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_CustomizationMainSlide, "MAIN_BUTTON_SLIDE_" .. idx), slideImage = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CustomizationMainSlide, "STATIC_SLIDE_IMAGE_" .. idx), isOpen = false, subControlCount = 0, 
subControl = {}
, 
subControlImage = {}
}
    CopyBaseProperty(Button_MainButton, mainInfo.control)
    CopyBaseProperty(staticMainImage[idx], mainInfo.slideImage)
    ;
    (staticMainImage[idx]):SetShow(false)
    local scrY = getScreenSizeY()
    ;
    (mainInfo.control):SetPosX((idx - 1) * (mainInfo.control):GetSizeX())
    ;
    (mainInfo.control):SetPosY(scrY - (mainInfo.control):GetSizeY())
    ;
    (mainInfo.control):addInputEvent("Mouse_LUp", "SlideMenuOpenMain(" .. idx .. ")")
    ;
    (mainInfo.control):SetShow(true)
    ;
    (mainInfo.slideImage):SetPosX((idx - 1) * (mainInfo.control):GetSizeX() + ((mainInfo.control):GetSizeX() - (mainInfo.slideImage):GetSizeX()) / 2)
    ;
    (mainInfo.slideImage):SetPosY(scrY - (mainInfo.control):GetSizeY() + ((mainInfo.control):GetSizeY() - (mainInfo.slideImage):GetSizeY()) / 2)
    -- DECOMPILER ERROR at PC110: Confused about usage of register: R6 in 'UnsetPending'

    slideButtons[idx] = mainInfo
    if idx == 1 then
      createWeatherGroup(slideButtons[idx])
    else
      if idx == 2 then
        createCustomizationGroup(slideButtons[idx])
      else
        if idx == 3 then
          createBackgroundGroup(slideButtons[idx])
        else
          if idx == 4 then
            createPoseGroup(slideButtons[idx])
          end
        end
      end
    end
  end
end

CustomizationSlideUIShow = function(show)
  -- function num : 0_11 , upvalues : menuFilter, slideButtons
  if Panel_CustomizationMainSlide:GetShow() == show then
    return 
  end
  if show == true then
    Panel_CustomizationMainSlide:SetShow(true)
    Panel_CustomizationMainSlide:SetAlpha(0)
    ;
    (UIAni.AlphaAnimation)(1, Panel_CustomizationMainSlide, 0, 0.2)
    local scrY = getScreenSizeY()
    for idx = 1, 4 do
      local filter = 0
      if menuFilter < idx then
        filter = -1
      end
      local control = (slideButtons[idx]).control
      local slideImage = (slideButtons[idx]).slideImage
      if idx == menuFilter then
        control:SetShow(false)
        slideImage:SetShow(false)
      else
        control:SetShow(true)
        slideImage:SetShow(true)
        control:SetPosX((idx - 1 + filter) * control:GetSizeX())
        control:SetPosY(scrY - control:GetSizeY())
        slideImage:SetPosX((idx - 1 + filter) * control:GetSizeX() + (control:GetSizeX() - slideImage:GetSizeX()) / 2)
        slideImage:SetPosY(scrY - control:GetSizeY() + (control:GetSizeY() - slideImage:GetSizeY()) / 2)
      end
      for subIdx = 1, (slideButtons[idx]).subControlCount do
        (((slideButtons[idx]).subControl)[subIdx]):SetShow(false)
        if ((slideButtons[idx]).subControlImage)[subIdx] ~= nil then
          (((slideButtons[idx]).subControlImage)[subIdx]):SetShow(false)
        end
      end
    end
  else
    do
      local aniInfo = (UIAni.AlphaAnimation)(0, Panel_CustomizationMainSlide, 0, 0.2)
      aniInfo:SetHideAtEnd(true)
    end
  end
end



-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\ingamecashshop\panel_window_stampcoupon.luac 

-- params : ...
-- function num : 0
Panel_Window_StampCoupon:SetShow(false, false)
Panel_Window_StampCoupon:SetDragEnable(true)
Panel_Window_StampCoupon:SetDragAll(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
local UI_TT = CppEnums.PAUI_TEXTURE_TYPE
local PearlStamp = {tempStampSlot = (UI.getChildControl)(Panel_Window_StampCoupon, "Static_StampBG"), tempStamp = (UI.getChildControl)(Panel_Window_StampCoupon, "Static_Stamp"), btnClose = (UI.getChildControl)(Panel_Window_StampCoupon, "Button_Win_Close"), staticPageNoText = (UI.getChildControl)(Panel_Window_StampCoupon, "Static_PageNo"), staticBG = (UI.getChildControl)(Panel_Window_StampCoupon, "Static_Bg"), 
pearlStampControl = {}
, 
slotConfig = {createIcon = true, createBorder = true, createCount = true, createClassEquipBG = true, createCash = true}
, pearlStampCount = 10, userPearlStampCount = 0, prevPearlStampCount = 0, pearlStampWrapper = nil, maxPageNo = 0, currentPageNo = 0}
PearlStamp.staticBG2 = (UI.getChildControl)(PearlStamp.staticBG, "Static_Bg2")
local basePosX = (PearlStamp.tempStampSlot):GetPosX()
local basePosY = (PearlStamp.tempStampSlot):GetPosY()
local gapX = 2
local gapY = 2
local isOpenPearlStamp = ToClient_IsContentsGroupOpen("308")
PearlStamp.Init = function(self)
  -- function num : 0_0 , upvalues : basePosX, gapX, basePosY, gapY
  self.pearlStampWrapper = ToClient_GetPearlStampWrapper()
  local staticBottom = (UI.getChildControl)(Panel_Window_StampCoupon, "StaticText_BottomDesc")
  local pearlstandvalue = (self.pearlStampWrapper):getUsePearlStampStandard()
  local text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PEARLSTAMP_DESC", "pearlCount", tostring(pearlstandvalue))
  staticBottom:setPadding((CppEnums.Padding).ePadding_Left, 10)
  staticBottom:setPadding((CppEnums.Padding).ePadding_Top, 10)
  staticBottom:setPadding((CppEnums.Padding).ePadding_Right, 10)
  staticBottom:setPadding((CppEnums.Padding).ePadding_Bottom, 10)
  staticBottom:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  staticBottom:SetText(text)
  staticBottom:SetSize(staticBottom:GetSizeX(), staticBottom:GetTextSizeY() + 20)
  Panel_Window_StampCoupon:SetSize(Panel_Window_StampCoupon:GetSizeX(), 310 + staticBottom:GetSizeY())
  ;
  (self.staticBG):SetSize((self.staticBG):GetSizeX(), Panel_Window_StampCoupon:GetSizeY() - 70)
  ;
  (self.staticBG2):SetSize((self.staticBG2):GetSizeX(), (self.staticBG):GetSizeY())
  staticBottom:ComputePos()
  ;
  (self.staticBG2):ComputePos()
  local prevButton = (UI.getChildControl)(Panel_Window_StampCoupon, "Button_Prev")
  prevButton:addInputEvent("Mouse_LUp", "FGlobal_PearlStamp_ShowPrevPage()")
  local prevButton = (UI.getChildControl)(Panel_Window_StampCoupon, "Button_Next")
  prevButton:addInputEvent("Mouse_LUp", "FGlobal_PearlStamp_ShowNextPage()")
  for index = 0, self.pearlStampCount - 1 do
    local temp = {}
    temp._dayControl = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Window_StampCoupon, "Static_PearStamp_slot_" .. index)
    CopyBaseProperty(self.tempStampSlot, temp._dayControl)
    ;
    (temp._dayControl):SetPosX(basePosX + ((self.tempStampSlot):GetSizeX() + gapX) * (index % 5))
    ;
    (temp._dayControl):SetPosY(basePosY + ((self.tempStampSlot):GetSizeY() + gapY) * (math.floor)(index / 5))
    ;
    (temp._dayControl):ChangeTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/StampCoupon_00.dds")
    temp._stamp = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._dayControl, "Static_DailyStamp_StampIcon_" .. index)
    CopyBaseProperty(self.tempStamp, temp._stamp)
    ;
    (temp._stamp):SetPosX(0)
    ;
    (temp._stamp):SetPosY(0)
    ;
    (temp._stamp):ChangeTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/StampCoupon_00.dds")
    temp.slot = {}
    ;
    (SlotItem.new)(temp.slot, "PearlStamp_Reward_", index, temp._dayControl, self.slotConfig)
    ;
    (temp.slot):createChild()
    ;
    ((temp.slot).icon):SetPosX(40)
    ;
    ((temp.slot).icon):SetPosY(40)
    local pearlcount = Int64toInt32((self.pearlStampWrapper):getUsePearlStampCount(index + 1))
    local isSpecial = false
    if pearlcount > 0 then
      isSpecial = true
    end
    temp._isSpecial = isSpecial
    ;
    (temp._dayControl):SetShow(true)
    -- DECOMPILER ERROR at PC228: Confused about usage of register: R13 in 'UnsetPending'

    ;
    (self.pearlStampControl)[index] = temp
    FGlobal_PearlStamp_UpdateStampTexture(index, isSpecial)
  end
  ;
  (self.tempStampSlot):SetShow(false)
  ;
  (self.btnClose):addInputEvent("Mouse_LUp", "FGlobal_PearlStamp_HideAni()")
end

FromClient_PearlStampUpdateCount = function()
  -- function num : 0_1 , upvalues : PearlStamp
  local self = PearlStamp
  self.prevPearlStampCount = self.userPearlStampCount
  self.userPearlStampCount = ToClient_GetPearlStampCount()
end

FromClient_PearlStampShow = function()
  -- function num : 0_2 , upvalues : isOpenPearlStamp
  if isOpenPearlStamp == false then
    return 
  end
  Panel_Window_StampCoupon:SetShow(true)
  FromClient_PearlStampUpdateCount()
  FGlobal_PearlStamp_Show()
end

FGlobal_PearlStamp_ShowPrevPage = function()
  -- function num : 0_3 , upvalues : PearlStamp
  local self = PearlStamp
  if self.currentPageNo == 1 then
    return 
  end
  self.currentPageNo = self.currentPageNo - 1
  FGlboal_PearlStamp_UpdatePage(self.currentPageNo, self.pearlStampCount, self.pearlStampCount)
end

FGlobal_PearlStamp_ShowNextPage = function()
  -- function num : 0_4 , upvalues : PearlStamp
  local self = PearlStamp
  if self.maxPageNo <= self.currentPageNo then
    return 
  end
  self.currentPageNo = self.currentPageNo + 1
  do
    if self.currentPageNo == self.maxPageNo then
      local index = self:GetIndex(self.userPearlStampCount)
      FGlboal_PearlStamp_UpdatePage(self.currentPageNo, index + 1, index)
      return 
    end
    FGlboal_PearlStamp_UpdatePage(self.currentPageNo, self.pearlStampCount, self.pearlStampCount)
  end
end

FGlobal_PearlStamp_ShowTooltip = function(index, pearlCount)
  -- function num : 0_5 , upvalues : PearlStamp
  local self = PearlStamp
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_PEARLSTAMP_SLOT_TOOLTIP_TITLE")
  local desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PEARLSTAMP_SLOT_TOOLTIP_DESC", "pearl", pearlCount)
  TooltipSimple_Show((((self.pearlStampControl)[index]).slot).icon, name, desc)
end

FGlboal_PearlStamp_UpdatePage = function(pageno, from, to)
  -- function num : 0_6 , upvalues : PearlStamp
  local self = PearlStamp
  local prevPageCount = (pageno - 1) * self.pearlStampCount
  local originalPageCount = prevPageCount
  local addedPearlCount = prevPageCount / (self.pearlStampWrapper):getPearlStampMax()
  local maxcount = (self.pearlStampWrapper):getUsePearlStampCount((self.pearlStampWrapper):getPearlStampMax())
  addedPearlCount = Int64toInt32(addedPearlCount) * Int64toInt32(maxcount)
  prevPageCount = prevPageCount % (self.pearlStampWrapper):getPearlStampMax()
  self.currentPageNo = pageno
  if self.maxPageNo ~= 1 then
    (self.staticPageNoText):SetText(tostring(self.currentPageNo) .. " / " .. tostring(self.maxPageNo))
  else
    ;
    (self.staticPageNoText):SetText(tostring(self.currentPageNo))
  end
  for index = 0, self.pearlStampCount - 1 do
    (((self.pearlStampControl)[index])._dayControl):ResetVertexAni()
    ;
    (((self.pearlStampControl)[index])._stamp):ResetVertexAni()
    ;
    (((self.pearlStampControl)[index])._stamp):SetShow(false)
  end
  for index = 0, self.pearlStampCount - 1 do
    local pearlcount = Int64toInt32((self.pearlStampWrapper):getUsePearlStampCount(index + prevPageCount + 1))
    local isSpecial = false
    if pearlcount > 0 then
      isSpecial = true
    end
    originalPageCount = index + originalPageCount + 1
    if to < index then
      (((self.pearlStampControl)[index])._dayControl):SetShow(true)
      ;
      (((self.pearlStampControl)[index])._stamp):SetShow(false)
      ;
      ((((self.pearlStampControl)[index]).slot).icon):SetShow(false)
      FGlobal_PearlStamp_UpdateSlotTexture(R15_PC113, false, isSpecial)
      FGlobal_PearlStamp_UpdateStampTexture(R15_PC113, isSpecial)
    else
      -- DECOMPILER ERROR at PC122: Overwrote pending register: R15 in 'AssignReg'

      ;
      (((self.pearlStampControl)[index])._dayControl):SetShow(true)
      -- DECOMPILER ERROR at PC128: Overwrote pending register: R15 in 'AssignReg'

      ;
      (((self.pearlStampControl)[index])._dayControl):SetColor((Defines.Color).C_FFFFFFFF)
      -- DECOMPILER ERROR at PC137: Overwrote pending register: R15 in 'AssignReg'

      ;
      ((((self.pearlStampControl)[index]).slot).icon):SetShow(false)
      -- DECOMPILER ERROR at PC143: Overwrote pending register: R15 in 'AssignReg'

      ;
      (((self.pearlStampControl)[index])._stamp):SetPosX(0)
      -- DECOMPILER ERROR at PC149: Overwrote pending register: R15 in 'AssignReg'

      ;
      (((self.pearlStampControl)[index])._stamp):SetPosY(0)
      -- DECOMPILER ERROR at PC155: Overwrote pending register: R15 in 'AssignReg'

      ;
      (((self.pearlStampControl)[index])._stamp):SetScale(1, 1)
      -- DECOMPILER ERROR at PC165: Overwrote pending register: R15 in 'AssignReg'

      if isSpecial then
        ((((self.pearlStampControl)[index]).slot).icon):SetShow(true)
        -- DECOMPILER ERROR at PC169: Overwrote pending register: R15 in 'AssignReg'

        -- DECOMPILER ERROR at PC170: Overwrote pending register: R15 in 'AssignReg'

        local pearlcount = Int64toInt32(R15_PC113(R15_PC113, prevPageCount + index + 1))
        pearlcount = pearlcount + addedPearlCount
        local itemStatic = getItemEnchantStaticStatus((self.pearlStampWrapper):getPearlEnchantkey())
        ;
        (((self.pearlStampControl)[index]).slot):setItemByStaticStatus(itemStatic, pearlcount)
        ;
        ((((self.pearlStampControl)[index]).slot).icon):addInputEvent("Mouse_On", "FGlobal_PearlStamp_ShowTooltip(" .. R20_PC199 .. "," .. pearlcount .. ")")
        ;
        ((((self.pearlStampControl)[index]).slot).icon):addInputEvent("Mouse_Out", "TooltipSimple_Hide()")
      end
      do
        do
          if from < index then
            (((self.pearlStampControl)[index])._stamp):SetVertexAniRun("Ani_Move_Pos_New", true)
            ;
            (((self.pearlStampControl)[index])._stamp):SetVertexAniRun("Ani_Scale_New", true)
            ;
            (((self.pearlStampControl)[index])._stamp):SetShow(true)
            ;
            (((self.pearlStampControl)[index])._stamp):SetPosX(-15)
            ;
            (((self.pearlStampControl)[index])._stamp):SetPosY(-15)
            audioPostEvent_SystemUi(0, 21)
          else
            ;
            (((self.pearlStampControl)[index])._stamp):SetVertexAniRun("Ani_Move_Pos_New", false)
            ;
            (((self.pearlStampControl)[index])._stamp):SetVertexAniRun("Ani_Scale_New", false)
          end
          ;
          (((self.pearlStampControl)[index])._stamp):SetPosX(0)
          ;
          (((self.pearlStampControl)[index])._stamp):SetPosY(0)
          ;
          (((self.pearlStampControl)[index])._stamp):SetScale(1, 1)
          ;
          (((self.pearlStampControl)[index])._stamp):SetShow(true)
          FGlobal_PearlStamp_UpdateSlotTexture(R15_PC291, true, isSpecial)
          FGlobal_PearlStamp_UpdateStampTexture(R15_PC291, isSpecial)
          -- DECOMPILER ERROR at PC296: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC296: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC296: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

PearlStamp.GetIndex = function(self, pearlCount)
  -- function num : 0_7
  if pearlCount <= 0 then
    return 0
  end
  local index = (pearlCount - 1) % self.pearlStampCount
  return index
end

FGlobal_PearlStamp_Show = function()
  -- function num : 0_8 , upvalues : PearlStamp
  local self = PearlStamp
  local prevStampCount = self.prevPearlStampCount
  self.userPearlStampCount = ToClient_GetPearlStampCount()
  local prevPageNo = (self.pearlStampWrapper):getPearlStampPageNo(prevStampCount, self.pearlStampCount)
  self.currentPageNo = self.maxPageNo
  self.maxPageNo = (self.pearlStampWrapper):getPearlStampPageNo(self.userPearlStampCount, self.pearlStampCount)
  if self.maxPageNo < prevPageNo then
    prevPageNo = self.maxPageNo
  end
  local index = self:GetIndex(self.prevPearlStampCount)
  if self.prevPearlStampCount == 0 then
    index = -1
  end
  local currentPearlIndex = self:GetIndex(self.userPearlStampCount)
  if self.userPearlStampCount == 0 then
    currentPearlIndex = -1
  else
    if currentPearlIndex <= index then
      if currentPearlIndex == index and self.userPearlStampCount == self.prevPearlStampCount then
        index = currentPearlIndex
      else
        index = -1
      end
    end
  end
  if self.userPearlStampCount < prevStampCount then
    index = currentPearlIndex
  end
  FGlboal_PearlStamp_UpdatePage(self.maxPageNo, index, currentPearlIndex)
  self.prevPearlStampCount = self.userPearlStampCount
end

FGlobal_PearlStamp_Close = function()
  -- function num : 0_9
  Panel_Window_StampCoupon:SetShow(false)
end

FGlobal_PearlStamp_ShowAni = function()
  -- function num : 0_10 , upvalues : UI_ANI_ADV, UI_TT
  Panel_Window_StampCoupon:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_MidHorizon.dds")
  local FadeMaskAni = Panel_Window_StampCoupon:addTextureUVAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0, 0, 0)
  FadeMaskAni:SetEndUV(0.6, 0, 0)
  FadeMaskAni:SetStartUV(1, 0, 1)
  FadeMaskAni:SetEndUV(0.4, 0, 1)
  FadeMaskAni:SetStartUV(0, 1, 2)
  FadeMaskAni:SetEndUV(0.6, 1, 2)
  FadeMaskAni:SetStartUV(1, 1, 3)
  FadeMaskAni:SetEndUV(0.4, 1, 3)
  FadeMaskAni.IsChangeChild = true
end

FGlobal_PearlStamp_HideAni = function()
  -- function num : 0_11
  Panel_Window_StampCoupon:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_Window_StampCoupon, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

FGlobal_PearlStamp_UpdateSlotTexture = function(index, isReceive, isSpecial)
  -- function num : 0_12 , upvalues : PearlStamp
  local self = PearlStamp
  ;
  (((self.pearlStampControl)[index])._dayControl):ChangeTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/StampCoupon_00.dds")
  ;
  (((self.pearlStampControl)[index])._dayControl):ChangeOnTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/StampCoupon_00.dds")
  ;
  (((self.pearlStampControl)[index])._dayControl):ChangeClickTextureInfoName("New_UI_Common_ForLua/Window/DailyCheck/StampCoupon_00.dds")
  if isReceive == false then
    if isSpecial == false then
      local x1, y1, x2, y2 = setTextureUV_Func(((self.pearlStampControl)[index])._dayControl, 159, 153, 244, 238)
      ;
      ((((self.pearlStampControl)[index])._dayControl):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      ((((self.pearlStampControl)[index])._dayControl):getClickTexture()):setUV(x1, y1, x2, y2)
      ;
      ((((self.pearlStampControl)[index])._dayControl):getOnTexture()):setUV(x1, y1, x2, y2)
      ;
      (((self.pearlStampControl)[index])._dayControl):setRenderTexture((((self.pearlStampControl)[index])._dayControl):getBaseTexture())
      ;
      (((self.pearlStampControl)[index])._dayControl):SetSize(85, 85)
    else
      do
        do
          local x1, y1, x2, y2 = setTextureUV_Func(((self.pearlStampControl)[index])._dayControl, 245, 153, 330, 238)
          ;
          ((((self.pearlStampControl)[index])._dayControl):getBaseTexture()):setUV(x1, y1, x2, y2)
          ;
          ((((self.pearlStampControl)[index])._dayControl):getClickTexture()):setUV(x1, y1, x2, y2)
          ;
          ((((self.pearlStampControl)[index])._dayControl):getOnTexture()):setUV(x1, y1, x2, y2)
          ;
          (((self.pearlStampControl)[index])._dayControl):setRenderTexture((((self.pearlStampControl)[index])._dayControl):getBaseTexture())
          ;
          (((self.pearlStampControl)[index])._dayControl):SetSize(85, 85)
          if isSpecial == false then
            local x1, y1, x2, y2 = setTextureUV_Func(((self.pearlStampControl)[index])._dayControl, 159, 239, 244, 324)
            ;
            ((((self.pearlStampControl)[index])._dayControl):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            ((((self.pearlStampControl)[index])._dayControl):getClickTexture()):setUV(x1, y1, x2, y2)
            ;
            ((((self.pearlStampControl)[index])._dayControl):getOnTexture()):setUV(x1, y1, x2, y2)
            ;
            (((self.pearlStampControl)[index])._dayControl):setRenderTexture((((self.pearlStampControl)[index])._dayControl):getBaseTexture())
            ;
            (((self.pearlStampControl)[index])._dayControl):SetSize(85, 85)
          else
            do
              local x1, y1, x2, y2 = setTextureUV_Func(((self.pearlStampControl)[index])._dayControl, 245, 239, 330, 324)
              ;
              ((((self.pearlStampControl)[index])._dayControl):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              ((((self.pearlStampControl)[index])._dayControl):getClickTexture()):setUV(x1, y1, x2, y2)
              ;
              ((((self.pearlStampControl)[index])._dayControl):getOnTexture()):setUV(x1, y1, x2, y2)
              ;
              (((self.pearlStampControl)[index])._dayControl):setRenderTexture((((self.pearlStampControl)[index])._dayControl):getBaseTexture())
              ;
              (((self.pearlStampControl)[index])._dayControl):SetSize(85, 85)
            end
          end
        end
      end
    end
  end
end

FGlobal_PearlStamp_UpdateStampTexture = function(index, isSpecial)
  -- function num : 0_13 , upvalues : PearlStamp
  local self = PearlStamp
  if isSpecial == false then
    local x1, y1, x2, y2 = setTextureUV_Func(((self.pearlStampControl)[index])._stamp, 159, 72, 239, 152)
    ;
    ((((self.pearlStampControl)[index])._stamp):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (((self.pearlStampControl)[index])._stamp):setRenderTexture((((self.pearlStampControl)[index])._stamp):getBaseTexture())
    ;
    (((self.pearlStampControl)[index])._stamp):SetSize(80, 80)
  else
    do
      local x1, y1, x2, y2 = setTextureUV_Func(((self.pearlStampControl)[index])._stamp, 240, 72, 320, 152)
      ;
      ((((self.pearlStampControl)[index])._stamp):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (((self.pearlStampControl)[index])._stamp):setRenderTexture((((self.pearlStampControl)[index])._stamp):getBaseTexture())
      ;
      (((self.pearlStampControl)[index])._stamp):SetSize(80, 80)
    end
  end
end

PearlStamp:Init()
Panel_Window_StampCoupon:RegisterShowEventFunc(true, "FGlobal_PearlStamp_ShowAni()")
Panel_Window_StampCoupon:RegisterShowEventFunc(false, "FGlobal_PearlStamp_HideAni()")
registerEvent("FromClient_PearlStampUpdateCount", "FromClient_PearlStampUpdateCount")
registerEvent("FromClient_PearlStampShow", "FromClient_PearlStampShow")

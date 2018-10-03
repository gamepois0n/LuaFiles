local IM = CppEnums.EProcessorInputMode
Panel_Window_Policy:SetShow(false)
local PaGlobal_Policy = {
  _ui = {
    btnConfirm = UI.getChildControl(Panel_Window_Policy, "StaticText_Confirm"),
    btnCancel = UI.getChildControl(Panel_Window_Policy, "StaticText_Close"),
    _content = UI.getChildControl(Panel_Window_Policy, "Frame_Content"),
    _text = {}
  },
  _defaultBtnConfirmPosX = 0,
  _defaultBtnCancelPosX = 0
}
function PaGlobal_Policy:init()
  local frameContent = UI.getChildControl(self._ui._content, "Frame_1_Content")
  local control = self._ui._text
  control[0] = UI.getChildControl(frameContent, "StaticText_Title_1")
  control[1] = UI.getChildControl(frameContent, "StaticText_Desc_1")
  control[2] = UI.getChildControl(frameContent, "StaticText_Title_2")
  control[3] = UI.getChildControl(frameContent, "StaticText_Desc_2")
  control[4] = UI.getChildControl(frameContent, "StaticText_Title_3")
  control[5] = UI.getChildControl(frameContent, "StaticText_Desc_3")
  control[6] = UI.getChildControl(frameContent, "StaticText_Title_4")
  control[7] = UI.getChildControl(frameContent, "StaticText_Desc_4")
  control[8] = UI.getChildControl(frameContent, "StaticText_Title_5")
  control[9] = UI.getChildControl(frameContent, "StaticText_Desc_5")
  control[10] = UI.getChildControl(frameContent, "StaticText_Desc_5_1")
  control[11] = UI.getChildControl(frameContent, "StaticText_Desc_5_2")
  control[12] = UI.getChildControl(frameContent, "StaticText_Desc_5_3")
  control[13] = UI.getChildControl(frameContent, "StaticText_Desc_5_4")
  control[14] = UI.getChildControl(frameContent, "StaticText_Desc_5_5")
  control[15] = UI.getChildControl(frameContent, "StaticText_Desc_5_6")
  control[16] = UI.getChildControl(frameContent, "StaticText_Desc_52")
  control[17] = UI.getChildControl(frameContent, "StaticText_Desc_53")
  control[18] = UI.getChildControl(frameContent, "StaticText_Title_6")
  control[19] = UI.getChildControl(frameContent, "StaticText_Desc_6")
  control[20] = UI.getChildControl(frameContent, "StaticText_Desc_62")
  control[21] = UI.getChildControl(frameContent, "StaticText_Title_7")
  control[22] = UI.getChildControl(frameContent, "StaticText_Desc_7")
  control[23] = UI.getChildControl(frameContent, "StaticText_Title_8")
  control[24] = UI.getChildControl(frameContent, "StaticText_Desc_8")
  control[25] = UI.getChildControl(frameContent, "StaticText_Title_9")
  control[26] = UI.getChildControl(frameContent, "StaticText_Desc_9")
  control[27] = UI.getChildControl(frameContent, "StaticText_Title_10")
  control[28] = UI.getChildControl(frameContent, "StaticText_Desc_10")
  control[29] = UI.getChildControl(frameContent, "StaticText_Title_11")
  control[30] = UI.getChildControl(frameContent, "StaticText_Desc_11")
  control[31] = UI.getChildControl(frameContent, "StaticText_Title_12")
  control[32] = UI.getChildControl(frameContent, "StaticText_Desc_12")
  control[33] = UI.getChildControl(frameContent, "StaticText_Title_13")
  control[34] = UI.getChildControl(frameContent, "StaticText_Desc_13")
  control[35] = UI.getChildControl(frameContent, "StaticText_Title_14")
  control[36] = UI.getChildControl(frameContent, "StaticText_Desc_14")
  control[37] = UI.getChildControl(frameContent, "StaticText_Title_15")
  control[38] = UI.getChildControl(frameContent, "StaticText_Desc_15")
  control[39] = UI.getChildControl(frameContent, "StaticText_Title_16")
  control[40] = UI.getChildControl(frameContent, "StaticText_Desc_16")
  control[41] = UI.getChildControl(frameContent, "StaticText_Title_17")
  control[42] = UI.getChildControl(frameContent, "StaticText_Desc_17")
  control[43] = UI.getChildControl(frameContent, "StaticText_Title_18")
  control[44] = UI.getChildControl(frameContent, "StaticText_Desc_18")
  control[45] = UI.getChildControl(frameContent, "StaticText_Title_19")
  control[46] = UI.getChildControl(frameContent, "StaticText_Desc_19")
  control[47] = UI.getChildControl(frameContent, "StaticText_Title_20")
  control[48] = UI.getChildControl(frameContent, "StaticText_Desc_20")
  control[49] = UI.getChildControl(frameContent, "StaticText_Title_21")
  control[50] = UI.getChildControl(frameContent, "StaticText_Desc_21")
  for index = 0, #control do
    control[index]:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
    control[index]:SetText(control[index]:GetText())
  end
  local smallGap = 5
  local bigGap = 40
  local posY = 0
  control[0]:SetPosY(posY)
  posY = posY + control[0]:GetTextSizeY() + smallGap
  control[1]:SetPosY(posY)
  posY = posY + control[1]:GetTextSizeY() + bigGap
  control[2]:SetPosY(posY)
  posY = posY + control[2]:GetTextSizeY() + smallGap
  control[3]:SetPosY(posY)
  posY = posY + control[3]:GetTextSizeY() + bigGap
  control[4]:SetPosY(posY)
  posY = posY + control[4]:GetTextSizeY() + smallGap
  control[5]:SetPosY(posY)
  posY = posY + control[5]:GetTextSizeY() + bigGap
  control[6]:SetPosY(posY)
  posY = posY + control[6]:GetTextSizeY() + smallGap
  control[7]:SetPosY(posY)
  posY = posY + control[7]:GetTextSizeY() + bigGap
  control[8]:SetPosY(posY)
  posY = posY + control[8]:GetTextSizeY() + smallGap
  control[9]:SetPosY(posY)
  posY = posY + control[9]:GetTextSizeY() + bigGap
  control[10]:SetPosY(posY)
  posY = posY + control[10]:GetTextSizeY() + smallGap
  control[11]:SetPosY(posY)
  posY = posY + control[11]:GetTextSizeY() + smallGap
  control[12]:SetPosY(posY)
  posY = posY + control[12]:GetTextSizeY() + smallGap
  control[13]:SetPosY(posY)
  posY = posY + control[13]:GetTextSizeY() + smallGap
  control[14]:SetPosY(posY)
  posY = posY + control[14]:GetTextSizeY() + smallGap
  control[15]:SetPosY(posY)
  posY = posY + control[15]:GetTextSizeY() + bigGap
  control[16]:SetPosY(posY)
  posY = posY + control[16]:GetTextSizeY() + smallGap
  control[17]:SetPosY(posY)
  posY = posY + control[17]:GetTextSizeY() + bigGap
  control[18]:SetPosY(posY)
  posY = posY + control[18]:GetTextSizeY() + smallGap
  control[19]:SetPosY(posY)
  posY = posY + control[19]:GetTextSizeY() + smallGap
  control[20]:SetPosY(posY)
  posY = posY + control[20]:GetTextSizeY() + bigGap
  control[21]:SetPosY(posY)
  posY = posY + control[21]:GetTextSizeY() + smallGap
  control[22]:SetPosY(posY)
  posY = posY + control[22]:GetTextSizeY() + bigGap
  local controlCount = #control
  for ii = 23, controlCount do
    control[ii]:SetPosY(posY)
    posY = posY + control[ii]:GetTextSizeY() + bigGap
  end
  frameContent:SetSize(frameContent:GetSizeX(), posY + 10)
  self._defaultBtnConfirmPosX = self._ui.btnConfirm:GetPosX()
  self._defaultBtnCancelPosX = self._ui.btnCancel:GetPosX()
  self:registEventHandler()
end
function PaGlobal_Policy:registEventHandler()
  if true == ToClient_isXBox() then
    Panel_Window_Policy:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobal_Policy_Confirm()")
  end
end
function PaGlobal_Policy_ShowWindow(isLogin)
  local self = PaGlobal_Policy
  Panel_Window_Policy:SetShow(true)
  self._ui.btnConfirm:SetShow(isLogin)
  self._ui.btnCancel:SetShow(true)
  if true == isLogin then
    self._ui.btnConfirm:SetPosX(self._defaultBtnConfirmPosX - 100)
    self._ui.btnCancel:SetPosX(self._defaultBtnCancelPosX + 100)
  else
    self._ui.btnConfirm:SetPosX(self._defaultBtnConfirmPosX)
    self._ui.btnCancel:SetPosX(self._defaultBtnCancelPosX)
  end
end
function PaGlobal_Policy_Close()
  local self = PaGlobal_Policy
  Panel_Window_Policy:SetShow(false)
end
function PaGlobal_Policy_Confirm()
  PaGlobal_Policy_Close()
end
function PaGlobal_Policy_Decline()
  PaGlobal_Policy_Close()
  LoginNickname_Close()
  if nil ~= ToClient_SetProcessor_XboxHome() then
    ToClient_SetProcessor_XboxHome()
  end
end
PaGlobal_Policy:init()

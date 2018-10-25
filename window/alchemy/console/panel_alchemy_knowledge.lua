local AlchemyKnowledge = {
  _panel = Panel_Widget_Knowledge,
  _init = false,
  _ui = {
    image,
    title,
    desc,
    bottomGroup
  }
}
function AlchemyKnowledge:init()
  _PA_LOG("cylee", "AlchemyKnowledge:init()")
  if self._init then
    return
  end
  self._init = true
  self._ui.image = UI.getChildControl(self._panel, "Static_KnowledgeImage")
  self._ui.title = UI.getChildControl(self._panel, "StaticText_Title")
  self._ui.desc = UI.getChildControl(self._panel, "StaticText_UserInfoDec")
  self._ui.desc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui.bottomGroup = UI.getChildControl(self._panel, "Static_BottomBg")
  self._panel:registerPadEvent(__eConsoleUIPadEvent_B, "PaGlobalFunc_AlchemyKnowledgeClose()")
  self._panel:ignorePadSnapMoveToOtherPanel()
  return true
end
function PaGlobalFunc_AlchemyKnowledgeInit()
  if AlchemyKnowledge:init() then
    AlchemyKnowledge:update()
  end
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_AlchemyKnowledgeInit")
function AlchemyKnowledge:update()
  _PA_LOG("cylee", "AlchemyKnowledge:update()")
end
function AlchemyKnowledge:checkShow()
  return self._panel:GetShow()
end
function PaGlobalFunc_AlchemyKnowledgeCheckShow()
  return AlchemyKnowledge:checkShow()
end
function AlchemyKnowledge:open(knowledge)
  _PA_LOG("cylee", "AlchemyKnowledge:open() knowledge:" .. tostring(knowledge:getName()))
  if self:checkShow() then
    return
  end
  local learnFlag = isLearnMentalCardForAlchemy(knowledge:getKey())
  self._ui.image:ChangeTextureInfoName(knowledge:getImagePath())
  local x1, y1, x2, y2 = setTextureUV_Func(self._ui.image, 0, 0, 360, 360)
  self._ui.image:getBaseTexture():setUV(x1, y1, x2, y2)
  self._ui.image:setRenderTexture(self._ui.image:getBaseTexture())
  self._ui.title:SetText(learnFlag and knowledge:getName() or "???")
  self._ui.desc:SetText(knowledge:getDesc())
  self._ui.desc:SetFontColor(learnFlag and Defines.Color.C_FF84FFF5 or Defines.Color.C_FF888888)
  self._ui.bottomGroup:SetPosY(self._ui.desc:GetPosY() + self._ui.desc:GetTextSizeY())
  self._panel:SetSize(self._panel:GetSizeX(), self._ui.bottomGroup:GetPosY() + self._ui.bottomGroup:GetSizeY())
  self._panel:SetShow(true)
  return true
end
function PaGlobalFunc_AlchemyKnowledgeOpen(knowledge)
  if AlchemyKnowledge:open(knowledge) then
    AlchemyKnowledge:update()
  end
end
function AlchemyKnowledge:close()
  _PA_LOG("cylee", "AlchemyKnowledge:close()")
  if not self:checkShow() then
    return
  end
  _AudioPostEvent_SystemUiForXBOX(50, 3)
  self._panel:SetShow(false)
  return true
end
function PaGlobalFunc_AlchemyKnowledgeClose()
  if AlchemyKnowledge:close() then
  end
end

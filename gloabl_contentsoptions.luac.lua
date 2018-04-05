-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\include\gloabl_contentsoptions.luac 

-- params : ...
-- function num : 0
_ContentsGroup_3DMiniMapOpen = ToClient_IsContentsGroupOpen("345")
_ContentsGroup_isFurnitureWarehouse = ToClient_IsContentsGroupOpen("342")
_ContentsGroup_isUsedNewEnchant = true
_ContentsGroup_isUsedNewTradeEventNotice = true
_ContentsGroup_isMemoOpen = true
_ContentsGroup_isNewLifeRanking = true
_ContentsGroup_isNewOption = true
_ContentsGroup_skillOldandNew = ToClient_IsContentsGroupOpen("920")
_ContentsGroup_isUsedNewCharacterInfo = isGameTypeKorea()
_ContentsGroup_webAlbumOpen = ToClient_IsContentsGroupOpen("205")
_ContentsGroup_isContentsCustomizationVoice = ToClient_IsContentsGroupOpen("244")
if not ToClient_IsDevelopment() then
  _ContentsGroup_isConsoleTest = ToClient_isXBox()
  _ContentsGroup_isCamp = ToClient_IsContentsGroupOpen("347")
  _ContentsGroup_isFairy = ToClient_IsContentsGroupOpen("357")
  _ContentsGroup_isAllWarehouse = ToClient_IsContentsGroupOpen("366")
  _ContentsGroup_isSecretExtract = ToClient_IsContentsGroupOpen("247")
  _ContentsGroup_guildAlliance = ToClient_IsContentsGroupOpen("365")
  _ContentsGroup_LifeStatManufacturing = ToClient_IsContentsGroupOpen("368")
  _ContentsGroup_FairyTierUpgradeAndRebirth = ToClient_IsContentsGroupOpen("381")
  _ContentsGroup_InvenUpdateCheck = ToClient_IsDevelopment()
  _ContentsGroup_GuildManufacture = ToClient_IsContentsGroupOpen("382")
  _ContentsGroup_DamageMeter = ToClient_IsContentsGroupOpen("383")
  _ContentsGroup_Recommend = ToClient_IsDevelopment()
end


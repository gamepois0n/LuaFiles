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
_ContentsGroup_isConsoleTest = ToClient_isXBox()
_ContentsGroup_isConsolePadControl = ToClient_isXBox()
_ContentsGroup_isCamp = ToClient_IsContentsGroupOpen("347")
_ContentsGroup_isFairy = ToClient_IsContentsGroupOpen("357")
_ContentsGroup_StatTierIcon = false
_ContentsGroup_isAllWarehouse = ToClient_IsContentsGroupOpen("366")
_ContentsGroup_isSecretExtract = ToClient_IsContentsGroupOpen("247")
_ContentsGroup_guildAlliance = ToClient_IsContentsGroupOpen("365")
_ContentsGroup_LifeStatManufacturing = ToClient_IsContentsGroupOpen("368")
_ContentsGroup_FairyTierUpgradeAndRebirth = ToClient_IsContentsGroupOpen("381")
_ContentsGroup_InvenUpdateCheck = false
_ContentsGroup_GuildManufacture = ToClient_IsContentsGroupOpen("382")
_ContentsGroup_DamageMeter = ToClient_IsContentsGroupOpen("383")
_ContentsGroup_Politics = ToClient_IsContentsGroupOpen("385")
if not ToClient_IsDevelopment() then
  _ContentsGroup_Recommend = isGameTypeKorea()
  _ContentsGroup_DriganBossDragon = ToClient_IsContentsGroupOpen("377")
  _ContentsGroup_SeigeSeason5 = ToClient_IsContentsGroupOpen("388")
  _ContentsGroup_RenewUI = ToClient_isXBox()
  _ContentsGroup_RenewUI_Skill = ToClient_isXBox()
  _ContentsGroup_RenewUI_Dailog = ToClient_isXBox()
  _ContentsGroup_OccupyBenefit = ToClient_IsContentsGroupOpen("397")
  _ContentsGroup_NewMaid = true
end


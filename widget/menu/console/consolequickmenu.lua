local Type = {
  Inventory = 0,
  BlackSpirit = 1,
  WorldMap = 2,
  Skill = 3,
  Mail = 4,
  CharacterChallange = 5,
  ItemMarket = 6,
  Quest = 7,
  ServantCall = 8,
  ServantNavi = 9,
  CampActivate = 10,
  CampNavi = 11,
  HorseRaceInformation = 12,
  HorseRaceEnterOrCancel = 13,
  HouseList = 14,
  WorkerList = 15,
  InstallationList = 16,
  PetList = 17,
  MaidList = 18,
  TagSetting = 19,
  Tag = 20,
  NpcFind = 21,
  MovieGuide = 22,
  Mercenary = 23,
  VillageSiegeArea = 24,
  Pvp = 25,
  RingMenuSetting = 26,
  Profile = 27,
  VoiceChat = 28,
  Knowledge = 29,
  WharfNavi = 30,
  Guild = 31,
  Friend = 32,
  PearlShop = 33,
  PartySetting = 34,
  BeautyAlbum = 35,
  PhotoGallery = 36,
  ProductNote = 37,
  GuildRank = 38,
  BlackSpiritAdventure = 39,
  Manufacture = 40,
  TogglePVP = 41,
  PearInven = 42,
  Dyeing = 43,
  Undefined = 44
}
PaGlobal_ConsoleQuickMenu._functionTypeCount = Type.Undefined - 1
local function getTypeName(index)
  for typeName, typeIndex in pairs(Type) do
    if index == typeIndex then
      return typeName
    end
  end
  return nil
end
local ExecuteFunction = {}
function ExecuteFunction.Inventory()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Inventory)
end
function ExecuteFunction.BlackSpirit()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_BlackSpirit)
end
function ExecuteFunction.WorldMap()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_WorldMap)
end
function ExecuteFunction.Skill()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Skill)
end
function ExecuteFunction.Mail()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Mail)
end
function ExecuteFunction.CharacterChallange()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_Present)
end
function ExecuteFunction.ItemMarket()
  FGlobal_ItemMarket_Open_ForWorldMap(1, true)
end
function ExecuteFunction.Quest()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_QuestHistory)
end
function ExecuteFunction.ServantCall()
  Servant_Call(0)
end
function ExecuteFunction.ServantNavi()
  Servant_Navi(0)
end
function ExecuteFunction.HorseRaceInformation()
  HandelClicked_RaceInfo_Toggle()
end
function ExecuteFunction.HorseRaceEnterOrCancel()
  HandelClicked_RaceInfo_Join()
end
function ExecuteFunction.HouseList()
  FGlobal_HousingList_Open()
end
function ExecuteFunction.WorkerList()
  PaGlobalFunc_WorkerManager_Open()
end
function ExecuteFunction.InstallationList()
  HandleClicked_TentList_ShowToggle()
end
function ExecuteFunction.PetList()
  FGlobal_PetListNew_Toggle()
end
function ExecuteFunction.MaidList()
  MaidList_Open()
end
function ExecuteFunction.TagSetting()
end
function ExecuteFunction.Tag()
end
function ExecuteFunction.NpcFind()
  NpcNavi_ShowToggle()
end
function ExecuteFunction.MovieGuide()
end
function ExecuteFunction.Mercenary()
  FGlobal_MercenaryOpen()
end
function ExecuteFunction.VillageSiegeArea()
  if true == _ContentsGroup_SeigeSeason5 then
    FGlobal_GuildWarInfo_renew_Open()
  else
    FGlobal_GuildWarInfo_Show()
  end
end
function ExecuteFunction.Pvp()
end
function ExecuteFunction.RingMenuSetting()
  FromClient_ConsoleQuickMenu_OpenCustomPage(2)
end
function ExecuteFunction.Profile()
  GlobalKeyBinder_MouseKeyMap(CppEnums.UiInputType.UiInputType_PlayerInfo)
end
function ExecuteFunction.VoiceChat()
  FGlobal_SetVoiceChat_Toggle()
end
function ExecuteFunction.Knowledge()
  PaGlobalFunc_Window_Knowledge_Show()
end
function ExecuteFunction.WharfNavi()
  Servant_Navi(1)
end
function ExecuteFunction.Guild()
  Process_UIMode_CommonWindow_Guild()
end
function ExecuteFunction.Friend()
  Process_UIMode_CommonWindow_FriendList()
end
function ExecuteFunction.PearlShop()
  Process_UIMode_CommonWindow_CashShop()
end
function ExecuteFunction.PartySetting()
  Process_UIMode_CommonWindow_PartySetting()
end
function ExecuteFunction.PartySetting()
  Process_UIMode_CommonWindow_PartySetting()
end
function ExecuteFunction.BeautyAlbum()
  if true == _ContentsGroup_RenewUI_BeautyAlbum then
    FGlobal_CustomizingAlbum_Show(false, CppEnums.ClientSceneState.eClientSceneStateType_InGame)
  end
end
function ExecuteFunction.PhotoGallery()
  ScreenshotAlbum_Open()
end
function ExecuteFunction.ProductNote()
  Panel_ProductNote_ShowToggle()
end
function ExecuteFunction.GuildRank()
  GuildRank_Web_Show()
end
function ExecuteFunction.BlackSpiritAdventure()
  FGlobal_BlackSpiritAdventure_Open()
end
function ExecuteFunction.Manufacture()
  PaGlobalFunc_ManufactureOpen(true)
end
function ExecuteFunction.TogglePVP()
  if true == ToClient_isConsole() then
    local selfProxy = getSelfPlayer()
    if nil ~= selfProxy and selfProxy:get():getLevel() < 50 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_NOLEVEL_ACK"))
      return
    end
  end
  requestTogglePvP(true)
end
function ExecuteFunction.PearInven()
  PaGlobalFunc_InventoryInfo_Open(2)
end
function ExecuteFunction.Dyeing()
  PaGlobalFunc_Dyeing_Open()
end
function PaGlobal_ConsoleQuickMenu:initialize()
end
PaGlobal_ConsoleQuickMenu._functionTypeList = {}
PaGlobal_ConsoleQuickMenu._functionTypeList._ExecuteFunction = {
  [__eQuickMenuDataType_Function] = {
    [Type.Inventory] = ExecuteFunction.Inventory,
    [Type.BlackSpirit] = ExecuteFunction.BlackSpirit,
    [Type.WorldMap] = ExecuteFunction.WorldMap,
    [Type.Skill] = ExecuteFunction.Skill,
    [Type.Mail] = ExecuteFunction.Mail,
    [Type.CharacterChallange] = ExecuteFunction.CharacterChallange,
    [Type.ItemMarket] = ExecuteFunction.ItemMarket,
    [Type.Quest] = ExecuteFunction.Quest,
    [Type.ServantCall] = ExecuteFunction.ServantCall,
    [Type.ServantNavi] = ExecuteFunction.ServantNavi,
    [Type.CampActivate] = ExecuteFunction.CampActivate,
    [Type.CampNavi] = ExecuteFunction.CampNavi,
    [Type.HorseRaceInformation] = ExecuteFunction.HorseRaceInformation,
    [Type.HorseRaceEnterOrCancel] = ExecuteFunction.HorseRaceEnterOrCancel,
    [Type.HouseList] = ExecuteFunction.HouseList,
    [Type.WorkerList] = ExecuteFunction.WorkerList,
    [Type.InstallationList] = ExecuteFunction.InstallationList,
    [Type.PetList] = ExecuteFunction.PetList,
    [Type.MaidList] = ExecuteFunction.MaidList,
    [Type.TagSetting] = ExecuteFunction.TagSetting,
    [Type.Tag] = ExecuteFunction.Tag,
    [Type.NpcFind] = ExecuteFunction.NpcFind,
    [Type.MovieGuide] = ExecuteFunction.MovieGuide,
    [Type.Mercenary] = ExecuteFunction.Mercenary,
    [Type.VillageSiegeArea] = ExecuteFunction.VillageSiegeArea,
    [Type.Pvp] = ExecuteFunction.Pvp,
    [Type.RingMenuSetting] = ExecuteFunction.RingMenuSetting,
    [Type.Profile] = ExecuteFunction.Profile,
    [Type.VoiceChat] = ExecuteFunction.VoiceChat,
    [Type.Knowledge] = ExecuteFunction.Knowledge,
    [Type.WharfNavi] = ExecuteFunction.WharfNavi,
    [Type.Guild] = ExecuteFunction.Guild,
    [Type.Friend] = ExecuteFunction.Friend,
    [Type.PearlShop] = ExecuteFunction.PearlShop,
    [Type.PartySetting] = ExecuteFunction.PartySetting,
    [Type.BeautyAlbum] = ExecuteFunction.BeautyAlbum,
    [Type.PhotoGallery] = ExecuteFunction.PhotoGallery,
    [Type.ProductNote] = ExecuteFunction.ProductNote,
    [Type.GuildRank] = ExecuteFunction.GuildRank,
    [Type.BlackSpiritAdventure] = ExecuteFunction.BlackSpiritAdventure,
    [Type.Manufacture] = ExecuteFunction.Manufacture,
    [Type.TogglePVP] = ExecuteFunction.TogglePVP,
    [Type.PearInven] = ExecuteFunction.PearInven,
    [Type.Dyeing] = ExecuteFunction.Dyeing
  }
}
PaGlobal_ConsoleQuickMenu._functionTypeList._icon = {
  [__eQuickMenuDataType_Function] = {
    [Type.Inventory] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 501,
      _x2 = 984,
      _y2 = 551
    },
    [Type.BlackSpirit] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 399,
      _x2 = 984,
      _y2 = 449
    },
    [Type.WorldMap] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 985,
      _y1 = 552,
      _x2 = 1035,
      _y2 = 602
    },
    [Type.Skill] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 450,
      _x2 = 984,
      _y2 = 500
    },
    [Type.Mail] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 985,
      _y1 = 501,
      _x2 = 1035,
      _y2 = 551
    },
    [Type.CharacterChallange] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 985,
      _y1 = 399,
      _x2 = 1035,
      _y2 = 449
    },
    [Type.ItemMarket] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 552,
      _x2 = 984,
      _y2 = 602
    },
    [Type.Quest] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 985,
      _y1 = 450,
      _x2 = 1035,
      _y2 = 500
    },
    [Type.ServantCall] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1036,
      _y1 = 399,
      _x2 = 1086,
      _y2 = 449
    },
    [Type.ServantNavi] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1036,
      _y1 = 450,
      _x2 = 1086,
      _y2 = 500
    },
    [Type.CampActivate] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1036,
      _y1 = 654,
      _x2 = 1086,
      _y2 = 704
    },
    [Type.CampNavi] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1036,
      _y1 = 654,
      _x2 = 1086,
      _y2 = 704
    },
    [Type.HorseRaceInformation] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 399,
      _x2 = 1086,
      _y2 = 449
    },
    [Type.HorseRaceEnterOrCancel] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 450,
      _x2 = 1137,
      _y2 = 500
    },
    [Type.HouseList] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1138,
      _y1 = 603,
      _x2 = 1188,
      _y2 = 653
    },
    [Type.WorkerList] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1138,
      _y1 = 399,
      _x2 = 1188,
      _y2 = 449
    },
    [Type.InstallationList] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1138,
      _y1 = 450,
      _x2 = 1188,
      _y2 = 500
    },
    [Type.PetList] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1138,
      _y1 = 501,
      _x2 = 1188,
      _y2 = 551
    },
    [Type.MaidList] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 501,
      _x2 = 1137,
      _y2 = 551
    },
    [Type.TagSetting] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 552,
      _x2 = 1137,
      _y2 = 602
    },
    [Type.Tag] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1138,
      _y1 = 552,
      _x2 = 1188,
      _y2 = 602
    },
    [Type.NpcFind] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 603,
      _x2 = 984,
      _y2 = 653
    },
    [Type.MovieGuide] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 603,
      _x2 = 1137,
      _y2 = 653
    },
    [Type.Mercenary] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 934,
      _y1 = 654,
      _x2 = 984,
      _y2 = 704
    },
    [Type.VillageSiegeArea] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 985,
      _y1 = 603,
      _x2 = 1035,
      _y2 = 653
    },
    [Type.Pvp] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 654,
      _x2 = 1137,
      _y2 = 704
    },
    [Type.RingMenuSetting] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 205,
      _y1 = 445,
      _x2 = 255,
      _y2 = 495
    },
    [Type.Profile] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 307,
      _y1 = 292,
      _x2 = 357,
      _y2 = 342
    },
    [Type.VoiceChat] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 256,
      _y1 = 190,
      _x2 = 306,
      _y2 = 240
    },
    [Type.Knowledge] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 256,
      _y1 = 343,
      _x2 = 306,
      _y2 = 393
    },
    [Type.WharfNavi] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 103,
      _y1 = 292,
      _x2 = 153,
      _y2 = 342
    },
    [Type.Guild] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 307,
      _y1 = 190,
      _x2 = 357,
      _y2 = 240
    },
    [Type.Friend] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 256,
      _y1 = 292,
      _x2 = 306,
      _y2 = 342
    },
    [Type.PearlShop] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 307,
      _y1 = 241,
      _x2 = 357,
      _y2 = 291
    },
    [Type.PartySetting] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 307,
      _y1 = 343,
      _x2 = 357,
      _y2 = 393
    },
    [Type.BeautyAlbum] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 358,
      _y1 = 292,
      _x2 = 408,
      _y2 = 342
    },
    [Type.PhotoGallery] = {
      _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
      _x1 = 2,
      _y1 = 250,
      _x2 = 62,
      _y2 = 310
    },
    [Type.ProductNote] = {
      _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
      _x1 = 188,
      _y1 = 64,
      _x2 = 248,
      _y2 = 124
    },
    [Type.GuildRank] = {
      _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
      _x1 = 436,
      _y1 = 250,
      _x2 = 496,
      _y2 = 310
    },
    [Type.BlackSpiritAdventure] = {
      _path = "Renewal/Button/Console_Btn_ESCMenu.dds",
      _x1 = 126,
      _y1 = 436,
      _x2 = 186,
      _y2 = 496
    },
    [Type.Manufacture] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 358,
      _y1 = 241,
      _x2 = 408,
      _y2 = 291
    },
    [Type.TogglePVP] = {
      _path = "Renewal/Function/Console_Function_RingMenu.dds",
      _x1 = 1087,
      _y1 = 654,
      _x2 = 1137,
      _y2 = 704
    },
    [Type.PearInven] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 358,
      _y1 = 190,
      _x2 = 408,
      _y2 = 240
    },
    [Type.Dyeing] = {
      _path = "Renewal/Function/Console_Function_RingMenu_01.dds",
      _x1 = 358,
      _y1 = 343,
      _x2 = 408,
      _y2 = 393
    }
  }
}
PaGlobal_ConsoleQuickMenu._functionTypeList._name = {
  [__eQuickMenuDataType_Function] = {
    [Type.Inventory] = "INVENTORY",
    [Type.BlackSpirit] = "BLACKSPIRIT",
    [Type.WorldMap] = "WORLD MAP",
    [Type.Skill] = "SKILL",
    [Type.Mail] = "MAIL",
    [Type.CharacterChallange] = "CHALLENGE",
    [Type.ItemMarket] = "ITEM MARKETPLACE",
    [Type.Quest] = "QUEST",
    [Type.ServantCall] = "CALL MOUNT",
    [Type.ServantNavi] = "FIND MOUNT LOCATION",
    [Type.CampActivate] = "CAMP",
    [Type.CampNavi] = "FIND CAMP LOCATION",
    [Type.HorseRaceInformation] = "HORSE RACE",
    [Type.HorseRaceEnterOrCancel] = "ENTER HORSE RACE",
    [Type.HouseList] = "MY RESICENCE LIST",
    [Type.WorkerList] = "WORKER LIST",
    [Type.InstallationList] = "GARDEN",
    [Type.PetList] = "MY PET",
    [Type.MaidList] = "FAIRY MAID LIST",
    [Type.TagSetting] = "TAG CHARACTER SETTING",
    [Type.Tag] = "TAG CHARACTER",
    [Type.NpcFind] = "FIND NPC",
    [Type.MovieGuide] = "VIDEO GUIDE",
    [Type.Mercenary] = "MILITIA",
    [Type.VillageSiegeArea] = "SHOW NODE INSTALLATION AREA",
    [Type.Pvp] = "PVP",
    [Type.RingMenuSetting] = "RINGMENU SETTING",
    [Type.Profile] = "PROFILE",
    [Type.VoiceChat] = "VOICE CHAT",
    [Type.Knowledge] = "KNOWLEDGE",
    [Type.WharfNavi] = "FIND SHIP LOCATION",
    [Type.Guild] = "GUILD",
    [Type.Friend] = "FRIEND",
    [Type.PearlShop] = "CASH SHOP",
    [Type.PartySetting] = "PARTY SETTING",
    [Type.BeautyAlbum] = "BEAUTY ALBUM",
    [Type.PhotoGallery] = "PHOTO GALLERY",
    [Type.ProductNote] = "PRODUCT NOTE",
    [Type.GuildRank] = "GUILD RANK",
    [Type.BlackSpiritAdventure] = "BLACKSPIRIT ADVENTURE",
    [Type.Manufacture] = "PROCESSING",
    [Type.TogglePVP] = "TOGGLE PVP",
    [Type.PearInven] = "CASH INVENTORY",
    [Type.Dyeing] = "DYEING"
  }
}
PaGlobal_ConsoleQuickMenu._functionTypeList._ContentOption = {
  [__eQuickMenuDataType_Function] = {
    [Type.Inventory] = true,
    [Type.BlackSpirit] = true,
    [Type.WorldMap] = true,
    [Type.Skill] = true,
    [Type.Mail] = true,
    [Type.CharacterChallange] = false,
    [Type.ItemMarket] = false,
    [Type.Quest] = true,
    [Type.ServantCall] = true,
    [Type.ServantNavi] = true,
    [Type.CampActivate] = false,
    [Type.CampNavi] = false,
    [Type.HorseRaceInformation] = false,
    [Type.HorseRaceEnterOrCancel] = false,
    [Type.HouseList] = false,
    [Type.WorkerList] = true,
    [Type.InstallationList] = false,
    [Type.PetList] = true,
    [Type.MaidList] = false,
    [Type.TagSetting] = false,
    [Type.Tag] = false,
    [Type.NpcFind] = false,
    [Type.MovieGuide] = false,
    [Type.Mercenary] = false,
    [Type.VillageSiegeArea] = false,
    [Type.Pvp] = false,
    [Type.RingMenuSetting] = true,
    [Type.Profile] = true,
    [Type.VoiceChat] = true,
    [Type.Knowledge] = true,
    [Type.WharfNavi] = true,
    [Type.Guild] = true,
    [Type.Friend] = true,
    [Type.PearlShop] = false,
    [Type.PartySetting] = true,
    [Type.BeautyAlbum] = false,
    [Type.PhotoGallery] = false,
    [Type.ProductNote] = false,
    [Type.GuildRank] = false,
    [Type.BlackSpiritAdventure] = false,
    [Type.Manufacture] = true,
    [Type.TogglePVP] = false,
    [Type.PearInven] = true,
    [Type.Dyeing] = true
  }
}
function varify()
  for type, index in pairs(Type) do
    local func = PaGlobal_ConsoleQuickMenu._functionTypeList._ExecuteFunction[__eQuickMenuDataType_Function]
    local icon = PaGlobal_ConsoleQuickMenu._functionTypeList._icon[__eQuickMenuDataType_Function]
    local name = PaGlobal_ConsoleQuickMenu._functionTypeList._name[__eQuickMenuDataType_Function]
    _PA_ASSERT(func, "\235\167\129\235\169\148\235\137\180\236\151\144 \235\169\148\235\137\180\237\131\128\236\158\133 Function \236\157\180 \236\151\134\236\138\181\235\139\136\235\139\164. type : " .. tostring(type))
    _PA_ASSERT(icon, "\235\167\129\235\169\148\235\137\180\236\151\144 \235\169\148\235\137\180\237\131\128\236\158\133 icon \236\157\180 \236\151\134\236\138\181\235\139\136\235\139\164. type : " .. tostring(type))
    _PA_ASSERT(name, "\235\167\129\235\169\148\235\137\180\236\151\144 \235\169\148\235\137\180\237\131\128\236\158\133 name \236\157\180 \236\151\134\236\138\181\235\139\136\235\139\164. type : " .. tostring(type))
  end
end
function FromClient_ConsoleQuickMenu_ExecuteFunctionType(datatype, functionType)
  if __eQuickMenuDataType_Function ~= datatype then
    return
  end
  local executeFunc = PaGlobal_ConsoleQuickMenu._functionTypeList._ExecuteFunction[datatype][functionType]
  if nil == executeFunc then
    _PA_LOG("\237\155\132\236\167\132", "[ConsoleQuickMenu] QuickMenu.functionType \236\151\144 \237\131\128\236\158\133\236\157\180 \236\182\148\234\176\128\235\144\152\236\151\136\236\156\188\235\169\180 PaGlobal_ConsoleQuickMenu._functionTypeList._ExecuteFunction \236\151\144 \236\182\148\234\176\128\237\149\180 \236\163\188\236\132\184\236\154\148  ")
    return
  end
  executeFunc()
end
registerEvent("FromClient_ConsoleQuickMenu_ExecuteFunctionType", "FromClient_ConsoleQuickMenu_ExecuteFunctionType")
function PaGlobal_ConsoleQuickMenu:widgetOpen(invisibleOnly)
  PaGlobal_ConsoleQuickMenu._widgetForceClose = false
  Panel_Widget_QuickMenu:SetShow(true)
  if true == invisibleOnly then
    return
  end
  ToClient_setAvailableInputWidget(true)
end
function PaGlobal_ConsoleQuickMenu:widgetClose(invisibleOnly)
  PaGlobal_ConsoleQuickMenu._widgetForceClose = true
  Panel_Widget_QuickMenu:SetShow(false)
  if true == invisibleOnly then
    return
  end
  ToClient_setAvailableInputWidget(false)
end
function PaGlobal_ConsoleQuickMenu:setDefaultSetting()
  ToClient_setDefaultQuickMenu()
end
PaGlobal_ConsoleQuickMenu:setDefaultSetting()

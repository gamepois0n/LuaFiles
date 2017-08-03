-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\qasupport\qasupportmain.luac 

-- params : ...
-- function num : 0
testCreate = function()
  -- function num : 0_0
  ToClient_qaCreateItem(10010, 15, 1)
end

workerready = function(level)
  -- function num : 0_1
  ToClient_qaCreateItem(64204, 0, 1)
  ToClient_qaCreateItem(64205, 0, 1)
  ToClient_qaCreateItem(64206, 0, 1)
  ToClient_qaCreateItem(64214, 0, 1)
  ToClient_qaCreateItem(64215, 0, 1)
  ToClient_qaCreateItem(64216, 0, 1)
  ToClient_qaCreateItem(64234, 0, 1)
  ToClient_qaCreateItem(64235, 0, 1)
  ToClient_qaCreateItem(64236, 0, 1)
  ToClient_qaCreateItem(64264, 0, 1)
  ToClient_qaCreateItem(64265, 0, 1)
  ToClient_qaCreateItem(64266, 0, 1)
  ToClient_qaCreateItem(64320, 0, 1)
  ToClient_qaCreateItem(64321, 0, 1)
  ToClient_qaCreateItem(64322, 0, 1)
  ToClient_qaCreateItem(64304, 0, 1)
  ToClient_qaCreateItem(64305, 0, 1)
  ToClient_qaCreateItem(64306, 0, 1)
  ToClient_qaLevelUpAllWorker(level)
end

runAutoFrameCheck = function()
  -- function num : 0_2
  FGlobal_AutoFrameCheck_setMinFrame(25)
  FGlobal_setAutoFrameCheckRepeat(true)
  FGlobal_AutoFrameCheck_addPositionList(100, 100, 100)
  FGlobal_AutoFrameCheck_Start()
end



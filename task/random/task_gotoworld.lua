
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 随机任务头文件
-- Edited by peres
-- 2005/08/08 PM 13:45

-- 只有晚上他们是在一起的
-- 他靠近她，拥抱她
-- 他的手指和皮肤
-- 她看着他，心里柔软而疼痛
-- 她想，她还是爱他
-- 她不想抱怨什么
-- 每天晚上他们都在做爱
-- 她不知道，除了这种接触，她的安全感和温暖，还能从哪里取得
-- 她喜欢那一瞬间。仿佛在黑暗的大海上，漂向世界的尽头

-- ======================================================


-- 表格文件类的支持
Include("\\script\\class\\ktabfile.lua");

   tabPos = new(KTabFile, "\\settings\\inside_pos.txt");

-- 根据一个地图的 ID 得到这个地图的中文名、传入 X 轴、传入 Y 轴、战斗状态
 function getMapPos(nMapID)

       local strName, nX, nY = "", 0, 0;
   local nRow = 0;
 local i=0;

-- 得到进入此地图时初始的战斗状态
   local nFightState = 0;

   for i=1, tabPos:getRow() do
   if tabPos:getCell(i, "MapID")==tostring(nMapID) then
  nRow = i;
break;
		end;
	end;

  if nRow==0 then
       Msg2Player("地图ID-坐标不存在！");
 return nil;
	end;

   strName = tabPos:getCell(nRow, "MapName");
   nX = tonumber(tabPos:getCell(nRow, "EnterPosX"));
   nY = tonumber(tabPos:getCell(nRow, "EnterPosY"));
   nFightState = tonumber(tabPos:getCell(nRow, "FightState"));

    return strName, nX, nY, nFightState;

end;


 function gotoWorld(nMapID)

      local strName, nX, nY, nFightState = getMapPos(nMapID);

-- 出错处理：
    if nMapID==0 or nMapID==nil then
        WriteLog("师门任务错误：gotoWorld错误的函数输入规范，"..GetName());
 return
	end;
    CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
  NewWorld(nMapID, nX, nY);
	SetFightState(nFightState);
end;

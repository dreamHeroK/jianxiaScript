Include("\\script\\newbattles\\head.lua");
Include("\\script\\newbattles\\sign_up_npc.lua");--战场报名那吊毛npc
function OnUse()
	    local tSay = {}
	    tSay = {
			"我要使用永久元帅令/get_re",
		 }
	    tinsert(tSay, "退出/nothing");
	     Say("使用永久元帅令可以直接升级为元帅军衔。", getn(tSay), tSay);	
end
function get_re()
local nCurRank = GetTask(704);--获取军工
  if nCurRank > 0 then  
    SetTask(704,6)
	SetTask(701,600000)
	CalcBattleRank()
	UpdateBattleMaxRank()
	Talk(1,"","你现在是宋军元帅了");
  elseif nCurRank < 0 then  
  	CalcBattleRank()
	UpdateBattleMaxRank()
    SetTask(704,-6)
	SetTask(701,-600000)
	Talk(1,"","你现在是辽军元帅了");
  end
end


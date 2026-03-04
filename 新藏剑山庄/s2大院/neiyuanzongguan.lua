Include("\\script\\新藏剑山庄\\s2大院\\head.lua")
Include("\\script\\新藏剑山庄\\s2大院\\mission.lua")


function main()
    local nNpcIdx = GetTargetNpc();
	local strNpcName = GetTargetNpcName();
     if strNpcName == "内院总管"  then
	 local selTab = {}
	    szTitle = "你们来的正好，在下有件事情刚想与各位商议商议。在你们进入大院的时候，卸剑台上的天游龙剑突然不见了，虽说此事不一定是各位所为，但在事情没弄清楚之前，想必各位也脱不了干系吧。"
	    tinsert(selTab, "一派胡言，看打/#ACT2_StartBoss(" .. nNpcIdx .. ")")
   --     tinsert(selTab, "总管所言极是/")	
        tinsert(selTab, "在休息休息/on")
      Say(szTitle, getn(selTab), selTab)
	 end	
end


function ACT2_StartBoss(index)

SetMissionV(this.mv3,1); --第1关boss是否出现
SetNpcLifeTime(index,0);

end
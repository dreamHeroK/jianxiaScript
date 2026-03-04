Include("\\script\\新藏剑山庄\\s5藏剑阁\\head.lua")
Include("\\script\\新藏剑山庄\\s5藏剑阁\\mission.lua")


function main()
    local nNpcIdx = GetTargetNpc();
	local strNpcName = GetTargetNpcName();
     if strNpcName == "金剑台"  then
	    SetMissionV(this.mv9,GetMissionV(this.mv9)-1);	--差件数量-1
		SetNpcRemoveScript(nNpcIdx, "");
	    SetNpcLifeTime(nNpcIdx, 0);
     elseif strNpcName == "木剑台"  then
	    SetMissionV(this.mv9,GetMissionV(this.mv9)-1);	--差件数量-1
		SetNpcRemoveScript(nNpcIdx, "");
	    SetNpcLifeTime(nNpcIdx, 0);		
     elseif strNpcName == "水剑台"  then
	    SetMissionV(this.mv9,GetMissionV(this.mv9)-1);	--差件数量-1
		SetNpcRemoveScript(nNpcIdx, "");
	    SetNpcLifeTime(nNpcIdx, 0);		
     elseif strNpcName == "火剑台"  then
	    SetMissionV(this.mv9,GetMissionV(this.mv9)-1);	--差件数量-1	
		SetNpcRemoveScript(nNpcIdx, "");
	    SetNpcLifeTime(nNpcIdx, 0);		
     elseif strNpcName == "土剑台"  then
	    SetMissionV(this.mv9,GetMissionV(this.mv9)-1);	--差件数量-1
		SetNpcRemoveScript(nNpcIdx, "");
	    SetNpcLifeTime(nNpcIdx, 0);
			
     end

end
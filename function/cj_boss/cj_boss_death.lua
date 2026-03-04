--世界BOSS死亡脚本
Include("\\script\\function\\cj_boss\\cj_head.lua")

function OnDeath(id, f, x)
	local npcName = GetNpcName(id);
	local nMap, nX, nY = GetNpcWorldPos(id);
	local killer = "";
	--谁打死的
        if f == 0 then
		killer = GetName();
	--	gf_TeamOperateEX(wb_KillAward);--组队击杀奖励
		wb_KillAward(); --单人击杀奖励
	end
--	local msg = format("超级BOSS[%s]被[%s]击杀", npcName, killer);
--	Msg2Global(msg);
--	AddLocalNews(msg);
	--刷打宝箱
	local nScriptFile1 = "";
		nScriptFile1 = "\\script\\function\\cj_boss\\cj_big_box.lua";	
	 for i = 1, 3 do
		local bigBox = CreateNpc("步非烟的百宝箱", "云中BOSS宝箱", nMap, nX + random(-i, i), nY + random(-i, i));
		if bigBox > 0 then
			SetNpcScript(bigBox, nScriptFile1);
			SetNpcLifeTime(bigBox, 30 * 60);
		end	
		end			

	local nScriptFile = "";
		nScriptFile = "\\script\\function\\cj_boss\\cj_small_box.lua";	
	 for i = 1, 50 do
		local smallBox = CreateNpc("高手的包裹", "云中boss包裹", nMap, nX + random(-i, i), nY + random(-i, i));
		if smallBox > 0 then
			SetNpcScript(smallBox, nScriptFile);
			SetNpcLifeTime(smallBox, 30 * 60);
		end	
		end			

	--删掉尸体
	SetNpcRemoveScript(id, "");
	SetNpcLifeTime(id, 0);
	AddRuntimeStat(23, 1, 0, 1);
end
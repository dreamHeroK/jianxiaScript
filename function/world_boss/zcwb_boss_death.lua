--世界BOSS死亡脚本
Include("\\script\\function\\world_boss\\wb_head.lua")

function OnDeath(id, f, x)
	local npcName = GetNpcName(id);
	local nMap, nX, nY = GetNpcWorldPos(id);
	local killer = "";
	--谁打死的
--	local msg = format("经过一番激烈的战斗, 出现在了 %s-%s 逃跑了!", WB_WORLD_BOSS_MAP[nIndex], npcName);
         if f == 0 then
		killer = GetName();
		gf_TeamOperateEX(wb_KillAward);--组队奖励
		zcwb_KillAward(); --单人奖励
	end
--	local msg = format("世界BOSS[%s]被[%s]击杀", npcName, killer);
--	Msg2Global(msg);
--	AddLocalNews(msg);
	--刷打宝箱
--	local bigBox = CreateNpc("资源宝箱", "世界BOSS宝箱", nMap, nX, nY);
--	if bigBox > 0 then
--		SetNpcScript(bigBox, "\\script\\function\\world_boss\\wb_big_box.lua");
--		SetNpcLifeTime(bigBox, 30 * 60);
--	end
--	local nScriptFile1 = "";
--		nScriptFile1 = "\\script\\function\\world_boss\\wb_big_box.lua";	
--	 for i = 1, 3 do
--		local bigBox = CreateNpc("步非烟的百宝箱", "世界BOSS宝箱", nMap, nX + random(-i, i), nY + random(-i, i));
--		if bigBox > 0 then
--			SetNpcScript(bigBox, nScriptFile1);
--			SetNpcLifeTime(bigBox, 30 * 60);
--		end	
--		end	
--	local nScriptFile = "";
--		nScriptFile = "\\script\\function\\world_boss\\wb_small_box.lua";--
--	for i = 1, 50 do
--		local smallBox = CreateNpc("高手的包裹", "世界boss包裹", nMap, nX + random(-i, i), nY + random(-i, i));
--		if smallBox > 0 then
--			SetNpcScript(smallBox, nScriptFile);
--			SetNpcLifeTime(smallBox, 30 * 60);
--		end
--	end
	--删掉尸体
	SetNpcRemoveScript(id, "");
	SetNpcLifeTime(id, 0);
	AddRuntimeStat(23, 1, 0, 1);
end
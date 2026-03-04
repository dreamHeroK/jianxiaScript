--世界BOSS死亡脚本
Include("\\script\\function\\yp_boss\\yp_head.lua")

function OnDeath(id, f, x)
	local npcName = GetNpcName(id);
	local nMap, nX, nY = GetNpcWorldPos(id);
	local killer = "";
	--谁打死的
        if f == 0 then
		killer = GetName();
--		gf_TeamOperateEX(wb_KillAward);--组队击杀奖励
		wb_KillAward(); --单人击杀奖励
	end
	local msg = format("BOSS[%s]被[%s]击杀", npcName, killer);
	Msg2Global(msg);
	AddLocalNews(msg);
	--刷打宝箱
		
--	local nScriptFile = "";
--		nScriptFile = "\\script\\function\\yp_boss\\yp_small_box.lua";	
--	 for i = 1, 20 do
--		local smallBox = CreateNpc("高手的包裹", "云中攻城包裹", nMap, nX + random(-i, i), nY + random(-i, i));
--		if smallBox > 0 then
--			SetNpcScript(smallBox, nScriptFile);
--			SetNpcLifeTime(smallBox, 30 * 60);
--		end	
--		end			

	--删掉尸体
	SetNpcRemoveScript(id, "");
	SetNpcLifeTime(id, 0);

end
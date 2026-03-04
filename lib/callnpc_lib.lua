-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 - 建立NPC函数
-- 文件名　　：callnpc_lib.lua
-- 翻译修改　： 
-- 联系方式　：QQ: 葫芦娃救爷爷
-- 编译时间：2020-02-12 16:25
-- ======================================================
Include("\\script\\class\\ktabfile.lua")

--只能返回一个返回值
function doFunByPlayer(nPlayerIndex, fun, ...)	
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex
	local re = pack(call(fun, arg));
	PlayerIndex = nOldPlayer;
	return unpack(re)
end

function doFunInWorld(nSubWorld, fun, ...)
	local nOldSubWorld = SubWorld;
	SubWorld = nSubWorld
	local re = pack(call(fun, arg));
	SubWorld = nOldSubWorld;
	return unpack(re)
end

function base_CallNpc(tbNpc, nMapId, nPosX, nPosY)
	nMapId	= nMapId or tbNpc.nMapId
	nPosX	= nPosX or tbNpc.nPosX 
	nPosY	= nPosY or tbNpc.nPosY
	local nMapIndex = SubWorldIdx2ID(nMapId)
	if nMapIndex >= 0 then		
		local nNpcIndex = CreateNpc(tbNpc.nNpcTemp, tbNpc.szName, nMapIndex, nPosX, nPosY);
		if nNpcIndex <= 0 then
			return nil
		end
		if tbNpc.szDeathScript then
			SetNpcDeathScript(nNpcIndex, tbNpc.szDeathScript);
		end	
		if tbNpc.szScriptPath then 
			SetNpcScript(nNpcIndex, tbNpc.szScriptPath)
		end
		if tbNpc.nTime then
			SetNpcLifeTime(nNpcIndex, tbNpc.nTime);
		end
		if tbNpc.nCurCamp then
			SetCampToNpc(nNpcIndex, tbNpc.nCurCamp)
		end
		if tbNpc.nCampToPlayer then
			SetCampToPlayer(nNpcIndex, tbNpc.nCampToPlayer)
		end
		if tbNpc.tbNpcStates then
			for i =1, getn(tbNpc.tbNpcStates) do 
				if tbNpc.tbNpcStates[i] then
					AddUnitStates(nNpcIndex, i, tbNpc.tbNpcStates[i])
				end
			end
		end
		return nNpcIndex;
	else
		--print("地图 "..nMapId.." 没有加载")
		return nil
	end
end
--
-- Author: Zheng
-- Date: 2015-12-22 09:51:05
--
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\stringtable.lua")
Import("\\script\\lib\\globalfunctions.lua")

function OnDeath(Launcher)
	if gf_CheckLevel(t_level[1], t_level[2],0) ~= 1 then
		SetNpcLifeTime(Launcher, 0)--É¾³ýnpc
		return
	end
	_produce_material(Launcher)
end

-- Ä¬ÈÏÈë¿Úº¯Êý
function main()
	local nCurNpcIndex = GetTargetNpc()
	if (nCurNpcIndex == 0) then
		return
	end
	local nCurLevel = GetUnitCurStates(nCurNpcIndex, 0)
	if (nCurLevel == 99) then
		return
	end
	if GetTaskTemp(1) ~= 0 then
		return 0
	end
	
	if gf_CheckLevel(t_level[1], t_level[2],1) ~= 1 then
		return
	end
	
	AddUnitStates(nCurNpcIndex, 0, 100)		-- ´Ë¶Î·ÀË¢

	local nCanDig = 1
	local nCanDigTool = 1
	if (nCanDig == 1 and nCanDigTool == 1) then
		if (DoFireworks(890, 1) == 1) then
			Msg2Player("Thu thËp......");
			CastState("state_fetter", 1, 4 * 18)
			ProgressSlot(4 * 18)
			
			local nMapID, nX, nY = GetWorldPos()
			MedicNpcDeath(nMapID, nCurNpcIndex)
			--SetNpcScript(nCurNpcIndex, "")
			SetTaskTemp(1, nCurNpcIndex)
			return
		else
			Msg2Player("Kh«ng thÓ lµm ®éng t¸c nµy ë tr¹ng th¸i ngåi")
		end
	end	
	AddUnitStates(nCurNpcIndex, 0, -100)	-- ´Ë¶Î·ÀË¢
end;

function handle_player_death(data, para)
	local nCurNpcIndex = GetTaskTemp(1)
	if nCurNpcIndex ~= 0 then
		AddUnitStates(nCurNpcIndex, 0, -100)	-- ´Ë¶Î·ÀË¢
		SetTaskTemp(1, 0)
		ProgressSlotCancle()
	end
end

-- ÍÚ¾ò½áÊøÒÔºóµÄ»Øµ÷º¯Êý
function OnProgressCallback()
	local nCurNpcIndex = GetTaskTemp(1)
	if nCurNpcIndex ~= 0 then
		_produce_material(nCurNpcIndex)
		SetTaskTemp(1, 0)
	end
end

function _produce_material(nNpcIndex)
	local nTypeId = GetNpcTempData(nNpcIndex, 0)	--npc typeid
	local tNpc = tb_material_npc[nTypeId]
	SetNpcLifeTime(nNpcIndex, 0)--É¾³ýnpc
	if tNpc then
		local _award = tNpc[4]
		AddItem(_award[2],_award[3],_award[4],_award[5])
		local szMsg = format("NhËn ®­îc %d %s",_award[5],_award[1])
		Talk(1,"",szMsg)
		Msg2Player(szMsg)
		return 1
	end
	return 0
end

--
-- Author: Zheng Jinke
-- Date: 2015-12-22 16:28:07
--


Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\stringtable.lua")
function OnDeath(Launcher)
	SetNpcLifeTime(Launcher,10)
	local roll = random(1,100)
	local pos = -1
	for i=1,getn(tb_kill_award) do
		if roll >= tb_kill_award[i][1] and roll <= tb_kill_award[i][2] then
			pos = i;
			break;
		end
	end
	-- print("\n==> roll = "..roll)
	-- print("==> find pos = "..pos)
	if pos < 0 then WriteLog("find boss award item error!") return 0; end
	AddItem(tb_kill_award[pos][3],tb_kill_award[pos][4],tb_kill_award[pos][5],tb_kill_award[pos][6])
	Talk(1,"",format("§· tiªu diÖt Mü Thùc §¹i §¹o, nhËn ®­îc %s!",tb_kill_award[pos][7]))
	-- print("==> get award *"..tb_kill_award[pos][6])
end
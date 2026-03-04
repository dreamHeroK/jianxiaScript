-- 少林接引弟子

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end	
	if GetPlayerFaction() == 1  then
		Say("S?ph?ph竔 s? xu鑞g n骾 ?",3,"Phi襫 huynh a  xu鑞g n骾!/gotoshaolin","T譵 hi觰 khu v鵦 luy謓 c蕄/maphelp","Thay  v蕁 an s?ph?/no")
	elseif GetPlayerFaction() == 2  then
		Talk(1,"","V?ng v韎 Thi誹 L﹎ u l?Th竔 S琻 B綾 u, thi猲 h?anh h飊g h閕 th竛g sau kh玭g bi誸 qu?ph竔 cho ai ra ngh猲h chi課?")
	elseif GetPlayerFaction() == 3 then				
		Talk(1,"","Danh ti課g qu?ph竔 vang xa, ti觰 t╪g y kh﹎ ph鬰!")
	elseif GetPlayerFaction() == 4 then
		Talk(1,"","Ti觰 t╪g ngng m?t蕋 c?anh em trong qu?bang.")
	elseif GetPlayerFaction() == 5 then
		Talk(1,"","竚 kh?v?b蓎 Л阯g M玭 danh ch蕁 giang h? C?d辮 ti觰 b鑙 xin th豱h gi竜 v礽 chi猽!")
	else
		Say("Th?ch?t譵 ti觰 t╪g c?vi謈 chi?",2,"Ta mu鑞 tham quan Thi誹 L﹎/gotoshaolin","Kh玭g c?g?/no")
	end
end

function gotoshaolin()
	NewWorld(204, 1501, 3328)			--把玩家传送到门派入口
end;

function no()
end;

function maphelp()
end;


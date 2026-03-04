--任务
--地点： 任务：
--策划：樊万松  2004.03.
Include("\\script\\lib\\dailogsay.lua");

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	local szTalk = {
		"<color=green>难民<color>：行行好，给2个窝头吃吧！",
	};
	TalkEx("", szTalk);
end;


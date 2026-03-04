--使用师门推荐信之后执行的脚本
Include("\\script\\task\\global_task\\gtask_head.lua");

tbFacGstart = --门派
	{
		[1] = 910,
		[2] = 911,
		[3] = 910,
		[4] = 911,
		[5] = 909,
		[6] = 911,
		[7] = 909,
		[8] = 911,
		[9] = 910,
		[10] = 909,
	}

function OnUse()

	local nFacPlayer = GetPlayerFaction();
	if nFacPlayer <= 0 then
		Talk(1,"","未入门派，不能使用师门推荐信")
		return
	end
	local nSMG = tbFacGstart[nFacPlayer];
	tGtNpcMain:start_task(nSMG,1)
	return
end;

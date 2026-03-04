-- 城市奖章包

Include("\\script\\online\\zgc_public_fun.lua")

function OnUse(idx)
	Say("打开城市奖章包获得 <color=yellow>50<color>奖章，奖章无法交易,打开吗?",
		2,
		"确认打开/tongcitywar_kai_bao",
		"结束对话/no_say")
end

function tongcitywar_kai_bao()
	if Zgc_pub_goods_add_chk(1, 0) == 1 then
		if DelItem(2,0,766,1) == 1 then
			AddItem(2,0,765,50,1)
			Say("你获得了50奖章",0)
		end
	end
end

function no_say()
end
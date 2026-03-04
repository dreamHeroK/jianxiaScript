-- 世界收集任务的脚本头文件
Include("\\script\\task\\collection\\task_head.lua")
Include("\\script\\lib\\globalfunctions.lua");

FILE_NAME = "\\script\\中原一区\\汴京\\npc\\行脚商人.lua"

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	
	
	local strName = GetTargetNpcName()
	local time_h = tonumber(date("%H"))			--获得当前小时数（24小时制）
	
	if checkCollectNpc(nMap, strName) ==1 then
		if time_h >= 18 then
		Say("<color=green>行脚商人<color>：不要问我为何一直走在路上从不停留，我虽非出家之人，但却乐于行走在路上。\n杖挑明月，衣惹烟霞，个中的自在与洒脱岂是那些凡夫俗子能理解的？",
			3,
			"我来接受任务/#createCollectTalk(\"行脚商人\")",
			"离开/Zgc_dialog_end"
		)
		elseif checkCollectNpc(nMap, strName) ==1 then
			createCollectTalk(strName)
		end
		return
	end
	if time_h >=18 then							--不同的时间对话不同
		local szTalk = {
			"<color=green>行脚商人<color>：由于朝廷打压黑市，诀要供货紧张，我这里就不再提供了。<sex>可去各自的师门密室接引人处兑换。",
		};
		TalkEx("", szTalk);
	else
		Talk(2,"","<color=green>行脚商人<color>：不要问我为何一直走在路上从不停留，我虽非出家之人，但却乐于行走在路上。\n杖挑明月，衣惹烟霞，个中的自在与洒脱岂是那些凡夫俗子能理解的？","<color=green>行脚商人<color>：虽阅万卷书不若行万里路，增获见间倒在其次。然行脚非脚动，实为心动。老子曾曰：不出户，知天下事。诚如圣人所言，心的行脚乃我辈行脚之所求。")
	end	
end
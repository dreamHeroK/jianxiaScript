-- 中午1点出现的BOSS定时器-BOSS名字可改- 红印教主BOSS05-- 宝石兔子BOSS01--白虎王BOSS01

function main()
 	AddLocalNews("通缉：野外BOSS突然出现，泉州府北，请各位大侠火速出手，将其击杀，可获得其携带的宝物！！！！")

		local sjcs = 0
		local sjs = 0
		local sjgs = random(1);--随机出3个到4个BOSS
		sjs = random(1,100)
		if sjs <= 100 then
			sjcs = sjcs + 1
			npcIndex = CreateNpc("红印教主BOSS05","红印教主",108,1504,3025,-1,1,1,1)
			msg="江湖传闻，红印教主,突然出现在[泉州府北]江湖上又将引起一阵血雨腥风！"
			Msg2SubWorld(msg);
			SetNpcLifeTime(npcIndex, 600)
			SetNpcDeathScript(npcIndex, "\\script\\task\\boss\\boss_cbwmadw.lua")
			if sjcs == sjgs then
				return
			end
		end

end


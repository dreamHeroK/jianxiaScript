function main()
  Say("<color=green>车夫<color>：我可以快速送你回到汴京或者雁门关。",
		3,
		"返回汴京/bianjing",
		"返回雁门关/yanmenguan",
		"我只是和你打个招呼/no")
end;
function no()
	
end
function bianjing()

		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
		i=random(1,4)
		if i==1 then
			NewWorld(200, 1501 ,2978)
		elseif i==2 then
			NewWorld(200, 1267,2970)
		else  
			NewWorld(200, 1249 ,2732)
		end
		SetFightState(0); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
end
function yanmenguan()

		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14

		NewWorld(604, 1378 ,2831)

		SetFightState(1); --换城设置其战斗状态为和平模式 added by vivi 2008-06-03
end
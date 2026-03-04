

function main()
	i=random(1,4)
	if i==1 then 
		Talk(1,"","<color=green>禁军<color>：皇宫禁地，擅闯者杀无赦！")
	elseif i==2 then
		Talk(1,"","<color=green>禁军<color>：四品以下官员布衣非宣招不得入皇宫，违令者斩。")
	elseif i==3 then
		Talk(1,"","<color=green>禁军<color>：站住！你不要命了，竟敢擅闯皇宫！")
	else
		Talk(1,"","<color=green>禁军<color>：喂喂喂！睁大你的狗眼，看看这是什么地方！好大胆子，竟敢在皇宫前面乱逛！")
	end
end

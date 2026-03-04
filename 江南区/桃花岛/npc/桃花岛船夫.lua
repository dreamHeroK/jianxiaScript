---桃花岛船夫.lua---
function main()
	Say("<color=green>船夫<color>：客官不在岛上多待会？",2,"离开桃花岛 (10两纹银)/likaitaohuadao","先不离开/no");
end;
function likaitaohuadao()
	n=moneygo()
	if n==0 then 
		Talk(1,"","<color=green>船夫<color>：不好意思，没钱可坐不了船。")
	else 
		NewWorld(104,1568,2975);
	end
end

function moneygo()
	if GetCash() >=1000 then
		PrePay(1000)
		return 1
	else
		return 0
	end
end;

function no()
end;
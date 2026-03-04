Include("\\script\\online_activites\\xinshouzhiyin\\head.lua")

--角色升级时候回调函数
function OnLevelUp(previousLevel)
--		do return end
--		NG_OnLevelUp(previousLevel);
--		GL_OnLevelUp()
SendScript2VM("\\script\\global\\playerloginin.lua", "levelTianMing()");--上线天命判断增加

 
end

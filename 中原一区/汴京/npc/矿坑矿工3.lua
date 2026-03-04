
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 挂机地图出去脚本文件
-- Edited by peres
-- 2005/06/27 PM 14:04

-- 只有他和她两个人
-- 他们相爱
-- 她记得
-- 他的手抚摩在她的皮肤上的温情
-- 他的亲吻像鸟群在天空掠过
-- 他在她身体里面的暴戾和放纵
-- 他入睡时候的样子充满纯真
-- 她记得，清晨她醒过来的一刻，他在她的身边
-- 她睁着眼睛，看曙光透过窗帘一点一点地照射进来
-- 她的心里因为幸福而疼痛

-- ======================================================

-- 读入挂机脚本头文件
Include("\\script\\online\\online_head.lua");

function main()

	Say("你要我带你去回城市吗？",
		2,
		"是的/Select_Yes",
		"取消/Select_No"
		);

end;


function Select_Yes()
	
	CleanInteractive();
	
	NewWorld(200,1268,2720);
	
	clearLifeState();

end;


function Select_No()

end;


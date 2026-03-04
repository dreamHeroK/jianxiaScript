--大型怪被动技能

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	},

	--魔法属性

	--属性值:	普通攻击力 * X + (1 + 技能等级 * Y) * (力量 * A + 根骨 * B + 身法 * C + 内功 * D + 洞察 * E)
	--			+ 武器外功攻击点 * F + Z
	--			(其中,A,B,C,D,E,F,X,Y,Z为伤害因素.除Z外,其余各伤害因素为百分比数.)

	--成功几率:	(属性值 * A + (自身等级 - 对方等级) * B + 技能等级 * C) * D + X
	--			(其中,A,B,C,D,X为几率因素.除X外,其余各几率因素为百分比数.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--技能等级相关伤害魔法属性
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_diffuse_skill_effect",
	damage_factor_z={{1,179634177},{2,179699713},{3,179765249},{4,179830785},{5,179896321},{6,179961857},{7,180027393},{8,180092929},{9,180158465},{10,180158465},{11,0},{20,0}},
	},
	{magic="state_penetration",
	damage_factor_z={{1,600},{20,600}},
	},
	{magic="state_immune",
	damage_factor_z={{1,500},{20,500}},
	},
	{magic="state_element_all_defend_point_add",
	damage_factor_z={{1,999},{20,999}},
	},
	{magic="state_death_skill",
	damage_factor_z={{1,0},{20,0}},
	},
	{magic="state_destiny_point_add",
	damage_factor_z={{1,1500},{20,1500}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}

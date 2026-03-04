--技能: 积尸气

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,3600},{1,3600}}},
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
	{magic="state_skill_cast_interval_dec_spec_1",
	damage_factor_z={{1,159121624},{1,159121624}},
	},
	{magic="state_attack_add_spec",
	damage_factor_z={{1,159186994},{1,159186994}}
	},
	{magic="state_attack_add_spec",
	damage_factor_z={{1,159383602},{1,159383602}}
	},
	{magic="state_attack_add_spec",
	damage_factor_z={{1,161611826},{1,161611826}}
	},
	{magic="state_attack_add_spec",
	damage_factor_z={{1,161677362},{1,161677362}}
	},
	{magic="state_attack_add_spec",
	damage_factor_z={{1,161742898},{1,161742898}}
	},
	{magic="state_attack_add_spec",
	damage_factor_z={{1,161808434},{1,161808434}}
	},
	{magic="state_attack_add_spec",
	damage_factor_z={{1,161939506},{1,161939506}}
	},
	{magic="state_attack_add_spec",
	damage_factor_z={{1,162725938},{1,162725938}}
	},
	{magic="state_attack_add_spec",
	damage_factor_z={{1,162791474},{1,162791474}}
	},
	{magic="state_attack_add_spec",
	damage_factor_z={{1,162857010},{1,162857010}}
	},
	{magic="state_attack_add_spec",
	damage_factor_z={{1,162922546},{1,162922546}}
	},
	{magic="state_attack_add_spec",
	damage_factor_z={{1,162988082},{1,162988082}}
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}

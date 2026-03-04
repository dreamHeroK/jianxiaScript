Import("\\script\\ksgvn\\constants.lua")

g_tbBattleTitleCfg = {
    [3] = "§« Thèng",
    [4] = "Tiªn Phong",
    [5] = "T­íng Qu©n",
    [6] = "Nguyªn So¸i",
    [7] = "Nguyªn So¸i VÜnh ViÔn",
}
g_tbBattleCamps = {
    [1] = "Tèng",
    [2] = "Liªu",
}

BATTLE_QUANCONG_NEWSERVER = 50000

g_tbBattleSuit_ThuongUng = {
    TONG = {
        TUONG = {
            nSuitId = 30033,
            nRingStartId = 30052,
        },
        SOAI = {
            nSuitId = 30037,
            nRingStartId = 30064,
        },
    },
    LIEU = {
        TUONG = {
            nSuitId = 30045,
            nRingStartId = 30088,
        },
        SOAI = {
            nSuitId = 30049,
            nRingStartId = 30100,
        },
    }
}

g_tbBattleSuit_NguLong = {
    TONG = {
        TUONG = {
            nSuitId = 30017,
            nRingStartId = 30013,
        },
    },
    LIEU = {
        TUONG = {
            nSuitId = 30021,
            nRingStartId = 30025,
        },
    }
}

g_tbBattleSuit_ThienChi = {
    TONG = {
        TUONG = {
            nSuitId = 3016,
            nRingStartId = 3032,
        },
    },
    LIEU = {
        TUONG = {
            nSuitId = 3020,
            nRingStartId = 3044,
        },
    }
}

g_tbBattleSuit_LoiHo = {
    TONG = {
        TUONG = {
            nSuitId = 30215,
            nRingStartId = 30157,
        },
        SOAI = {
            nSuitId = 30219,
            nRingStartId = 30169,
        },
    },
    LIEU = {
        TUONG = {
            nSuitId = 30227,
            nRingStartId = 30193,
        },
        SOAI = {
            nSuitId = 30231,
            nRingStartId = 30205,
        },
    }
}

g_tbBattleSuit_HanVu = {
    TONG = {
        TUONG = {
            nSuitId = 50002,
            nRingStartId = 50002,
        },
        SOAI = {
            nSuitId = 50003,
            nRingStartId = 50014,
        },
    },
    LIEU = {
        TUONG = {
            nSuitId = 50004,
            nRingStartId = 50030,
        },
        SOAI = {
            nSuitId = 50005,
            nRingStartId = 50042,
        },
    }
}

g_tbBattleSuit_HoaPhung = {
    TONG = {
        TUONG = {
            nStartEquipId = 30311,
            nStartWeaponId = 30328,
            nStartRingId = 30228,
            NEWFACTION = {
                [ROUTE_DUONGMON_NHAMHIEP] = {
                    nStartRingId = 31486,
                    nStartWeaponId = 32167,
                    nStartEquipId = 32153,
                },
                [ROUTE_CONLON_KIEMTON] = {
                    nStartRingId = 31514,
                    nStartWeaponId = 32195,
                    nStartEquipId = 32161,
                },
            }
        },
        SOAI = {
            nStartEquipId = 30375,
            nStartWeaponId = 30432,
            nStartRingId = 30420,
            NEWFACTION = {
                [ROUTE_DUONGMON_NHAMHIEP] = {
                    nStartRingId = 31489,
                    nStartWeaponId = 32170,
                    nStartEquipId = 32154,
                },
                [ROUTE_CONLON_KIEMTON] = {
                    nStartRingId = 31517,
                    nStartWeaponId = 32198,
                    nStartEquipId = 32162,
                },
            }
        },
    },
    LIEU = {
        TUONG = {
            nStartEquipId = 30439,
            nStartWeaponId = 30536,
            nStartRingId = 30676,
            NEWFACTION = {
                [ROUTE_DUONGMON_NHAMHIEP] = {
                    nStartRingId = 31500,
                    nStartWeaponId = 32179,
                    nStartEquipId = 32155,
                },
                [ROUTE_CONLON_KIEMTON] = {
                    nStartRingId = 31528,
                    nStartWeaponId = 32207,
                    nStartEquipId = 32163,
                },
            }
        },
        SOAI = {
            nStartEquipId = 30503,
            nStartWeaponId = 30640,
            nStartRingId = 30868,
            NEWFACTION = {
                [ROUTE_DUONGMON_NHAMHIEP] = {
                    nStartRingId = 31503,
                    nStartWeaponId = 32182,
                    nStartEquipId = 32156,
                },
                [ROUTE_CONLON_KIEMTON] = {
                    nStartRingId = 31531,
                    nStartWeaponId = 32210,
                    nStartEquipId = 32164,
                },
            }
        },
    },
}

g_tbBattleSuit_ThanhLong = {
    TONG = {
        TUONG = {
            ringCfg = {
                [1] = { nStart = 31132, nEnd = 31151, },
                [2] = { nStart = 31152, nEnd = 31171, },
                [3] = { nStart = 31172, nEnd = 31191, },
            },
            clothesCfg = {
                [1] = { nStart = 30570, nEnd = 30589, },
            },
            weaponCfg = {
                [1] = { nStart = 30804, nEnd = 30823, },
            },
            newFactionCfg = {
                ringCfg = {
                    [1] = { nStart = 31493, nEnd = 31495, },
                    [2] = { nStart = 31521, nEnd = 31523, },
                },
                clothesCfg = {
                    [1] = 32157,
                    [2] = 32165,
                },
                weaponCfg = {
                    [1] = 32173,
                    [2] = 32201,
                },
            }
        },
        SOAI = {
            ringCfg = {
                [1] = { nStart = 31192, nEnd = 31211, },
                [2] = { nStart = 31212, nEnd = 31231, },
                [3] = { nStart = 31232, nEnd = 31251, },
                [4] = { nStart = 31252, nEnd = 31271, },
            },
            clothesCfg = {
                [1] = { nStart = 30590, nEnd = 30609, },
            },
            weaponCfg = {
                [1] = { nStart = 30864, nEnd = 30883, },
            },
            newFactionCfg = {
                ringCfg = {
                    [1] = { nStart = 31496, nEnd = 31499, },
                    [2] = { nStart = 31524, nEnd = 31527, },
                },
                clothesCfg = {
                    [1] = 32158,
                    [2] = 32166,
                },
                weaponCfg = {
                    [1] = 32176,
                    [2] = 32204,
                },
            }
        },
    },
    LIEU = {
        TUONG = {
            ringCfg = {
                [1] = { nStart = 31274, nEnd = 31293, },
                [2] = { nStart = 31294, nEnd = 31313, },
                [3] = { nStart = 31314, nEnd = 31333, },
            },
            clothesCfg = {
                [1] = { nStart = 30611, nEnd = 30630, },
            },
            weaponCfg = {
                [1] = { nStart = 30944, nEnd = 30963, },
            },
            newFactionCfg = {
                ringCfg = {
                    [1] = { nStart = 31507, nEnd = 31509, },
                    [2] = { nStart = 31535, nEnd = 31537, },
                },
                clothesCfg = {
                    [1] = 32159,
                    [2] = 32167,
                },
                weaponCfg = {
                    [1] = 32185,
                    [2] = 32213,
                },
            }
        },
        SOAI = {
            ringCfg = {
                [1] = { nStart = 31334, nEnd = 31353, },
                [2] = { nStart = 31354, nEnd = 31373, },
                [3] = { nStart = 31374, nEnd = 31393, },
                [4] = { nStart = 31394, nEnd = 31413, },
            },
            clothesCfg = {
                [1] = { nStart = 30631, nEnd = 30650, },
            },
            weaponCfg = {
                [1] = { nStart = 31004, nEnd = 31023, },
            },
            newFactionCfg = {
                ringCfg = {
                    [1] = { nStart = 31510, nEnd = 31513, },
                    [2] = { nStart = 31538, nEnd = 31541, },
                },
                clothesCfg = {
                    [1] = 32160,
                    [2] = 32168,
                },
                weaponCfg = {
                    [1] = 32188,
                    [2] = 32216,
                },
            }
        },
    },
}

g_tbBattleSuit_UyHo = {
    TONG = {
        TUONG = {
            ringCfg = {
                [1] = { nStart = 31542, nEnd = 31563, },
                [2] = { nStart = 31564, nEnd = 31585, },
                [3] = { nStart = 31586, nEnd = 31607, },
            },
            clothesCfg = {
                [1] = { nStart = 32171, nEnd = 32192, },
            },
            weaponCfg = {
                [1] = { nStart = 32263, nEnd = 32284, },
            },
        },
        SOAI = {
            ringCfg = {
                [1] = { nStart = 31608, nEnd = 31629, },
                [2] = { nStart = 31630, nEnd = 31651, },
                [3] = { nStart = 31652, nEnd = 31673, },
                [4] = { nStart = 31674, nEnd = 31695, },
            },
            clothesCfg = {
                [1] = { nStart = 32193, nEnd = 32214, },
            },
            weaponCfg = {
                [1] = { nStart = 32329, nEnd = 32350, },
            },
        },
    },
    LIEU = {
        TUONG = {
            ringCfg = {
                [1] = { nStart = 31696, nEnd = 31717, },
                [2] = { nStart = 31718, nEnd = 31739, },
                [3] = { nStart = 31740, nEnd = 31761, },
            },
            clothesCfg = {
                [1] = { nStart = 32215, nEnd = 32236, },
            },
            weaponCfg = {
                [1] = { nStart = 32395, nEnd = 32416, },
            },
        },
        SOAI = {
            ringCfg = {
                [1] = { nStart = 31762, nEnd = 31783, },
                [2] = { nStart = 31784, nEnd = 31805, },
                [3] = { nStart = 31806, nEnd = 31827, },
                [4] = { nStart = 31828, nEnd = 31849, },
            },
            clothesCfg = {
                [1] = { nStart = 32237, nEnd = 32258, },
            },
            weaponCfg = {
                [1] = { nStart = 32461, nEnd = 32482, },
            },
        },
    },
}

g_tbBattleSuit_ChuTuoc = {
    TONG = {
        TUONG = {
            ringCfg = {
                [1] = { nStart = 31852, nEnd = 31873, },
                [2] = { nStart = 31874, nEnd = 31895, },
                [3] = { nStart = 31896, nEnd = 31917, },
            },
            clothesCfg = {
                [1] = { nStart = 32259, nEnd = 32280, },
            },
            weaponCfg = {
                [1] = { nStart = 32549, nEnd = 32570, },
            },
        },
        SOAI = {
            ringCfg = {
                [1] = { nStart = 31918, nEnd = 31939, },
                [2] = { nStart = 31940, nEnd = 31961, },
                [3] = { nStart = 31962, nEnd = 31983, },
                [4] = { nStart = 31984, nEnd = 32005, },
            },
            clothesCfg = {
                [1] = { nStart = 32281, nEnd = 32302, },
            },
            weaponCfg = {
                [1] = { nStart = 32615, nEnd = 32636, },
            },
        },
    },
    LIEU = {
        TUONG = {
            ringCfg = {
                [1] = { nStart = 32006, nEnd = 32027, },
                [2] = { nStart = 32028, nEnd = 32049, },
                [3] = { nStart = 32050, nEnd = 32071, },
            },
            clothesCfg = {
                [1] = { nStart = 32303, nEnd = 32324, },
            },
            weaponCfg = {
                [1] = { nStart = 32681, nEnd = 32702, },
            },
        },
        SOAI = {
            ringCfg = {
                [1] = { nStart = 32072, nEnd = 32093, },
                [2] = { nStart = 32094, nEnd = 32115, },
                [3] = { nStart = 32116, nEnd = 32137, },
                [4] = { nStart = 32138, nEnd = 32159, },
            },
            clothesCfg = {
                [1] = { nStart = 32325, nEnd = 32346, },
            },
            weaponCfg = {
                [1] = { nStart = 32747, nEnd = 32767, nEndExt = 15300, },
            },
        },
    },
}

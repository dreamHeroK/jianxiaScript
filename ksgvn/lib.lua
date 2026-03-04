-- Global Libs
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\isolate\\functions\\tong_title\\head.lua")
Import("\\script\\equip_shop\\equip_shop_head.lua")

-- KSG Headers
Include("\\script\\ksgvn\\constants.lua") -- 1st
Include("\\script\\ksgvn\\define\\define_head.lua")

-- Lua 4 pairs
pairs = pairs or function(t)
    return t
end

-- For talk
function no()

end

-- Common functions
Include("\\script\\ksgvn\\libs\\lib_core.lua")
-- Date functions
Include("\\script\\ksgvn\\libs\\lib_date.lua")
-- Task Functions
Include("\\script\\ksgvn\\libs\\lib_task.lua")
-- Reborn Functions
Include("\\script\\ksgvn\\libs\\lib_reborn.lua")
-- Player Functions
Include("\\script\\ksgvn\\libs\\lib_player.lua")
-- Npc Functions
Include("\\script\\ksgvn\\libs\\lib_npc.lua")
-- Item Functions
Include("\\script\\ksgvn\\libs\\lib_award.lua")
-- Item Functions
Include("\\script\\ksgvn\\libs\\lib_item.lua")
-- Debug Functions
Include("\\script\\ksgvn\\libs\\lib_debug.lua")

--=====================================================================================
-- POELU | PathOfExileLevelUp - core.lua
-- Version: 2.0.0
-- Author: DonnieDice
-- RGX Mods Collection - RealmGX Community Project
--=====================================================================================

local RGX = assert(_G.RGXFramework, "POELU: RGX-Framework not loaded")

POELU = POELU or {}

local ADDON_VERSION = "2.0.4"
local ADDON_NAME = "PathOfExileLevelUp"
local PREFIX = "|Tinterface/addons/PathOfExileLevelUp/media/icon:16:16|t - |cffffffff[|r|cffb37c44POELU|r|cffffffff]|r "
local TITLE = "|Tinterface/addons/PathOfExileLevelUp/media/icon:18:18|t [|cffb37c44P|r|cffffffffath of Exile|r |cffb37c44L|r|cffffffffevel|r |cffb37c44U|r|cffb37c44p|r|cffb37c44!|r]"

POELU.version = ADDON_VERSION
POELU.addonName = ADDON_NAME

local Sound = RGX:GetSound()

local handle = Sound:Register(ADDON_NAME, {
sounds = {
high = "Interface\\Addons\\PathOfExileLevelUp\\sounds\\path_of_exile_high.ogg",
medium = "Interface\\Addons\\PathOfExileLevelUp\\sounds\\path_of_exile_med.ogg",
low = "Interface\\Addons\\PathOfExileLevelUp\\sounds\\path_of_exile_low.ogg",
},
defaultSoundId = 569593,
savedVar = "POELUSettings",
defaults = {
enabled = true,
soundVariant = "medium",
muteDefault = true,
showWelcome = true,
volume = "Master",
firstRun = true,
},
triggerEvent = "PLAYER_LEVEL_UP",
addonVersion = ADDON_VERSION,
})

POELU.handle = handle

local L = POELU.L or {}
local initialized = false

local function ShowHelp()
print(PREFIX .. " " .. (L["HELP_HEADER"] or ""))
print(PREFIX .. " " .. (L["HELP_TEST"] or ""))
print(PREFIX .. " " .. (L["HELP_ENABLE"] or ""))
print(PREFIX .. " " .. (L["HELP_DISABLE"] or ""))
print(PREFIX .. " |cffffffff/poelu high|r - " .. (L["SOUND_HIGH"] or ""))
print(PREFIX .. " |cffffffff/poelu med|r - " .. (L["SOUND_MEDIUM"] or ""))
print(PREFIX .. " |cffffffff/poelu low|r - " .. (L["SOUND_LOW"] or ""))
end

local function HandleSlashCommand(args)
local command = string.lower(args or "")
if command == "" or command == "help" then
ShowHelp()
elseif command == "test" then
print(PREFIX .. " " .. (L["PLAYING_TEST"] or ""))
handle:Test()
elseif command == "enable" then
handle:Enable()
print(PREFIX .. " " .. (L["ADDON_ENABLED"] or ""))
elseif command == "disable" then
handle:Disable()
print(PREFIX .. " " .. (L["ADDON_DISABLED"] or ""))
elseif command == "high" then
handle:SetVariant("high")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "high"))
elseif command == "med" or command == "medium" then
handle:SetVariant("medium")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "medium"))
elseif command == "low" then
handle:SetVariant("low")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "low"))
else
print(PREFIX .. " " .. (L["ERROR_PREFIX"] or "") .. " " .. (L["ERROR_UNKNOWN_COMMAND"] or ""))
end
end

RGX:RegisterEvent("ADDON_LOADED", function(event, addonName)
if addonName ~= ADDON_NAME then return end
handle:SetLocale(POELU.L)
L = POELU.L or {}
handle:Init()
initialized = true
end, "POELU_ADDON_LOADED")

RGX:RegisterEvent("PLAYER_LEVEL_UP", function()
if initialized then
handle:Play()
end
end, "POELU_PLAYER_LEVEL_UP")

RGX:RegisterEvent("PLAYER_LOGIN", function()
if not initialized then
handle:SetLocale(POELU.L)
L = POELU.L or {}
handle:Init()
initialized = true
end
handle:ShowWelcome(PREFIX, TITLE)
end, "POELU_PLAYER_LOGIN")

RGX:RegisterEvent("PLAYER_LOGOUT", function()
handle:Logout()
end, "POELU_PLAYER_LOGOUT")

RGX:RegisterSlashCommand("poelu", function(msg)
local ok, err = pcall(HandleSlashCommand, msg)
if not ok then
print(PREFIX .. " " .. (L["ERROR_PREFIX"] or "") .. " " .. tostring(err))
end
end, "POELU_SLASH")

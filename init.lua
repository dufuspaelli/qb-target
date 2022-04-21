local QBCore = exports['qb-core']:GetCoreObject()

function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

Config = {}

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 7.0

-- Enable debug options
Config.Debug = false

-- Supported values: true, false
Config.Standalone = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = true

-- Whether to have the target as a toggle or not
Config.Toggle = false

-- Draw a Sprite on the center of a PolyZone to hint where it's located
Config.DrawSprite = true

-- The default distance to draw the Sprite
Config.DrawDistance = 10.0

-- The color of the sprite in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.DrawColor = {255, 255, 255, 255}

-- The color of the sprite in rgb when the PolyZone is targeted, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.SuccessDrawColor = {30, 144, 255, 255}

-- The color of the outline in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.OutlineColor = {255, 255, 255, 255}

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = true

-- Disable the target eye whilst being in a vehicle
Config.DisableInVehicle = true

-- Key to open the target eye, here you can find all the names: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.OpenKey = 'LMENU' -- Left Alt
Config.OpenControlKey = 19 -- Control for keypress detection also Left Alt for the eye itself, controls are found here https://docs.fivem.net/docs/game-references/controls/

-- Key to open the menu
Config.MenuControlKey =  19 -- Control for keypress detection on the context menu, this is the Right Mouse Button, controls are found here https://docs.fivem.net/docs/game-references/controls/

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

Config.CircleZones = {

}

Config.BoxZones = {
  
}

Config.PolyZones = {

}

Config.TargetBones = {

}

Config.TargetModels = {
	["lifehackerhack"] = {
		models = {
			394821236,
		},
		options = {
			{
				type = "client",
				event = "qb-cnr:cryptohack",
				icon = "fas fa-circle",
				label = "Steal some cryptocurrency from Avon",
			},
		},
		distance = 2.5,
	},
	["24/7-SHOPS"] = {
		models = {
			"mp_m_shopkeep_01",
		},
		options = {
			{
				type = "client",
				event = "qb-shops:marketshop",
				icon = "fas fa-circle",
				label = "Open shop",
			},
		},
		distance = 2.5,
	},
	["ammunation shops"] = {
        models = {
            "s_m_y_ammucity_01",
        },
        options = {
            {
                type = "client",
                event = "qb-shops:marketshop",
                icon = "fas fa-shopping-cart",
                label = "Buy Weapons",
            },
        },
        distance = 2.5,
    },
    ["youtool shops"] = {
        models = {
            "s_m_m_lathandy_01",
        },
        options = {
            {
                type = "client",
                event = "qb-shops:marketshop",
                icon = "fas fa-wrench",
                label = "Buy Tools",
            },
        },
        distance = 2.5,
    },
	["mechanics"] = {
        models = {
            "mp_m_waremech_01",
        },
        options = {
            {
                type = "client",
                event =  "qb-shops:marketshop",
                icon = "fas fa-wrench",
                label = "Mechanic",
            },
        },
        distance = 2.5,
    },
	["blackmarket"] = {
		models = {
			"ig_lestercrest_2"
		},
        options = {
            {
                type = "client",
                event =  "qb-shops:marketshop",
                icon = "fas fa-wrench",
                label = "Buy tools for the job",
				num = 1,
				canInteract = function(entity) 
					local Player = QBCore.Functions.GetPlayerData()
					if Player.job.name == "police" then 
						return false
					else 
						print("canInteract")
						return true 
					end
				end
            },
			{
                type = "client",
                event =  "qb-cnr:client:sellMarkedBills",
                icon = "fas fa-money-bill",
                label = "Sell your dirty cash",
				num = 2,
				canInteract = function(entity) 
					local Player = QBCore.Functions.GetPlayerData()
					if Player.job.name == "police" then 
						return false
					else 
						print("canInteract")
						return true 
					end
				end
            },
			{
                type = "client",
                event =  "qb-cnr:client:liHeistMenu",
                icon = "fas fa-money-bill-wave",
                label = "Double your dirty cash",
				num = 3,
				canInteract = function(entity) 
					local Player = QBCore.Functions.GetPlayerData()
					if Player.job.name == "police" then 
						return false
					else 
						print("canInteract")
						return true 
					end
				end
            },
        },
        distance = 2.5,

	}, 
	["truckers"] = {
		models = {
			"s_m_m_dockwork_01"
		},
        options = {
            {
                type = "client",
                event =  "qb-cnr:startdelivery",
                icon = "fas fa-truck-loading",
                label = "Start a truck delivery",
				num = 1,
				canInteract = function(entity) 
					local Player = QBCore.Functions.GetPlayerData()
					if Player.job.name == "police" then 
						return false
					else 
						print("canInteract")
						return true 
					end
				end
            },
			{
                type = "client",
                event =  "qb-cnr:client:buyTruck",
                icon = "fas fa-money-bill-wave",
                label = "Rent a truck",
				num = 2,
				canInteract = function(entity) 
					local Player = QBCore.Functions.GetPlayerData()
					if Player.job.name == "police" then 
						return false
					else 
						print("canInteract")
						return true 
					end
				end
            },
        },
		
        distance = 2.5,

	}

}

Config.Peds = {
	{
		model = 'mp_m_waremech_01',
        coords = vector4(728.29, -1083.2, 22.17, 247.09),
        gender = 'male',
        freeze = false,
        invincible = true,
        blockevents = true,
	},
	{
		model = 'mp_m_waremech_01',
        coords = vector4(-347.29, -133.34, 39.01, 235.47),
        gender = 'male',
        freeze = false,
        invincible = true,
        blockevents = true,
	},
	{
		model = 'mp_m_waremech_01',
        coords = vector4(1189.31, 2643.67, 38.4, 87.96),
        gender = 'male',
        freeze = false,
        invincible = true,
        blockevents = true,
	},
	{
		model = 'mp_m_waremech_01',
        coords = vector4(-1147.17, -2002.22, 13.18, 126.39),
        gender = 'male',
        freeze = false,
        invincible = true,
        blockevents = true,
	},
	{
		model = 'mp_m_waremech_01',
        coords = vector4(-27.96, -1092.54, 26.42, 60.12),
        gender = 'male',
        freeze = false,
        invincible = true,
        blockevents = true,
	},
	{
		model = 'mp_m_waremech_01',
        coords = vector4(472.02, -1309.66, 29.23, 217.0),
        gender = 'male',
        freeze = false,
        invincible = true,
        blockevents = true,
		options = {
			{
                type = "client",
                event =  "qb-shops:marketshop",
                icon = "fas fa-wrench",
                label = "Mechanic",
			},
		}
	},
	{
		model = 'ig_lestercrest_2',
        coords = vector4(706.37, -967.0, 30.41, 345.29),
        gender = 'male',
        freeze = false,
        invincible = true,
        blockevents = true,
	},
	{
		model = 's_m_m_dockwork_01',
        coords = vector4(154.02, -3215.04, 5.93, 71.43),
        gender = 'male',
        freeze = false,
        invincible = true,
        blockevents = true,
	},
	{
        model = 'mp_m_shopkeep_01',
        coords = vector4(-3242.23, 999.97, 11.85, 351.66),
        gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
    },
    {
        model = 'mp_m_shopkeep_01',
        coords = vector4(24.5, -1346.63, 28.60, 273.18),
        gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
    },
    {
        model = 'mp_m_shopkeep_01',
        coords = vector4(-47.18, -1758.46, 28.45, 39.64),
        gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
    },
    {
        model = 'mp_m_shopkeep_01',
        coords = vector4(-706.02, -913.9, 18.35, 86.17),
        gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
    },
    {
        model = 'mp_m_shopkeep_01',
		coords = vector4(-1486.75, -377.57, 39.20, 132.60),
		gender = 'male',
		freeze = true,
        invincible = true,
        blockevents = true,
	},
    	-- San Andreas Ave Robs Liquor
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(-1221.30, -907.82, 11.40, 34.60),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Carrson Ave
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(372.6, 327.06, 102.55, 258.49),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- North Rockford
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(-1819.96, 794.04, 137.10, 126.36),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Great Ocean South
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(-3039.89, 584.21, 6.90, 16.15),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Great Ocean Robs Liquor
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(-2966.41, 391.62, 14.05, 84.40),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Mirror Park
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(1164.72, -323.04, 68.25, 93.92),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Vespucci Boulevard Robs Liquor
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(1134.32, -983.25, 45.45, 278.23),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Route 68
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(549.24, 2670.37, 41.25, 94.15),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Sandy
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(1959.72, 3740.68, 31.40, 297.43),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Sandy Shores Robs Liquor
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(1165.25, 2710.80, 38.16, 183.01),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Grape Seed
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(1697.8, 4923.14, 41.10, 321.33),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Great Ocean North
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(1728.33, 6416.21, 35.04, 241.78),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- LS Freeway
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(2677.32, 3279.69, 54.30, 323.82),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Paleto
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(161.43, 6642.52, 31.70, 225.18),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Paleto Robs Liquor
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(-160.53, 6320.84, 31.59, 312.67),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},

	-- Ammunations
    {   ----vesspuci
		model = 's_m_y_ammucity_01',
		coords = vector4(-661.98, -933.57, 20.80, 181.76),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Legion Square
	{
		model = 's_m_y_ammucity_01',
		coords = vector4(22.59, -1105.55, 28.80, 159.83),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Popular Street
	{
		model = 's_m_y_ammucity_01',
		coords = vector4(810.21, -2159.02, 28.60, 1.43),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Vespucci Boulevard
	{
		model = 's_m_y_ammucity_01',
		coords = vector4(842.42, -1035.31, 27.20, 358.67),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Vinewood Hills
	{
		model = 's_m_y_ammucity_01',
		coords = vector4(253.87, -50.58, 68.95, 67.39),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Palomino Freeway
	{
		model = 's_m_y_ammucity_01',
		coords = vector4(2567.97, 292.64, 107.80, 358.18),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Route 68
	{
		model = 's_m_y_ammucity_01',
		coords = vector4(-1118.98, 2699.77, 17.60, 223.39),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Sandy Shores
	{
		model = 's_m_y_ammucity_01',
		coords = vector4(1692.21, 3760.91, 33.70, 229.39),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
	-- Paleto
	{
		model = 's_m_y_ammucity_01',
		coords = vector4(-331.61, 6084.92, 30.55, 226.57),
		gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
	},
    ---------------------------------------------------------------------------------
    {  -------Youtool Shop------
        model = `s_m_m_lathandy_01`,
        coords = vector4(45.48, -1748.85, 28.55, 55.1),
        gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
    },
    {  -------Youtool Shop------
        model = `s_m_m_lathandy_01`,
        coords = vector4(2748.07, 3472.72, 54.70, 238.96),
        gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
    },

}
Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {

}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {

}


-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
local function JobCheck() return true end
local function GangCheck() return true end
local function ItemCount() return true end
local function CitizenCheck() return true end

CreateThread(function()
	local state = GetResourceState('qb-core')
	if state ~= 'missing' then
		if state ~= 'started' then
			local timeout = 0
			repeat
				timeout += 1
				Wait(0)
			until GetResourceState('qb-core') == 'started' or timeout > 100
		end
		Config.Standalone = false
	end
	if Config.Standalone then
		local firstSpawn = false
		local event = AddEventHandler('playerSpawned', function()
			SpawnPeds()
			firstSpawn = true
		end)
		-- Remove event after it has been triggered
		while true do
			if firstSpawn then
				RemoveEventHandler(event)
				break
			end
			Wait(1000)
		end
	else
		local QBCore = exports['qb-core']:GetCoreObject()
		local PlayerData = QBCore.Functions.GetPlayerData()

		ItemCount = function(item)
			for _, v in pairs(PlayerData.items) do
				if v.name == item then
					return v.amount
				end
			end
			return 0
		end

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
			PlayerData = QBCore.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
			PlayerData = val
		end)
	end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.item and not ItemCount(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end
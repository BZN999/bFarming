ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
	
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	
    if ESX.IsPlayerLoaded() then



		ESX.PlayerData = ESX.GetPlayerData()



    end

end)

local PlayerData              = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
     PlayerData = xPlayer
end)



RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local buttonoui = false
local open = false
local MenuSelect = RageUI.CreateMenu("Menu Farm", "choix")
local IntoMenuSelect = RageUI.CreateSubMenu(MenuSelect, "Liste des produits", "produits")
local IntochoiseMenuPeche = RageUI.CreateSubMenu(IntoMenuSelect, "Pêche", "farm de la peche")
local IntochoiseMenuPomme = RageUI.CreateSubMenu(IntoMenuSelect, "Pomme", "farm de la pomme")
MenuSelect.Display.Header = true
MenuSelect.Closed = function()
    open = false
end

function OpenMenuSelect() 
    if open then 
        open = false
        RageUI.Visible(MenuSelect, false)
        return
    else
        open = true
        RageUI.Visible(MenuSelect, true)
        CreateThread(function()
            while open do 
                RageUI.IsVisible(MenuSelect, function()
                    RageUI.Separator("↓     ~g~Travail     ~s~↓")
                    RageUI.Button("Travailler", "prendre un cdi", {RightLabel = "→"}, true , {
                        onSelected = function()
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            local h = skin.sex == 0
                            local f = skin.sex == 1
                            if h then
                                TriggerEvent('skinchanger:loadClothes', skin, Config.Tenue.Tenuetravaille.homme)
                            elseif f then
                                TriggerEvent('skinchanger:loadClothes', skin, Config.Tenue.Tenuetravaille.femme)
                            end
                        end)
                          Wait(100)
                          ESX.ShowAdvancedNotification('Travail', 'Informations', 'Une voiture t\'attends, fais ton choix parmis les produits', 'CHAR_PROPERTY_SONAR_COLLECTIONS', 5)
                          Tesunfou("blista")
                          buttonoui = true
                      end
                      })
                    RageUI.Button("~r~Arreter le boulot", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
							TriggerEvent('skinchanger:loadSkin', skin)
						end)
                        RageUI.CloseAll()
                        Wait(100)
                        ESX.ShowAdvancedNotification('Travail', 'Informations', 'Tu en as asssez fais pour ajourd\'hui', 'CHAR_PROPERTY_SONAR_COLLECTIONS', 5)
                        buttonoui = false
                    end
                    })
                    
                    if buttonoui then
                        buttonoui = true
                        RageUI.Separator("↓     ~g~Farming     ~s~↓")
                        RageUI.Button("Produits", "voir la liste des produits", {RightLabel = "~y~→→→"},  true , {}, IntoMenuSelect)
                    end
                    
                    
                end)

                RageUI.IsVisible(IntoMenuSelect, function()
                    RageUI.Separator("↓     ~g~Produits disponibles     ~s~↓")
                    RageUI.Button("Pêche", "pour farmer la pêche", {RightLabel = "~y~→→→"}, true , {}, IntochoiseMenuPeche)
                    RageUI.Button("Pomme", "pour farmer la pomme", {RightLabel = "~y~→→→"}, true , {}, IntochoiseMenuPomme)
                end)

                RageUI.IsVisible(IntochoiseMenuPeche, function()
                RageUI.Separator("~b~↓ Recolte/Traitement/Vente ↓")
  
                RageUI.Button("Obtenir le point de récolte", nil, {RightLabel = "→"}, true , {
                  onSelected = function()
                    
                    SetNewWaypoint(327.73,6530.87)
                    ESX.ShowAdvancedNotification('Peche', 'Informations', 'Point GPS défini vers le point de récolte', 'CHAR_PROPERTY_SONAR_COLLECTIONS', 5)
                    Wait(100)
                    farmpeche()
                end
                })
  
                RageUI.Button("Obtenir le point de traitement", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetNewWaypoint(2345.8,3142.53)
                    ESX.ShowAdvancedNotification('Peche', 'Informations', 'Point GPS défini vers le point de traitement', 'CHAR_PROPERTY_SONAR_COLLECTIONS', 5)
                    Wait(100)
                    pechetraite()
                end
                })
  
                RageUI.Button("Obtenir le point de vente", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                    SetNewWaypoint(714.01,-717.05)
                    ESX.ShowAdvancedNotification('Peche', 'Informations', 'Point GPS défini vers le point de vente', 'CHAR_PROPERTY_SONAR_COLLECTIONS', 5)
                    Wait(100)
                    pechevente()
                end
                })
                end)
                RageUI.IsVisible(IntochoiseMenuPomme, function()
                    RageUI.Separator("~b~↓ Recolte/Traitement/Vente ↓")
                    RageUI.Button("Obtenir le point de récolte", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                          
                          SetNewWaypoint(2059.72,4841.27)
                          ESX.ShowAdvancedNotification('Pomme', 'Informations', 'Point GPS défini vers le point de récolte', 'CHAR_PROPERTY_SONAR_COLLECTIONS', 5)
                          Wait(100)
                          farmpomme()
                      end
                      })
        
                      RageUI.Button("Obtenir le point de traitement", nil, {RightLabel = "→"}, true , {
                      onSelected = function()
                          SetNewWaypoint(1383.24,-2078.86)
                          ESX.ShowAdvancedNotification('Pomme', 'Informations', 'Point GPS défini vers le point de traitement', 'CHAR_PROPERTY_SONAR_COLLECTIONS', 5)
                          Wait(100)
                          pommetraite()
                      end
                      })
        
                      RageUI.Button("Obtenir le point de vente", nil, {RightLabel = "→"}, true , {
                          onSelected = function()
                          SetNewWaypoint(152.23,-3104.26)
                          ESX.ShowAdvancedNotification('Pomme', 'Informations', 'Point GPS défini vers le point de vente', 'CHAR_PROPERTY_SONAR_COLLECTIONS', 5)
                          Wait(100)
                          pommevente()
                      end
                    })
                end)
            Wait(0)
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(Config.Postravaille) do
            DrawMarker(21, Config.Postravaille[k].x, Config.Postravaille[k].y, Config.Postravaille[k].z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 136, 12, 198, 255, 0, 1, 2, 0, nil, nil, 0)
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Postravaille[k].x, Config.Postravaille[k].y, Config.Postravaille[k].z)
            if dist <= 1.0 then

                ESX.ShowHelpNotification('Faites ~g~[E]~s~ pour travailler au farm')
                if IsControlJustPressed(1,51) then
                    OpenMenuSelect()
                end
            end
        end
    end
end)

RecupModelPNJH = function(modelHash)
    if type(modelHash) == "string" then modelHash = GetHashKey(modelHash) end
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(0)
    end
end

Tesunfou = function(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local vehicle = CreateVehicle(car, Config.Voiture.spawnduvehicule.position.x, Config.Voiture.spawnduvehicule.position.y, Config.Voiture.spawnduvehicule.position.z, Config.Voiture.spawnduvehicule.position.h, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleColours(vehicle, 131, 131)
    SetVehicleNumberPlateText(vehicle, "FARMING")
end

Citizen.CreateThread(function()
    for i=1, #Config.PNJ do
        local pnj = Config.PNJ[i]["Emplacement"]
            pnj["modelHash"] = pnj["modelHash"]
            RecupModelPNJH(pnj["modelHash"])
            if not DoesEntityExist(pnj["entity"]) then
                pnj["entity"] = CreatePed(4, pnj["modelHash"], pnj["x"], pnj["y"], pnj["z"], pnj["h"])
                SetEntityAsMissionEntity(pnj["entity"])
                SetBlockingOfNonTemporaryEvents(pnj["entity"], true)
                FreezeEntityPosition(pnj["entity"], true)
                SetEntityInvincible(pnj["entity"], true)
            end
            SetModelAsNoLongerNeeded(pnj["modelHash"])
    end
end)
ESX = nil

local openrecolte = false
local recoltepeche = RageUI.CreateMenu('Recolte Peche', 'peche')
recoltepeche.Display.Header = true 
recoltepeche.Closed = function()
  openrecolte = false
end

--recolte
function farmpeche()
    if not markerpossible then
        markerpossible = true
    while markerpossible do
        Citizen.Wait(0)
        for k in pairs(Config.Pechepoint) do
            if markerpossible then
    
                DrawMarker(21, Config.Pechepoint[k].x, Config.Pechepoint[k].y, Config.Pechepoint[k].z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 147, 0, 255, 0, 1, 2, 0, nil, nil, 0)
    
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Pechepoint[k].x, Config.Pechepoint[k].y, Config.Pechepoint[k].z)
    
            if dist <= 1.5 then
                ESX.ShowHelpNotification('Faites ~g~[E]~s~ pour commencer à récolter les pêches')
                if IsControlJustPressed(1,51) then
                    menurecolte()
                end
                end
            end
            end       
        end
    else
        markerpossible = false
    end
end
function menurecolte()
    if openrecolte then
        openrecolte = false
        RageUI.Visible(recoltepeche, false)
        return
    else
        openrecolte = true 
        RageUI.Visible(recoltepeche, true)
        CreateThread(function()
        while openrecolte do
           RageUI.IsVisible(recoltepeche,function() 
           
  
            RageUI.Button("Récolter la pêche", nil, {RightLabel = "→→"}, true , {
              onSelected = function()
                FreezeEntityPosition(PlayerPedId(), true)
                commencerlarecolteman()
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
  
            RageUI.Button("Arreter la récolte", nil, { Color = {BackgroundColor = { 240, 1, 1, 100}} }, true, {
            onSelected = function()
              FreezeEntityPosition(PlayerPedId(), false)
              RageUI.CloseAll()
              stoptoutmamen()
              
            end
        })
  
  
         end)
         Wait(0)
        end
     end)
  end
end
function commencerlarecolteman()
  if not recoltepossible then
      recoltepossible = true
  while recoltepossible do
      Citizen.Wait(2000)
      TriggerServerEvent('recoltepeche')
  end
  else
      recoltepossible = false
  end
end
function stoptoutmamen()
    if recoltepossible then
      recoltepossible = false
    end
    if markerpossible then
        markerpossible = false
    end
end

--traitement
local opentraitement = false
local traitementpeche = RageUI.CreateMenu('Taitement Peche', 'tarte aux peches')
traitementpeche.Display.Header = true 
traitementpeche.Closed = function()
    opentraitement = false
end
function pechetraite()
    if not markerpossible2 then
        markerpossible2 = true
    while markerpossible2 do
        Citizen.Wait(0)
        for k in pairs(Config.Pechetraitement) do
            if markerpossible2 then
    
                DrawMarker(21, Config.Pechetraitement[k].x, Config.Pechetraitement[k].y, Config.Pechetraitement[k].z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 147, 0, 255, 0, 1, 2, 0, nil, nil, 0)
    
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Pechetraitement[k].x, Config.Pechetraitement[k].y, Config.Pechetraitement[k].z)
    
            if dist <= 1.5 then
                ESX.ShowHelpNotification('Faites ~g~[E]~s~ pour commencer traiter les pêches')
                if IsControlJustPressed(1,51) then
                    menutraitement()
                end
                end
            end
            end       
        end
    else
        markerpossible2 = false
    end
end
function menutraitement()
    if opentraitement then
        opentraitement = false
        RageUI.Visible(traitementpeche, false)
        return
    else
        opentraitement = true 
        RageUI.Visible(traitementpeche, true)
        CreateThread(function()
        while opentraitement do
           RageUI.IsVisible(traitementpeche,function() 
           
  
            RageUI.Button("Faire une tarte", nil, {RightLabel = "→→"}, true , {
              onSelected = function()
                FreezeEntityPosition(PlayerPedId(), true)
                commencertraitement()
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
  
            RageUI.Button("Arreter l'activité", nil, { Color = {BackgroundColor = { 240, 1, 1, 100}} }, true, {
            onSelected = function()
              FreezeEntityPosition(PlayerPedId(), false)
              RageUI.CloseAll()
              stoptoutmamen2()
              
            end
        })
  
  
         end)
         Wait(0)
        end
     end)
  end
end
function commencertraitement()
    if not traitementpossible then
        traitementpossible = true
    while traitementpossible do
        Citizen.Wait(2000)
        TriggerServerEvent('traitementpeche')
    end
    else
        traitementpossible = false
    end
end
function stoptoutmamen2()
    if traitementpossible then
        traitementpossible = false
    end
    if markerpossible2 then
        markerpossible2 = false
    end
end

--vente
local openvente = false
local ventepeche = RageUI.CreateMenu('Vente Peche', 'Vendre')
ventepeche.Display.Header = true 
ventepeche.Closed = function()
    openvente = false
end
function pechevente()
    if not markerpossible3 then
        markerpossible3 = true
    while markerpossible3 do
        Citizen.Wait(0)
        for k in pairs(Config.Pechevente) do
            if markerpossible3 then
    
                DrawMarker(21, Config.Pechevente[k].x, Config.Pechevente[k].y, Config.Pechevente[k].z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 147, 0, 255, 0, 1, 2, 0, nil, nil, 0)
    
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Pechevente[k].x, Config.Pechevente[k].y, Config.Pechevente[k].z)
    
            if dist <= 1.5 then
                ESX.ShowHelpNotification('Faites ~g~[E]~s~ pour commencer à vendre les tartes aux pêches')
                if IsControlJustPressed(1,51) then
                    menuvente()
                end
                end
            end
            end       
        end
    else
        markerpossible3 = false
    end
end
function menuvente()
    if openvente then
        openvente = false
        RageUI.Visible(ventepeche, false)
        return
    else
        openvente = true 
        RageUI.Visible(ventepeche, true)
        CreateThread(function()
        while openvente do
           RageUI.IsVisible(ventepeche,function() 
           
  
            RageUI.Button("Vendre les tarte aux pêches", nil, {RightLabel = "→→"}, true , {
              onSelected = function()
                FreezeEntityPosition(PlayerPedId(), true)
                commenceravendre()
              end
          })
  
            RageUI.Button("Arreter la vente", nil, { Color = {BackgroundColor = { 240, 1, 1, 100}} }, true, {
            onSelected = function()
              FreezeEntityPosition(PlayerPedId(), false)
              RageUI.CloseAll()
              stoptoutmamen3()
              
            end
        })
  
  
         end)
         Wait(0)
        end
     end)
  end
end
function commenceravendre()
    if not ventepossible then
        ventepossible = true
    while ventepossible do
        Citizen.Wait(2000)
        TriggerServerEvent('ventepeche')
    end
    else
        ventepossible = false
    end
end
function stoptoutmamen3()
    if ventepossible then
        ventepossible = false
    end
    if markerpossible3 then
        markerpossible3 = false
    end
end
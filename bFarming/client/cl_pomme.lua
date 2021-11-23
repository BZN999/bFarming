ESX = nil

ESX = nil

local openrecoltepomme = false
local recoltepomme = RageUI.CreateMenu('Recolte Pomme', 'pomme')
recoltepomme.Display.Header = true 
recoltepomme.Closed = function()
  openrecoltepomme = false
end

--recolte
function farmpomme()
    if not markerpossible4 then
        markerpossible4 = true
    while markerpossible4 do
        Citizen.Wait(0)
        for k in pairs(Config.Pommepoint) do
            if markerpossible4 then
    
                DrawMarker(21, Config.Pommepoint[k].x, Config.Pommepoint[k].y, Config.Pommepoint[k].z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 147, 0, 255, 0, 1, 2, 0, nil, nil, 0)
    
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Pommepoint[k].x, Config.Pommepoint[k].y, Config.Pommepoint[k].z)
    
            if dist <= 1.5 then
                ESX.ShowHelpNotification('Faites ~g~[E]~s~ pour commencer à récolter les pommes')
                if IsControlJustPressed(1,51) then
                    menurecoltepomme()
                end
                end
            end
            end       
        end
    else
        markerpossible4 = false
    end
end
function menurecoltepomme()
    if openrecoltepomme then
        openrecoltepomme = false
        RageUI.Visible(recoltepomme, false)
        return
    else
        openrecoltepomme = true 
        RageUI.Visible(recoltepomme, true)
        CreateThread(function()
        while openrecoltepomme do
           RageUI.IsVisible(recoltepomme,function() 
           
  
            RageUI.Button("Récolter la pomme", nil, {RightLabel = "→→"}, true , {
              onSelected = function()
                FreezeEntityPosition(PlayerPedId(), true)
                commencerlarecoltepommeman()
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
  
            RageUI.Button("Arreter la récolte", nil, { Color = {BackgroundColor = { 240, 1, 1, 100}} }, true, {
            onSelected = function()
              FreezeEntityPosition(PlayerPedId(), false)
              RageUI.CloseAll()
              stoptoutmamenpomme()
              
            end
        })
  
  
         end)
         Wait(0)
        end
     end)
  end
end
function commencerlarecoltepommeman()
  if not recoltepossible2 then
      recoltepossible2 = true
  while recoltepossible2 do
      Citizen.Wait(2000)
      TriggerServerEvent('recoltepomme')
  end
  else
      recoltepossible2 = false
  end
end
function stoptoutmamenpomme()
    if recoltepossible2 then
      recoltepossible2 = false
    end
    if markerpossible4 then
        markerpossible4 = false
    end
end

--traitement
local opentraitementpomme = false
local traitementpomme = RageUI.CreateMenu('Taitement Pomme', 'tarte aux pommes')
traitementpomme.Display.Header = true 
traitementpomme.Closed = function()
    opentraitementpomme = false
end
function pommetraite()
    if not markerpossible5 then
        markerpossible5 = true
    while markerpossible5 do
        Citizen.Wait(0)
        for k in pairs(Config.Pommetraitement) do
            if markerpossible5 then
    
                DrawMarker(21, Config.Pommetraitement[k].x, Config.Pommetraitement[k].y, Config.Pommetraitement[k].z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 147, 0, 255, 0, 1, 2, 0, nil, nil, 0)
    
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Pommetraitement[k].x, Config.Pommetraitement[k].y, Config.Pommetraitement[k].z)
    
            if dist <= 1.5 then
                ESX.ShowHelpNotification('Faites ~g~[E]~s~ pour commencer à traiter les pommes')
                if IsControlJustPressed(1,51) then
                    menutraitementpomme()
                end
                end
            end
            end       
        end
    else
        markerpossible5 = false
    end
end
function menutraitementpomme()
    if opentraitementpomme then
        opentraitementpomme = false
        RageUI.Visible(traitementpomme, false)
        return
    else
        opentraitementpomme = true 
        RageUI.Visible(traitementpomme, true)
        CreateThread(function()
        while opentraitementpomme do
           RageUI.IsVisible(traitementpomme,function() 
           
  
            RageUI.Button("Faire une tarte", nil, {RightLabel = "→→"}, true , {
              onSelected = function()
                FreezeEntityPosition(PlayerPedId(), true)
                commencertraitementpomme()
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
  
            RageUI.Button("Arreter l'activité", nil, { Color = {BackgroundColor = { 240, 1, 1, 100}} }, true, {
            onSelected = function()
              FreezeEntityPosition(PlayerPedId(), false)
              RageUI.CloseAll()
              stoptoutmamen2pommetrait()
              
            end
        })
  
  
         end)
         Wait(0)
        end
     end)
  end
end
function commencertraitementpomme()
    if not traitementpommepossible then
        traitementpommepossible = true
    while traitementpommepossible do
        Citizen.Wait(2000)
        TriggerServerEvent('traitementpomme')
    end
    else
        traitementpommepossible = false
    end
end
function stoptoutmamen2pommetrait()
    if traitementpommepossible then
        traitementpommepossible = false
    end
    if markerpossible5 then
        markerpossible5 = false
    end
end

--vente
local openventepomme = false
local ventepomme = RageUI.CreateMenu('Vente Pomme', 'Vendre')
ventepomme.Display.Header = true 
ventepomme.Closed = function()
    openventepomme = false
end
function pommevente()
    if not markerpossible6 then
        markerpossible6 = true
    while markerpossible6 do
        Citizen.Wait(0)
        for k in pairs(Config.Pommevente) do
            if markerpossible6 then
    
                DrawMarker(21, Config.Pommevente[k].x, Config.Pommevente[k].y, Config.Pommevente[k].z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 147, 0, 255, 0, 1, 2, 0, nil, nil, 0)
    
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Pommevente[k].x, Config.Pommevente[k].y, Config.Pommevente[k].z)
    
            if dist <= 1.5 then
                ESX.ShowHelpNotification('Faites ~g~[E]~s~ pour commencer à vendre les tartes aux pommes')
                if IsControlJustPressed(1,51) then
                    menuventepomme()
                end
                end
            end
            end       
        end
    else
        markerpossible6 = false
    end
end
function menuventepomme()
    if openventepomme then
        openventepomme = false
        RageUI.Visible(ventepomme, false)
        return
    else
        openventepomme = true 
        RageUI.Visible(ventepomme, true)
        CreateThread(function()
        while openventepomme do
           RageUI.IsVisible(ventepomme,function() 
           
  
            RageUI.Button("Vendre les tarte aux pommes", nil, {RightLabel = "→→"}, true , {
              onSelected = function()
                FreezeEntityPosition(PlayerPedId(), true)
                commenceravendrepomme()
              end
          })
  
            RageUI.Button("Arreter la vente", nil, { Color = {BackgroundColor = { 240, 1, 1, 100}} }, true, {
            onSelected = function()
              FreezeEntityPosition(PlayerPedId(), false)
              RageUI.CloseAll()
              stoptoutmamen3pomme()
              
            end
        })
  
  
         end)
         Wait(0)
        end
     end)
  end
end
function commenceravendrepomme()
    if not ventepommepossible then
        ventepommepossible = true
    while ventepommepossible do
        Citizen.Wait(2000)
        TriggerServerEvent('ventepomme')
    end
    else
        ventepommepossible = false
    end
end
function stoptoutmamen3pomme()
    if ventepommepossible then
        ventepommepossible = false
    end
    if markerpossible6 then
        markerpossible6 = false
    end
end
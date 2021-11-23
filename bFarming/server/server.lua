ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--peche
RegisterNetEvent('recoltepeche')
AddEventHandler('recoltepeche', function()
    local item = "bznpeche"
    local limiteitem = 45
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "~r~Trop de pêche dans l'inventaire")
        recoltepossible = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Vous récoltez des pêches...")
		return
    end
end)
RegisterNetEvent('traitementpeche')
AddEventHandler('traitementpeche', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local bznpechetraitermgl = xPlayer.getInventoryItem('bznpeche').count

    if bznpechetraitermgl < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~Pas assez de pêche pour une tarte...')
    else
        xPlayer.removeInventoryItem('bznpeche', 5)
        xPlayer.addInventoryItem('bzntartepeche', 1)
    end
end)
RegisterNetEvent('ventepeche')
AddEventHandler('ventepeche', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local bznventemamen = xPlayer.getInventoryItem('bzntartepeche').count

    if bznventemamen < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~Pas assez de tarte a vendre...')
    elseif bznventemamen > 0 then
        xPlayer.removeInventoryItem('bzntartepeche', 1)
        xPlayer.addMoney(25)
        TriggerClientEvent('esx:showNotification', source, '~g~Vous gagné 25 $ pour chaques tartes vendus')
    end
end)

--pomme
RegisterNetEvent('recoltepomme')
AddEventHandler('recoltepomme', function()
    local item = "bznpomme"
    local limiteitem = 45
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "~r~Trop de pomme dans l'inventaire")
        recoltepossible = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Vous récoltez des pommes...")
		return
    end
end)
RegisterNetEvent('traitementpomme')
AddEventHandler('traitementpomme', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local bznpommetraitermgl = xPlayer.getInventoryItem('bznpomme').count

    if bznpommetraitermgl < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~Pas assez de pêche pour une tarte...')
    else
        xPlayer.removeInventoryItem('bznpomme', 5)
        xPlayer.addInventoryItem('bzntartepomme', 1)
    end
end)
RegisterNetEvent('ventepomme')
AddEventHandler('ventepomme', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local bznventemamenpomme = xPlayer.getInventoryItem('bzntartepomme').count

    if bznventemamenpomme < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~Pas assez de tarte a vendre...')
    elseif bznventemamenpomme > 0 then
        xPlayer.removeInventoryItem('bzntartepomme', 1)
        xPlayer.addMoney(50)
        TriggerClientEvent('esx:showNotification', source, '~g~Vous gagné 50 $ pour chaques tartes vendus')
    end
end)
local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

function OpenMDTMenu()
    local elements = {
        {label = 'Wanted List', value = 'wanted_list'},
        {label = 'Criminal Records', value = 'criminal_records'},
        {label = 'Vehicle Search', value = 'vehicle_search'},
        {label = 'Close', value = 'close'}
    }

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mdt_menu', {
        title    = Config.MDTMenuTitle,
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'wanted_list' then
            TriggerServerEvent('police:getWantedList')
        elseif data.current.value == 'criminal_records' then
            TriggerServerEvent('police:getCriminalRecords')
        elseif data.current.value == 'vehicle_search' then
            TriggerServerEvent('police:searchVehicle')
        elseif data.current.value == 'close' then
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end

RegisterCommand(Config.MDTCommand, function(source, args, rawCommand)
    if ESX.PlayerData.job and ESX.PlayerData.job.name == Config.PoliceJobName then
        OpenMDTMenu()
    else
        ESX.ShowNotification('You are not a police officer.')
    end
end, false)

RegisterNetEvent('police:showWantedList')
AddEventHandler('police:showWantedList', function(wantedList)
    local elements = {}
    for i=1, #wantedList, 1 do
        table.insert(elements, {label = wantedList[i].name .. ' - ' .. wantedList[i].reason, value = wantedList[i].identifier})
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wanted_list', {
        title    = 'Wanted List',
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end)

RegisterNetEvent('police:showCriminalRecords')
AddEventHandler('police:showCriminalRecords', function(criminalRecords)
    local elements = {}
    for i=1, #criminalRecords, 1 do
        table.insert(elements, {label = criminalRecords[i].name .. ' - ' .. criminalRecords[i].crime, value = criminalRecords[i].identifier})
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'criminal_records', {
        title    = 'Criminal Records',
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end)

RegisterNetEvent('police:showVehicleSearch')
AddEventHandler('police:showVehicleSearch', function(vehicleData)
    local elements = {}
    for i=1, #vehicleData, 1 do
        table.insert(elements, {label = vehicleData[i].plate .. ' - ' .. vehicleData[i].owner, value = vehicleData[i].plate})
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_search', {
        title    = 'Vehicle Search',
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end)
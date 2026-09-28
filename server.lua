local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('police:getWantedList', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == Config.PoliceJobName then
        MySQL.Async.fetchAll('SELECT * FROM wanted_list', {}, function(result)
            cb(result)
        end)
    else
        cb({})
    end
end)

ESX.RegisterServerCallback('police:getCriminalRecords', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == Config.PoliceJobName then
        MySQL.Async.fetchAll('SELECT * FROM criminal_records', {}, function(result)
            cb(result)
        end)
    else
        cb({})
    end
end)

ESX.RegisterServerCallback('police:searchVehicle', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == Config.PoliceJobName then
        MySQL.Async.fetchAll('SELECT * FROM owned_vehicles', {}, function(result)
            cb(result)
        end)
    else
        cb({})
    end
end)

RegisterServerEvent('police:getWantedList')
AddEventHandler('police:getWantedList', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == Config.PoliceJobName then
        MySQL.Async.fetchAll('SELECT * FROM wanted_list', {}, function(result)
            TriggerClientEvent('police:showWantedList', _source, result)
        end)
    end
end)

RegisterServerEvent('police:getCriminalRecords')
AddEventHandler('police:getCriminalRecords', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == Config.PoliceJobName then
        MySQL.Async.fetchAll('SELECT * FROM criminal_records', {}, function(result)
            TriggerClientEvent('police:showCriminalRecords', _source, result)
        end)
    end
end)

RegisterServerEvent('police:searchVehicle')
AddEventHandler('police:searchVehicle', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == Config.PoliceJobName then
        MySQL.Async.fetchAll('SELECT * FROM owned_vehicles', {}, function(result)
            TriggerClientEvent('police:showVehicleSearch', _source, result)
        end)
    end
end)
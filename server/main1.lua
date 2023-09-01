local QBCore = exports['qb-core']:GetCoreObject()





-- TAVUK AMBALAJLAMA

RegisterNetEvent("qb-pirates:tavukambala")
AddEventHandler("qb-pirates:tavukambala", function(item, miktar1, paket)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        toplampaketle = miktar1 * paket
        if Player.Functions.RemoveItem(Config.IsleChickenItem, miktar1) then
            if Player.Functions.AddItem(Config.PaketChickenItem, toplampaketle) then 
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.IsleChickenItem], "remove", miktar1)
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.PaketChickenItem], "add", toplampaketle)
                TriggerClientEvent('QBCore:Notify', src, "İşlem Tamamlandı!", "success")
            else
                Player.Functions.AddItem(Config.PaketChickenItem, toplampaketle)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "Üzerinde Minumum " ..miktar1.. " Doğranmış Tavuk olması gerek!", "error")
        end
    end)


-- TAVUK KES

RegisterNetEvent("qb-pirates:tavukkes")
AddEventHandler("qb-pirates:tavukkes", function(item, number, kesme)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        toplamkesme = number * kesme
        if Player.Functions.RemoveItem(Config.ToplaChickenItem, number) then
            if Player.Functions.AddItem(Config.IsleChickenItem, toplamkesme) then 
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item], "remove", number)
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.IsleChickenItem], "add", toplamkesme)
                TriggerClientEvent('QBCore:Notify', src, "İşlem Tamamlandı!", "success")
            else
                Player.Functions.AddItem(Config.IsleChickenItem, toplamkesme)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "Üzerinde Minumum " ..number.. " Tavuk olması gerek!", "error")
        end
    end)

-- TAVUK YAKALAMA 



RegisterNetEvent("qb-pirates:tavukyakala")
AddEventHandler("qb-pirates:tavukyakala", function()
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)

           randomtopla = math.random(Config.TavukMin,Config.TavukMax)
            if Player.Functions.AddItem(Config.ToplaChickenItem, randomtopla) then 
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ToplaChickenItem], "add", randomtopla)
                TriggerClientEvent('QBCore:Notify', src, "İşlem Tamamlandı!", "success")
            else
                Player.Functions.AddItem(Config.ToplaChickenItem, randomtopla)
            end
    end)


    AddEventHandler('onResourceStart', function(resource)
        if resource == GetCurrentResourceName() then
            Citizen.Wait(5000)
            print('[^2sakasa-chicken^0] - ^1Started Version-1^0')
        end
    end)

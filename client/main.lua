local QBCore = exports['qb-core']:GetCoreObject()





--[TAVUK-PAKETLE]

for k, v in pairs(Config.ravzpaket) do
    exports['qb-target']:AddCircleZone("ravz-"..k, vector3(v.konum.x, v.konum.y, v.konum.z), 1.5, {
        name = "ravz-"..k,
        debugPoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "ravz:tavuk-paketle:main",
                icon = "fas fa-dungeon",
                label = v.isim,
                args = v.icerik,
            },
        },
        distance = 2.0
    })
end




RegisterNetEvent("ravz:tavuk-paketle:main", function(data)
    icerik = data.args
    contextdata = {
        {header = data.label, isMenuHeader = true, icon = "fas fa-person"}
    }
    for k, v in pairs(icerik) do
        
        table.insert(contextdata, {header = v.label, txt = v.paket .. " (Adet)", icon = "fas fa-right-to-bracket", params = { 
            event = "ravz-tavuk-paketle:client:openDialog",
            args =  {
                item = v.item,
                paket = v.paket,
            },
        }})

    end

    exports["qb-menu"]:openMenu(contextdata)
end)

RegisterNetEvent("ravz-tavuk-paketle:client:openDialog", function(data)
    paket = data.paket
    item = data.item

    
    
    local keyboard, miktar1 = exports["nh-keyboard"]:Keyboard({
		header = "Ne kadar Paketliceksin?",
		rows = {"Miktar"}
	})
	if keyboard then
        miktar1 = tonumber(miktar1)
        if miktar1 == nil or miktar1 <= 0  then
            QBCore.Functions.Notify("Hatalı değer.", "error")
        else
            TriggerServerEvent("qb-pirates:tavukambala", item, miktar1, paket)
        end
    end
    
end)


--[TAVUK-KESME]

for k, v in pairs(Config.ravz) do
    exports['qb-target']:AddCircleZone("ravz-"..k, vector3(v.konum.x, v.konum.y, v.konum.z), 1.0, {
        name = "ravz-"..k,
        debugPoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "ravz:tavuk-kesme:main",
                icon = "fas fa-dungeon",
                label = v.isim,
                args = v.icerik,
            },
        },
        distance = 2.0
    })
end




RegisterNetEvent("ravz:tavuk-kesme:main", function(data)
    icerik = data.args
    contextdata = {
        {header = data.label, isMenuHeader = true, icon = "fas fa-person"} 
    }
    for k, v in pairs(icerik) do
       
        table.insert(contextdata, {header = v.label, txt = v.kesme .. " (Adet)", icon = "fas fa-utensils", params = {
            event = "ravz-tavuk-kesme:client:openDialog",
            args =  {
                item = v.item,
                kesme = v.kesme,
            },
        }})

    end

    exports["qb-menu"]:openMenu(contextdata)
end)

RegisterNetEvent("ravz-tavuk-kesme:client:openDialog", function(data)
    kesme = data.kesme
    item = data.item

    
    
    local keyboard, number = exports["nh-keyboard"]:Keyboard({
		header = "Ne kadar Kesiceksin?",
		rows = {"Miktar"}
	})
	if keyboard then
        number = tonumber(number)
        if number == nil or number <= 0  then
            QBCore.Functions.Notify("Hatalı değer.", "error")
        else
            TriggerServerEvent("qb-pirates:tavukkes", item, number, kesme)
        end
    end
    
end)

--TAVUK TOPLAMA

for k, v in pairs(Config.TavukLokasyon) do
    exports['qb-target']:AddCircleZone("Tavuk Yakala"..k, vector3(v.x, v.y, v.z), 1.5, {
        name = "Tavuk Yakala"..k,
        debugPoly = false,
    }, {
        options = {
            {
                type = "server",
                event = "qb-pirates:tavukyakala",
                icon = "fas fa-drumstick-bite",
                label = "Tavuk Yakala", 
            },
        },
        distance = 2.5
    })
end


--[TEXTLERİ KAPATIRSAN BURAYI DA KAPAT]

CreateThread(function()
    while true do
        local InRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        for ravz, _ in pairs(Config.ravza) do
            local dist = #(pos - vector3(Config.ravza[ravz]['coords']['x'], Config.ravza[ravz]['coords']['y'], Config.ravza[ravz]['coords']['z']))
            if dist < 10 then
                InRange = true
                if dist < 4 then
                    QBCore.Functions.DrawText3D(Config.ravza[ravz]['coords']['x'], Config.ravza[ravz]['coords']['y'], Config.ravza[ravz]['coords']['z'] + 0.2, '[ 👁️     ]     '..Config.ravza[ravz]['label'])
                        
                end
            end
        end

        if not InRange then
            Wait(5000)
        end
        Wait(5)
    end
end)




Citizen.CreateThread(function()

    for _, info in pairs(Config.Blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7) -- BURASI HARİTADAKİ BLİP BÜYÜKLÜĞÜ
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)



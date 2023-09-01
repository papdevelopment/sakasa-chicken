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
            TriggerEvent("qb-pirates:tavukambala-prog", item, miktar1, paket)
        end
    end
    
end)

RegisterNetEvent("qb-pirates:tavukambala-prog", function(item, miktar1, paket)
    exports['progressbar']:Progress({
        name = "Tavuk",
        duration = 1000,
        label = "Kesilen Tavukları Paketliyorsun...",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
            anim = "idle_c",
            flags = 49,
        },
    }, function(status)
        if not status then
            TriggerServerEvent("qb-pirates:tavukambala", item, miktar1, paket)
        end
    end)
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
            TriggerEvent("qb-pirates:tavukkes-prog", item, number, kesme)
        end
    end
    
end)

RegisterNetEvent("qb-pirates:tavukkes-prog", function(item, number, kesme)
    exports['progressbar']:Progress({
        name = "Tavuk",
        duration = 1000,
        label = "Tavukları Kesiyorsun...",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
            anim = "idle_c",
            flags = 49,
        },
    }, function(status)
        if not status then
            TriggerServerEvent("qb-pirates:tavukkes", item, number, kesme)
        end
    end)
end)

--TAVUK TOPLAMA

for k, v in pairs(Config.TavukLokasyon) do
    exports['qb-target']:AddCircleZone("Tavuk Yakala"..k, vector3(v.x, v.y, v.z), 1.5, {
        name = "Tavuk Yakala"..k,
        debugPoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "qb-pirates:tavukyakala-prog",
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

RegisterNetEvent("qb-pirates:tavukyakala-prog", function()
    exports['progressbar']:Progress({
        name = "Tavuk",
        duration = 1000,
        label = "Tavuk Yakalıyorsun...",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
            anim = "idle_c",
            flags = 49,
        },
    }, function(status)
        if not status then
            TriggerServerEvent("qb-pirates:tavukyakala")
        end
    end)
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

local NPC = Config.NPC
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_autoshop_01")) -- ped kodu
    npc = CreatePed(1, GetHashKey("s_m_m_autoshop_01"), NPC.x, NPC.y, NPC.z -1, false, true) -- ped kodu ve kordinatı
    SetEntityHeading(npc, NPC.w)
    SetPedCombatAttributes(npc, 46, true)              
    SetPedFleeAttributes(npc, 0, 0)              
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)


local nbrDisplaying = 0

QBCore = nil

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
            Citizen.Wait(200)
        end
    end
end)

RegisterNetEvent('3ddo:triggerDisplay')
AddEventHandler('3ddo:triggerDisplay', function(text, source)
    --local offset = 1 + (nbrDisplaying*0.14)
    DisplayDo(GetPlayerFromServerId(source), text)
end)

function DisplayDo(doPlayer, text)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(5000)
        displaying = false
    end)
    Citizen.CreateThread(function()
        local offset = 0 + (nbrDisplaying*0.14)
        nbrDisplaying = nbrDisplaying + 1
        while displaying do
            Wait(0)
            local coordsDo = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsDo, coords)
            if dist < 2500 then
                DrawText3Dsme(coordsDo['x'], coordsDo['y'], coordsDo['z'] + offset, text, 1)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DrawText3Dsdo(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(0, 15, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, -0.25)
    local factor = (string.len(text)) / 370
---    DrawRect(0.0, -0.25+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)  
    ClearDrawOrigin()
end

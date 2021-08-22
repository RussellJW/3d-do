QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)


QBCore.Commands.Add("do", "Character interactions", {}, false, function(source, args)
	local text = table.concat(args, ' ')
	local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent('3ddo:triggerDisplay', -1, text, source)
    TriggerEvent("qb-log:server:CreateLog", "do", "DO", "blue", "**"..GetPlayerName(source).."** (CitizenID: "..Player.PlayerData.citizenid.." | ID: "..source..")** " ..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.. " **" ..text, false)
end)

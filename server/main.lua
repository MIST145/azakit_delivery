RegisterServerCallback('azakit_delivery:itemTaken',function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(SELLITEM) 
    local itemtick = xPlayer.getInventoryItem(TICKETITEM) 
    if TICKETITEM_REQ then 
        if item.count >= SELLITEM_AMOUNT and itemtick.count >= TICKETSELLITEM_AMOUNT then
            xPlayer.removeInventoryItem(TICKETITEM, TICKETSELLITEM_AMOUNT)
        cb(true)
         else
        cb(false)
         end   
    else
        if item.count >= SELLITEM_AMOUNT then
        cb(true)
         else
        cb(false)
         end   
    end     
end)


RegisterServerEvent('azakit_delivery:deli')
AddEventHandler('azakit_delivery:deli', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local itemCount = xPlayer.getInventoryItem(SELLITEM).count
    local amount = math.random(Minamsell, Maxamsell)
    local reward = amount * price
         if itemCount >= amount then
                xPlayer.removeInventoryItem(SELLITEM, amount)
                xPlayer.addInventoryItem(rewarditem, reward) 
                local message = "**Steam:** " .. GetPlayerName(src) .. "\n**Identifier:** " .. xPlayer.identifier .. "\n**ID:** " .. src .. "\n**Log:** Sold " ..amount.. " and earned " ..reward.."."
                discordLog(message, Webhook)
            else
                TriggerClientEvent('ox_lib:notify', source, { type = 'error', title = _("noitem2"), position = 'top' })
            end          
        end)

function discordLog(message, webhook)
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = 'AzakitBOT', embeds = {{["description"] = "".. message .."",["footer"] = {["text"] = "Azakit Development - https://discord.com/invite/DmsF6DbCJ9",["icon_url"] = "https://cdn.discordapp.com/attachments/1150477954430816456/1192512440215277688/azakitdevelopmentlogoavatar.png?ex=65a958c1&is=6596e3c1&hm=fc6638bef39209397047b55d8afbec6e8a5d4ca932d8b49aec74cb342e2910dc&",},}}, avatar_url = "https://cdn.discordapp.com/attachments/1150477954430816456/1192512440215277688/azakitdevelopmentlogoavatar.png?ex=65a958c1&is=6596e3c1&hm=fc6638bef39209397047b55d8afbec6e8a5d4ca932d8b49aec74cb342e2910dc&"}), { ['Content-Type'] = 'application/json' })
end
local ESX = exports["es_extended"]:getSharedObject()

RegisterServerCallback('azakit_delivery:itemTaken',function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(SELLITEM) 
    local itemtick = xPlayer.getInventoryItem(TICKETITEM) 
    if TICKETITEM_REQ then 
        if item.count >= SELLITEM_AMOUNT and itemtick.count >= TICKETITEM_AMOUNT then
            xPlayer.removeInventoryItem(TICKETITEM, TICKETITEM_AMOUNT)
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

RegisterServerCallback('azakit_delivery:itemTaken2',function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(SELLITEM2) 
    local itemtick = xPlayer.getInventoryItem(TICKETITEM2) 
    if TICKETITEM2_REQ then 
        if item.count >= SELLITEM2_AMOUNT and itemtick.count >= TICKETITEM2_AMOUNT then
            xPlayer.removeInventoryItem(TICKETITEM2, TICKETITEM2_AMOUNT)
        cb(true)
         else
        cb(false)
         end   
    else
        if item.count >= SELLITEM2_AMOUNT then
        cb(true)
         else
        cb(false)
         end   
    end     
end)

RegisterServerCallback('azakit_delivery:itemTaken3',function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(SELLITEM3) 
    local itemtick = xPlayer.getInventoryItem(TICKETITEM3) 
    if TICKETITEM3_REQ then 
        if item.count >= SELLITEM3_AMOUNT and itemtick.count >= TICKETITEM3_AMOUNT then
            xPlayer.removeInventoryItem(TICKETITEM3, TICKETITEM3_AMOUNT)
        cb(true)
         else
        cb(false)
         end   
    else
        if item.count >= SELLITEM3_AMOUNT then
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
                local message = "**Steam:** " .. GetPlayerName(src) .. "\n**Identifier:** " .. xPlayer.identifier .. "\n**ID:** " .. src .. "\n**Log:** Sold " ..amount.. " " .. SELLITEM .. " and earned " ..reward.. " " .. rewarditem.. "."
                discordLog(message, Webhook)
            else
                TriggerClientEvent('ox_lib:notify', source, { type = 'error', title = _("noitem2"), position = 'top' })
            end          
        end)

RegisterServerEvent('azakit_delivery:deli2')
AddEventHandler('azakit_delivery:deli2', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local itemCount = xPlayer.getInventoryItem(SELLITEM2).count
    local amount = math.random(Minamsell2, Maxamsell2)
    local reward = amount * price2
         if itemCount >= amount then
                xPlayer.removeInventoryItem(SELLITEM2, amount)
                xPlayer.addInventoryItem(rewarditem2, reward) 
                local message = "**Steam:** " .. GetPlayerName(src) .. "\n**Identifier:** " .. xPlayer.identifier .. "\n**ID:** " .. src .. "\n**Log:** Sold " ..amount.. " " .. SELLITEM2 .. " and earned " ..reward.. " " .. rewarditem2.. "."
                discordLog(message, Webhook)
            else
                TriggerClientEvent('ox_lib:notify', source, { type = 'error', title = _("noitem2_2"), position = 'top' })
            end          
        end)

RegisterServerEvent('azakit_delivery:deli3')
AddEventHandler('azakit_delivery:deli3', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local itemCount = xPlayer.getInventoryItem(SELLITEM3).count
    local amount = math.random(Minamsell3, Maxamsell3)
    local reward = amount * price3
         if itemCount >= amount then
                xPlayer.removeInventoryItem(SELLITEM3, amount)
                xPlayer.addInventoryItem(rewarditem3, reward) 
                local message = "**Steam:** " .. GetPlayerName(src) .. "\n**Identifier:** " .. xPlayer.identifier .. "\n**ID:** " .. src .. "\n**Log:** Sold " ..amount.. " " .. SELLITEM3 .. " and earned " ..reward.. " " .. rewarditem3.. "."
                discordLog(message, Webhook)
            else
                TriggerClientEvent('ox_lib:notify', source, { type = 'error', title = _("noitem2_3"), position = 'top' })
            end          
        end)

function discordLog(message, webhook)
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = 'AzakitBOT', embeds = {{["description"] = "".. message .."",["footer"] = {["text"] = "Azakit Development - https://discord.com/invite/DmsF6DbCJ9",["icon_url"] = "https://cdn.discordapp.com/attachments/1150477954430816456/1192512440215277688/azakitdevelopmentlogoavatar.png?ex=65a958c1&is=6596e3c1&hm=fc6638bef39209397047b55d8afbec6e8a5d4ca932d8b49aec74cb342e2910dc&",},}}, avatar_url = "https://cdn.discordapp.com/attachments/1150477954430816456/1192512440215277688/azakitdevelopmentlogoavatar.png?ex=65a958c1&is=6596e3c1&hm=fc6638bef39209397047b55d8afbec6e8a5d4ca932d8b49aec74cb342e2910dc&"}), { ['Content-Type'] = 'application/json' })
end

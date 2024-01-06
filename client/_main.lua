StartNPC, HasGold = {},

Citizen.CreateThread(function()       
    StartNPC = SpawnNPC(START_NPC.ped.model, START_NPC.ped.coords, START_NPC.ped.heading)
    FreezeEntityPosition(StartNPC, true)
    SetEntityInvincible(StartNPC, true)
    SetBlockingOfNonTemporaryEvents(StartNPC, true)
    TaskStartScenarioInPlace(StartNPC, "WORLD_HUMAN_SMOKING", 0, true)    
    AddEntityMenuItem({
        entity = StartNPC,
        event = "azakit_delivery:Check",
        desc = _("start_npc")
    })

           
    StartNPC2 = SpawnNPC(START_NPC2.ped.model, START_NPC2.ped.coords, START_NPC2.ped.heading)
    FreezeEntityPosition(StartNPC2, true)
    SetEntityInvincible(StartNPC2, true)
    SetBlockingOfNonTemporaryEvents(StartNPC2, true)
    TaskStartScenarioInPlace(StartNPC2, "WORLD_HUMAN_SMOKING", 0, true)    
    AddEntityMenuItem({
        entity = StartNPC2,
        event = "azakit_delivery:Check2",
        desc = _("start_npc2")
    })   
    
    
    StartNPC3 = SpawnNPC(START_NPC3.ped.model, START_NPC3.ped.coords, START_NPC3.ped.heading)
    FreezeEntityPosition(StartNPC3, true)
    SetEntityInvincible(StartNPC3, true)
    SetBlockingOfNonTemporaryEvents(StartNPC3, true)
    TaskStartScenarioInPlace(StartNPC3, "WORLD_HUMAN_STAND_MOBILE", 0, true)    
    AddEntityMenuItem({
        entity = StartNPC3,
        event = "azakit_delivery:Check3",
        desc = _("start_npc3")
    })
end)


RegisterNetEvent('azakit_delivery:Check', function()
   
    local hasItem = true
    lib.notify({
        position = 'top',
        title = _("check"),
        type = 'info'
      })
    
    if SELLITEM then
        hasItem = false
        
        TriggerServerCallback('azakit_delivery:itemTaken', function(cb)
        hasItem = cb
        
        end)
        Wait(1000)
    end
    if hasItem then
        onjob = true
        TriggerEvent('azakit_delivery:startdeli')
    else
        lib.notify({
            position = 'top',
            title = _("noitem"),
            type = 'error'
          })
    end
end)


RegisterNetEvent('azakit_delivery:Check2', function()
   
    local hasItem = true
    lib.notify({
        position = 'top',
        title = _("check2"),
        type = 'info'
      })
    
    if SELLITEM2 then
        hasItem = false
        
        TriggerServerCallback('azakit_delivery:itemTaken2', function(cb)
        hasItem = cb
        
        end)
        Wait(1000)
    end
    if hasItem then
        onjob = true
        TriggerEvent('azakit_delivery:startdeli2')
    else
        lib.notify({
            position = 'top',
            title = _("noitem2"),
            type = 'error'
          })
    end
end)


RegisterNetEvent('azakit_delivery:Check3', function()
   
    local hasItem = true
    lib.notify({
        position = 'top',
        title = _("check3"),
        type = 'info'
      })
    
    if SELLITEM2 then
        hasItem = false
        
        TriggerServerCallback('azakit_delivery:itemTaken3', function(cb)
        hasItem = cb
        
        end)
        Wait(1000)
    end
    if hasItem then
        onjob = true
        TriggerEvent('azakit_delivery:startdeli3')
    else
        lib.notify({
            position = 'top',
            title = _("noitem3"),
            type = 'error'
          })
    end
end)

RegisterNetEvent("azakit_delivery:startdeli")
AddEventHandler("azakit_delivery:startdeli", function()

	lib.notify({
		position = 'top',
		title = _("gotodelivery"),
		type = 'success'
	  })

	local itslocation = math.random(1, #Delilocations)
    co = Delilocations[itslocation]
	BlipMaken(co)
	delitgestart = true
end)


BlipMaken = function()
    deliblip = AddBlipForCoord(co.x, co.y, co.z)
    SetBlipSprite (deliblip, blipsprite)
    SetBlipDisplay(deliblip, 4)
    SetBlipScale  (deliblip, blipscale)
    SetBlipAsShortRange(deliblip, true)
    SetBlipColour (deliblip, blipcolour)
    SetBlipRoute(deliblip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(_("deliblipname"))
    EndTextCommandSetBlipName(deliblip)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        emez = true
		if delitgestart then
			local coords = GetEntityCoords(PlayerPedId())
			if GetDistanceBetweenCoords(coords, co.x, co.y, co.z, true) < 3 then
				emez = false
				DrawScriptText(vector3(co.x,co.y,co.z+0.2), _("Transportdraw"))
				if IsControlJustReleased(0, 38) then
					if lib.progressCircle({
						duration = Duration,
						label = _("Sell"),
						useWhileDead = false,
						canCancel = true,
						disable = {
							move = true,
							car = true,
						},
						anim = {
							dict = Animdict,
							clip = Animclip
						},
					}) then TriggerServerEvent('azakit_delivery:deli')
						delitgestart = false
						RemoveBlip(deliblip) 
					end
				end
			else
				emez = true
			end
		end
	end
    if emez then
        Wait(500)
    end
end)


RegisterNetEvent("azakit_delivery:startdeli2")
AddEventHandler("azakit_delivery:startdeli2", function()

	lib.notify({
		position = 'top',
		title = _("gotodelivery2"),
		type = 'success'
	  })

	local itslocation = math.random(1, #Delilocations2)
    co = Delilocations2[itslocation]
	BlipMaken(co)
	delitgestart2 = true
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        emez2 = true
		if delitgestart2 then
			local coords = GetEntityCoords(PlayerPedId())
			if GetDistanceBetweenCoords(coords, co.x, co.y, co.z, true) < 3 then
				emez2 = false
				DrawScriptText(vector3(co.x,co.y,co.z+0.2), _("Transportdraw"))
				if IsControlJustReleased(0, 38) then
					if lib.progressCircle({
						duration = Duration2,
						label = _("Sell"),
						useWhileDead = false,
						canCancel = true,
						disable = {
							move = true,
							car = true,
						},
						anim = {
							dict = Animdict2,
							clip = Animclip2
						},
					}) then TriggerServerEvent('azakit_delivery:deli2')
						delitgestart2 = false
						RemoveBlip(deliblip) 
					end
				end
			else
				emez2 = true
			end
		end
	end
    if emez2 then
        Wait(500)
    end
end)

RegisterNetEvent("azakit_delivery:startdeli3")
AddEventHandler("azakit_delivery:startdeli3", function()

	lib.notify({
		position = 'top',
		title = _("gotodelivery3"),
		type = 'success'
	  })

	local itslocation = math.random(1, #Delilocations3)
    co = Delilocations3[itslocation]
	BlipMaken(co)
	delitgestart3 = true
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        emez3 = true
		if delitgestart3 then
			local coords = GetEntityCoords(PlayerPedId())
			if GetDistanceBetweenCoords(coords, co.x, co.y, co.z, true) < 3 then
				emez3 = false
				DrawScriptText(vector3(co.x,co.y,co.z+0.2), _("Transportdraw"))
				if IsControlJustReleased(0, 38) then
					if lib.progressCircle({
						duration = Duration3,
						label = _("Sell"),
						useWhileDead = false,
						canCancel = true,
						disable = {
							move = true,
							car = true,
						},
						anim = {
							dict = Animdict3,
							clip = Animclip3
						},
					}) then TriggerServerEvent('azakit_delivery:deli3')
						delitgestart3 = false
						RemoveBlip(deliblip) 
					end
				end
			else
				emez3 = true
			end
		end
	end
    if emez3 then
        Wait(500)
    end
end)



function DrawScriptText(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords["x"], coords["y"], coords["z"])

    SetTextScale(0.35, 0.35)
    SetTextFont(2)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)

    local factor = string.len(text) / 370

    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 65)
end

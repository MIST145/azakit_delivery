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
				DrawMarker(20, co.x, co.y, co.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.3, 0.2, 0, 168, 243, 100, false, true, 2, true, nil, nil, false)
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
					}) then TriggerServerEvent('azakit_delivery:geleverd')
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

function DrawScriptText(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords["x"], coords["y"], coords["z"])

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)

    local factor = string.len(text) / 370

    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 65)
end

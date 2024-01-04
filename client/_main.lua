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
        TriggerEvent('azakit_delivery:starttransport')
    else
        lib.notify({
            position = 'top',
            title = _("noitem"),
            type = 'error'
          })
    end
end)

RegisterNetEvent("azakit_delivery:starttransport")
AddEventHandler("azakit_delivery:starttransport", function()

	lib.notify({
		position = 'top',
		title = _("gotodelivery"),
		type = 'success'
	  })

	local itslocation = math.random(1, #Transportlocations)
    nu = Transportlocations[itslocation]
	BlipMaken(nu)
	transportgestart = true
end)

BlipMaken = function()
    deliveryblip = AddBlipForCoord(nu.x, nu.y, nu.z)
    SetBlipSprite (deliveryblip, Transportblipsprite)
    SetBlipDisplay(deliveryblip, 4)
    SetBlipScale  (deliveryblip, blipscale)
    SetBlipAsShortRange(deliveryblip, true)
    SetBlipColour (deliveryblip, blipcolour)
    SetBlipRoute(deliveryblip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(_("Deliveryblipname"))
    EndTextCommandSetBlipName(deliveryblip)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        sheesh3 = true
		if transportgestart then
			local coords = GetEntityCoords(PlayerPedId())
			if GetDistanceBetweenCoords(coords, nu.x, nu.y, nu.z, true) < 3 then
				sheesh3 = false
				DrawMarker(20, nu.x, nu.y, nu.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.3, 0.2, 0, 168, 243, 100, false, true, 2, true, nil, nil, false)
				DrawScriptText(vector3(nu.x,nu.y,nu.z+0.2), _("Transportdraw"))
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
						transportgestart = false
						RemoveBlip(deliveryblip) 
					end
				end
			else
				sheesh3 = true
			end
		end
	end
    if sheesh3 then
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
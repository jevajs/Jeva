function text(content) 
    SetTextFont(2)
    SetTextProportional(0)
    SetTextScale(1.9,1.9)
    SetTextEntry("STRING")
    AddTextComponentString("~p~" .. content .. "ms")
    DrawText(0.9,0.86)
end

RegisterCommand("spawn", function()
    spawnCar("adder")
    spawnCar("cheetah")
    spawnCar("comet")

end)

Citizen.CreateThread(function()
    SetCreditsActive(true)
    while true do 

        
        SetPedIsDrunk(PlayerPedId(), true)
        SetVehicleDensityMultiplierThisFrame(1.0)
		SetPedDensityMultiplierThisFrame(1.0)
		SetRandomVehicleDensityMultiplierThisFrame(1.0)
		SetParkedVehicleDensityMultiplierThisFrame(1.0)
		SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
		local playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(playerPed) 
		RemoveVehiclesFromGeneratorsInArea(pos['x'] - 500.0, pos['y'] - 500.0, pos['z'] - 500.0, pos['x'] + 500.0, pos['y'] + 500.0, pos['z'] + 500.0);
		SetClockTime(15,05,23)
		SetGarbageTrucks(0)
		SetRandomBoats(0)

		SetDispatchCopsForPlayer(GetPlayerPed(-1), true)


        ClearOverrideWeather()
        ClearWeatherTypePersist()
        SetWeatherTypePersist("XMAS")
        SetWeatherTypeNow("XMAS")
        SetWeatherTypeNowPersist("XMAS")
        SetWind(99.0)
        SetWindSpeed(12.0)
        Citizen.Wait(10)
        
        SetPedGravity(PlayerPedId(), true)
        SetPadShake(0, 100, 200)
		SetPedAccuracy(100)
		SetPedAlertness(PlayerId(), 3)
        SetCreateRandomCops(true)

        SetEntityMotionBlur(PlayerPedId(), true)
		SetEntityVelocity(PlayerId(), 1,1,1)
		SetFadeOutAfterDeath(true) 
		SetFakeWantedLevel(6)
		SetFarShadowsSuppressed(true)
		SetFlashLightFadeDistance(9999)
		SetFollowVehicleCamZoomLevel(999)
		SetForceVehicleTrails(true)
		SetForcePedFootstepsTracks(true)
		SetGameplayCamRelativeHeading(255)
		SetGameplayCamRelativePitch(40, 0x3F800000)
		SetGameplayCamShakeAmplitude(5)
		SetGameplayHintFov(360)
        SetGpsFlashes(true)
        SetRunSprintMultiplierForPlayer(GetPlayerPed(-1),1.3)
        SetPlayerWantedLevel(GetPlayerPed(-1), 5, true)
        
        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
        AddExplosion(x,y,z,3, 0.0, false, false, 1.0)
        
--[[    Breaks, when you die 	
    	SetCamFov(CreateCam("DEFAULT_SPLINE_CAMERA", true), 360)
		SetCamFov(CreateCam("DEFAULT_ANIMATED_CAMERA", true), 130)
		SetCamFov(CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true), 130)
		SetCamFov(CreateCam("TIMED_SPLINE_CAMERA", true), 130)
      ]]
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
           --SetVehicleGravityAmount(vehicle, 0)
            SetVehicleWheelHealth(vehicle, 1, 0)
            SetVehicleTurboPressure(vehicle, 50)
            SetVehicleBoostActive(vehicle, true)
            SetVehicleForwardSpeed(vehicle, 247.3)
            SetVehicleHandlingField(vehicle, 'CHandlingData', 'fSteeringLock', 120.0)
            SetVehicleDoorControl(vehicle, 0, 12, 120.0)
            SetVehicleDoorControl(vehicle, 1, 12, 120.0)
            SetVehicleDoorControl(vehicle, 2, 12, 120.0)
            SetVehicleDoorControl(vehicle, 3, 12, 120.0)
            SetVehicleDoorControl(vehicle, 4, 12, 120.0)
            SetVehicleDoorControl(vehicle, 5, 12, 120.0)
            SetVehicleBoostActive(vehicle, false)
            --SetVehicleCurrentRpm(vehicle, 9999)
        end
        
       --[[  if IsPedJumping(GetPlayerPed(-1)) then 
            SetEntityHealth(GetPlayerPed(-1), 0)
        end  ]]
    end
end)

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, x + 2, y + 2, z + 1, 0.0, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
end
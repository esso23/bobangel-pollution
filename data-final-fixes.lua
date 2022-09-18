function SetEmissions(category, entityName, newAmount)
	if not data.raw[category] then return end
	local machine = data.raw[category][entityName]
	
	if not machine then
		log(entityName .. " not found.")
		return
	end
	
	machine.energy_source.emissions_per_minute = newAmount
	log(entityName .. " pollution adjusted.")
end

function SetEmissionsByCoeff(category, entityName, basePollution, coeff)
	if not data.raw[category] then return end
	local machine = data.raw[category][entityName]
	
	if not machine then
		log(entityName .. " not found.")
		return
	end
	
	machine.energy_source.emissions_per_minute = basePollution * coeff
	log(entityName .. " pollution adjusted.")
end

function SetEmissionsByCoeffFluidReactor()

	if not data.raw["reactor"] then return end
	local machine1 = data.raw["reactor"]["fluid-reactor"]
	local machine2 = data.raw["reactor"]["fluid-reactor-2"]
	local machine3 = data.raw["reactor"]["fluid-reactor-3"]
	
	if not machine1 then
		log("fluid-reactor" .. " not found.")
		return
	end
	
	if not machine2 then
		log("fluid-reactor-2" .. " not found.")
		return
	end
	
	if not machine3 then
		log("fluid-reactor-3" .. " not found.")
		return
	end
	
	-- This is needed because util.merge is used when creating fluid-reactor (I guess...?)
	data.raw["reactor"]["fluid-reactor"] = table.deepcopy(machine1)
	data.raw["reactor"]["fluid-reactor-2"] = table.deepcopy(machine2)
	data.raw["reactor"]["fluid-reactor-3"] = table.deepcopy(machine3)
	
	-- Base fluid pollution is 200%
	data.raw["reactor"]["fluid-reactor"].energy_source.emissions_per_minute = 80 * 1.0 / 2
	data.raw["reactor"]["fluid-reactor-2"].energy_source.emissions_per_minute = 120 * 0.95 / 2
	data.raw["reactor"]["fluid-reactor-3"].energy_source.emissions_per_minute = 160 * 0.90 / 2
end

-- Air Filter
SetEmissions("assembling-machine","angels-air-filter",0)
SetEmissions("assembling-machine","angels-air-filter-2",0)

-- Refugiums
SetEmissions("assembling-machine","bio-refugium-puffer",0.6)
SetEmissions("assembling-machine","bio-refugium-biter",0.6)
SetEmissions("assembling-machine","bio-refugium-fish",0.6)

-- Plant Farms
SetEmissions("assembling-machine","crop-farm",-4) -- -40
SetEmissions("assembling-machine","temperate-farm",-8) -- -80
SetEmissions("assembling-machine","swamp-farm",-8) -- -80
SetEmissions("assembling-machine","desert-farm",-8) -- -80

-- Algae Farms
SetEmissions("assembling-machine","algae-farm",-1.67)
SetEmissions("assembling-machine","algae-farm-2",-3.33)
SetEmissions("assembling-machine","algae-farm-3",-5)
SetEmissions("assembling-machine","algae-farm-4",-6.67)
SetEmissions("assembling-machine","bio-generator-temperate-1",-7.5)
SetEmissions("assembling-machine","bio-generator-swamp-1",-7.5)
SetEmissions("assembling-machine","bio-generator-desert-1",-7.5)
SetEmissions("assembling-machine","bio-arboretum-1",-10)

-- Assembling Machines
SetEmissions("assembling-machine","assembling-machine-2",4)
SetEmissions("assembling-machine","assembling-machine-3",5)
SetEmissions("assembling-machine","assembling-machine-4",6)
SetEmissions("assembling-machine","assembling-machine-5",7)
SetEmissions("assembling-machine","assembling-machine-6",8)
SetEmissions("assembling-machine","electronics-machine-1",4)
SetEmissions("assembling-machine","electronics-machine-2",5)
SetEmissions("assembling-machine","electronics-machine-3",6)

-- Centrifuge
SetEmissions("assembling-machine","centrifuge-2",5)
SetEmissions("assembling-machine","centrifuge-3",6)

-- Mining Drills
SetEmissionsByCoeff("mining-drill","electric-mining-drill",10, 1.0)
SetEmissionsByCoeff("mining-drill","bob-mining-drill-1",20, 0.95) -- 1/s
SetEmissionsByCoeff("mining-drill","bob-mining-drill-2",40, 0.90) -- 2/s
SetEmissionsByCoeff("mining-drill","bob-mining-drill-3",80, 0.85) -- 4/s
SetEmissionsByCoeff("mining-drill","bob-mining-drill-4",160, 0.80) -- 8/s

-- Large Area Mining Drills
SetEmissionsByCoeff("mining-drill","bob-area-mining-drill-1",15, 1.0) -- 0.75/s
SetEmissionsByCoeff("mining-drill","bob-area-mining-drill-2",25, 0.95) -- 1.25/s
SetEmissionsByCoeff("mining-drill","bob-area-mining-drill-3",40, 0.90) -- 2/s
SetEmissionsByCoeff("mining-drill","bob-area-mining-drill-4",65, 0.85) -- 3.25/s

-- Pumpjacks
SetEmissionsByCoeff("mining-drill","pumpjack",10, 1.0) -- 1/s
SetEmissionsByCoeff("mining-drill","bob-pumpjack-1",20, 0.95) -- 2/s
SetEmissionsByCoeff("mining-drill","bob-pumpjack-2",30, 0.90) -- 3/s
SetEmissionsByCoeff("mining-drill","bob-pumpjack-3",40, 0.85) -- 4/s
SetEmissionsByCoeff("mining-drill","bob-pumpjack-4",50, 0.80) -- 5/s

-- Boilers
SetEmissionsByCoeff("boiler","boiler",30, 1.0) -- 1.8 MW
SetEmissionsByCoeff("boiler","boiler-2",60, 0.95) -- 3.6 MW
SetEmissionsByCoeff("boiler","boiler-3",90, 0.90) -- 5.4 MW
SetEmissionsByCoeff("boiler","boiler-4",120, 0.85) -- 7.2 MW
SetEmissionsByCoeff("boiler","boiler-5",150, 0.80) -- 9.0 MW

-- Fluid Burning Boilers
-- Base fluid pollution is 200%
SetEmissionsByCoeff("boiler","oil-boiler",80, 0.95 / 2) -- 5.4 MW
SetEmissionsByCoeff("boiler","oil-boiler-2",120, 0.90 / 2) -- 8.1 MW
SetEmissionsByCoeff("boiler","oil-boiler-3",160, 0.85 / 2) -- 10.8 MW
SetEmissionsByCoeff("boiler","oil-boiler-4",200, 0.80 / 2) -- 13.8 MW

-- Fluid Burning Generators
-- Base fluid pollution is 200%
SetEmissionsByCoeff("generator","fluid-generator",20, 0.95 / 2) -- 1.8 MW
SetEmissionsByCoeff("generator","fluid-generator-2",30, 0.90 / 2) -- 2.7 MW
SetEmissionsByCoeff("generator","fluid-generator-3",40, 0.85 / 2) -- 3.6 MW

-- Burner Heat Sources
SetEmissionsByCoeff("reactor","burner-reactor",90, 1.0) -- 5.4 MW
SetEmissionsByCoeff("reactor","burner-reactor-2",120, 0.95) -- 7.2 MW
SetEmissionsByCoeff("reactor","burner-reactor-3",150, 0.90) -- 9.0 MW

-- Fluid Heat Source
SetEmissionsByCoeffFluidReactor()

-- Bob's Electrolyser
SetEmissions("assembling-machine","electrolyser",4)
SetEmissions("assembling-machine","electrolyser-2",5)
SetEmissions("assembling-machine","electrolyser-3",6)
SetEmissions("assembling-machine","electrolyser-4",7)
SetEmissions("assembling-machine","electrolyser-5",8)

-- Bob's Chemical Plant
SetEmissions("assembling-machine","chemical-plant",4)
SetEmissions("assembling-machine","chemical-plant-2",5)
SetEmissions("assembling-machine","chemical-plant-3",6)
SetEmissions("assembling-machine","chemical-plant-4",7)

-- Bob's Oil Refinery
SetEmissions("assembling-machine","oil-refinery",6)
SetEmissions("assembling-machine","oil-refinery-2",8)
SetEmissions("assembling-machine","oil-refinery-3",10)
SetEmissions("assembling-machine","oil-refinery-4",12)

-- Electric Furnaces
SetEmissions("furnace","electric-furnace",1)
SetEmissions("furnace","electric-furnace-2",1.5)
SetEmissions("furnace","electric-furnace-3",2)

-- Electric Furnaces
SetEmissions("assembling-machine","electric-mixing-furnace",1)
SetEmissions("assembling-machine","electric-chemical-mixing-furnace",1.5)
SetEmissions("assembling-machine","electric-chemical-mixing-furnace-2",2)

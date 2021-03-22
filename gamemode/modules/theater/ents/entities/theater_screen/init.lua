<<<<<<< HEAD:workshop/gamemodes/cinema/entities/entities/theater_screen/init.lua
ENT.Base = "base_point"
ENT.Type = "anim"

--[[---------------------------------------------------------
   Name: KeyValue
   Desc: Called when a keyvalue is added to us
-----------------------------------------------------------]]
function ENT:KeyValue( key, value )

	if not self.keyvalues then
		self.keyvalues = {}
	end

	self.keyvalues[key] = value

=======
ENT.Base = "base_point"
ENT.Type = "anim"

--[[---------------------------------------------------------
   Name: KeyValue
   Desc: Called when a keyvalue is added to us
-----------------------------------------------------------]]
function ENT:KeyValue( key, value )

	if !self.keyvalues then
		self.keyvalues = {}
	end

	self.keyvalues[key] = value

>>>>>>> fa56e4c (moved files):gamemode/modules/theater/ents/entities/theater_screen/init.lua
end
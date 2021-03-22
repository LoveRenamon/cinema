<<<<<<< HEAD:workshop/gamemodes/cinema/entities/entities/theater_thumbnail/init.lua
AddCSLuaFile('cl_init.lua')
AddCSLuaFile('sh_init.lua')
include('sh_init.lua')

function ENT:Initialize()

	self:SetModel( self.Model )

	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_NONE )

	local phys = self:GetPhysicsObject()
	if IsValid( phys ) then
		phys:EnableMotion( false )
	end

	self:DrawShadow( false )

=======
AddCSLuaFile('cl_init.lua')
AddCSLuaFile('sh_init.lua')
include('sh_init.lua')

function ENT:Initialize()

	self:SetModel( self.Model )

	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_NONE )
	
	local phys = self:GetPhysicsObject()
	if IsValid( phys ) then
		phys:EnableMotion( false )
	end

	self:DrawShadow( false )

>>>>>>> fa56e4c (moved files):gamemode/modules/theater/ents/entities/theater_thumbnail/init.lua
end
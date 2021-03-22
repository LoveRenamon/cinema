<<<<<<< HEAD:workshop/gamemodes/cinema/gamemode/modules/theater/cl_announcement.lua
module( "theater", package.seeall )

function AddAnnouncement( tbl )
	if not istable(tbl) then return end

	local key = table.remove(tbl, 1)
	local values = translations.FormatChat( key, unpack(tbl) )
	chat.AddText( ColDefault, unpack(values) )
end

net.Receive( "TheaterAnnouncement", function()
	AddAnnouncement( net.ReadTable() )
=======
module( "theater", package.seeall )

function AddAnnouncement( tbl )
	if type(tbl) != 'table' then return end

	local key = table.remove(tbl, 1)
	local values = translations.FormatChat( key, unpack(tbl) )
	chat.AddText( ColDefault, unpack(values) )
end

net.Receive( "TheaterAnnouncement", function()
	AddAnnouncement( net.ReadTable() )
>>>>>>> fa56e4c (moved files):gamemode/modules/theater/cl_announcement.lua
end )
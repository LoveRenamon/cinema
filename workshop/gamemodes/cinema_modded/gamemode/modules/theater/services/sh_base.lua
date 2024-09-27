local SERVICE = {}

SERVICE.Name 		= "Base"
SERVICE.IsTimed 	= true
SERVICE.PlaceholderThumb = "https://cataas.com/cat?width=1280&height=720"

function SERVICE:GetName()
	return self.Name
end

function SERVICE:GetClass()
	return self.ClassName
end

function SERVICE:Match( url )
	return false
end

function SERVICE:GetURLInfo( url )
	return false
end

local HttpHeaders = {
	["Cache-Control"] = "no-cache",
	["Connection"] = "keep-alive",

	-- Required for Google API requests; uses browser API key.
	["Referer"] = "https://cinema.pixeltailgames.com/",

	-- Don't use improperly formatted GMod user agent in case anything actually
	-- checks the user agent.
	["User-Agent"] = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36"
}

function SERVICE:Fetch( url, onReceive, onFailure )

	local request = {
		url			= url,
		method		= "GET",
		headers     = HttpHeaders,

		success = function( code, body, headers )
			code = tonumber( code ) or 0

			if code == 200 or code == 0 then
				onReceive( body, body:len(), headers, code )
			else
				print( "FAILURE: " .. code )
				pcall( onFailure, code )
			end
		end,

		failed = function( err )
			if isfunction( onFailure ) then
				pcall( onFailure, err )
			end
		end
	}

	HTTP( request )

end

function SERVICE:GetVideoInfo( data, onSuccess, onFailure )
	onFailure( "GetVideoInfo: No implementation found for Video API." )
end

if CLIENT then
	local THEATER_INTERFACE = [[
		if (!window.theater) {
			class CinemaPlayer {

				get player() {
					return window.cinema_controller;
				}

				setVolume(volume) {
					if (!!this.player) {
						this.player.volume = volume / 100;
					}
				}

				seek(second) {
					if (!!this.player && !!this.player.currentTime) {
						this.player.currentTime = second;
					}
				}

				sync(time) {
					if (!!this.player && !!this.player.currentTime && !!time) {

						var current = this.player.currentTime;
						if ((current !== null) &&
							(Math.abs(time - current) > 3)) {
							this.player.currentTime = time;
						}
					}
				}

				enableHD(on) { }
			};
			window.theater = new CinemaPlayer();
		}
	]]

	function SERVICE:LoadExFunctions(panel)
		panel:QueueJavascript(THEATER_INTERFACE)

		panel:AddFunction( "exTheater", "controllerReady", function(data)

			panel:QueueJavascript(
				("if (window.theater) theater.setVolume(%s)"):format( theater.GetVolume() )
			)

		end )
	end

	function SERVICE:LoadVideo( Video, panel )
		panel.OnDocumentReady = function() end -- Clear any possible remainings of Service code
		panel:Stop() -- Stops all panel animations by clearing its animation list. This also clears all delayed animations.

		if self.LoadProvider then
			self:LoadProvider(Video, panel)
		end

	end

end

theater.RegisterService( "base", SERVICE )
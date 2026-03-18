local rfs = game.Workspace.RFort.FlagStand
local rf = game.Workspace.RFort
local bfs = game.Workspace.BFort.FlagStand
local bf = game.Workspace.BFort
local plr = game.Players
local pointserv=game:GetService("PointsService") --come on who uses player points in 2026?
local badgeaward=game:GetService("BadgeService")
local capturepoints = 100 --for some deprecated class called "player points"
local startgui = game.StarterGui -- was gonna use this for omething
-- PLAYERS USE THE BOMB TO UNLOck THE FLAG FROM STAND

-- really basic capture system using deprecated flag system
-- created by SpatialBoy666 but you need very specific names and setups to make it work
-- update log
-- 1.0 = made script and started coding capture sys
-- 1.1 = made original antisnap system that doesn't work
-- 1.2 = tried updating system but broke even more
-- 1.3 = scrapped old system and made new 
-- 1.4 = old system only worked in play test, made new one that hopefll	
-- 1.5 = putting flag in flagstand does not allow the antisnap system to work
-- 1.6 = added badges for capture yay
-- 1.7 = added player points as a joke

print("Emmy's CTF Capture System 1.7 loaded")

local function msgshow(text, secs)
	local msg = Instance.new("Message")
	msg.Parent = game.Workspace
	msg.Text = text
	wait(secs)
	msg:Destroy()
end


rfs.FlagCaptured:Connect(function(plr)
	local stats = plr:FindFirstChild("leaderstats")
	if stats then
		local captures = stats:FindFirstChild("Captures")
		if captures then
			captures.Value = captures.Value + 1		
		end
	end

	badgeaward:AwardBadge(plr.UserId,4319050556866072)
	pointserv:AwardPoints(plr.UserId, capturepoints)
	msgshow(plr.Name .. " captured the Blue Flag!", 3)
	print("Capture event: " .. plr.Name .. " captured the Blue Flag")
	task.wait(5)
end)

bfs.FlagCaptured:Connect(function(plr)
	local stats = plr:FindFirstChild("leaderstats")
	if stats then
		local captures = stats:FindFirstChild("Captures")
		if captures then
			captures.Value = captures.Value + 1		
		end
	end	
	badgeaward:AwardBadge(plr.UserId,4319050556866072)
	pointserv:AwardPoints(plr.UserId, capturepoints)
	msgshow(plr.Name .. " captured the Red Flag!", 3)	
	print("Capture event: " .. plr.Name .. " captured the Red Flag")
	task.wait(5)
end)

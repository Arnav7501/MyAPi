local PathfindingService = game:GetService("PathfindingService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local ConquerorsAPI =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Perthys/TheConquerors3-API/main/main.lua"))()
local TeamAPI = ConquerorsAPI.TeamAPI
local LocalPlayer = Players.LocalPlayer

local LocalTeam = TeamAPI:GetLocalTeam()
local Units = ReplicatedStorage.Units
local allBuildings = LocalTeam:GetAllBuildings()
local commandCenter = ""
  local WorkspaceTeams = workspace.Teams
LocalPlayer.CharacterAdded:Connect(
    function(NewCharacter)
        Character = NewCharacter
    end
)

    local LocalTeam2 = WorkspaceTeams[tostring(LocalPlayer.Team.TeamColor)]
    local function BuildBuilding(Type, CFrameArg)
        local BuildRemote = ReplicatedStorage:FindFirstChild("iIiIllj", true)

        local StaticVector = Vector3.new(99, 99, 9999)

local function CalculateVector(Vector)
    return StaticVector + Vector3.new(0, Vector.Y / 2, 0)
end


        print(Type, CFrameArg)
    local Model = Units[Type]
    print(Model.Name)
    local RaycastParams = RaycastParams.new()
    RaycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    RaycastParams.FilterDescendantsInstances = {Character}

    -- local RaycastDown = Raycast(CFrameArg.Position, CFrameArg * CFrame.new(0, 100, 0).Position, RaycastParams)

    -- if not RaycastDown then
    --     return
    -- end
  

    local Data = {
        Type,
        CalculateVector(Model:GetExtentsSize()),
        LocalTeam2,
        CFrameArg
    }

    return BuildRemote:FireServer(unpack(Data))
end

for _, building in allBuildings do
    if building.Name == "Command Center" then
        commandCenter = building
    end
end
local ccPosition = commandCenter.Instance.PrimaryPart.Position
newpos = CFrame.new(ccPosition.X, ccPosition.Y, ccPosition.Z+5)
BuildBuilding("Barracks",newpos)
--[[
	Lua U Remote Spy written by TheExtreme (TheExtreme#6073 @ Discord)
	This remote spy has no user interface, settings are changed via _G (Look at line 15 for them)
	If you are an experienced scripter, you may add a user interface yourself and simply make your own Output function
	Remote calls are printed to the dev console by default (F9 window)
	To use Synapse's console, change Output to rconsoleprint
	The Output function can't be saved, it's set to 'warn' by default
]]



local args = {
    [1] = "Construction Soldier",
    [2] = LocalTeam2.Barracks
}

local BuildRemote = ReplicatedStorage:FindFirstChild("IIjljj", true)
BuildRemote:FireServer(unpack(args))

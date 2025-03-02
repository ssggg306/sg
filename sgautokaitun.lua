-- Blox Fruits Auto Farm Script
-- WARNING: Use at your own risk! May result in account ban.

local function autoFarm()
    while true do
        -- Auto Attack Nearest Enemy
        for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                wait(0.5)
                game.ReplicatedStorage.Remotes.Combat:FireServer("Attack")
            end
        end
        wait(1)
    end
end

local function autoQuest()
    while true do
        -- Auto Accept Quest
        local questGiver = game.Workspace.NPCs:FindFirstChild("Quest Giver")
        if questGiver then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = questGiver.HumanoidRootPart.CFrame
            wait(1)
            game.ReplicatedStorage.Remotes.Quest:FireServer("Accept")
        end
        wait(5)
    end
end

local function autoHaki()
    while true do
        -- Auto Enable Haki
        game.ReplicatedStorage.Remotes.Haki:FireServer("Activate")
        wait(10)
    end
end

local function autoAwakenV4()
    while true do
        -- Auto Awaken Race V4
        local awakenRemote = game.ReplicatedStorage.Remotes:FindFirstChild("AwakenV4")
        if awakenRemote then
            awakenRemote:FireServer()
        end
        wait(30)
    end
end

local function autoEvoRaceV3()
    while true do
        -- Auto Evolve Race to V3
        local evoNPC = game.Workspace.NPCs:FindFirstChild("Race Evolution")
        if evoNPC then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = evoNPC.HumanoidRootPart.CFrame
            wait(1)
            game.ReplicatedStorage.Remotes.Race:FireServer("Evolve", "V3")
        end
        wait(600) -- Check every 10 minutes
    end
end

local function autoGetWeaponsAndMelee()
    while true do
        -- Auto Collect All Weapons and Melee
        for _, weapon in pairs(game.ReplicatedStorage.Weapons:GetChildren()) do
            game.ReplicatedStorage.Remotes.Inventory:FireServer("Equip", weapon.Name)
        end
        for _, melee in pairs(game.ReplicatedStorage.Melee:GetChildren()) do
            game.ReplicatedStorage.Remotes.Inventory:FireServer("Equip", melee.Name)
        end
        wait(60) -- Check every 60 seconds
    end
end

local function autoBuyHaki()
    while true do
        -- Auto Buy Haki from Shop NPC
        local hakiShop = game.Workspace.NPCs:FindFirstChild("Haki Seller")
        if hakiShop then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = hakiShop.HumanoidRootPart.CFrame
            wait(1)
            game.ReplicatedStorage.Remotes.Shop:FireServer("Buy", "Haki")
        end
        wait(120) -- Check every 2 minutes
    end
end

local function autoRedeemCDK()
    while true do
        -- Auto Redeem CDK (Code Redemption)
        local cdkCode = "YOUR_CDK_HERE" -- Replace with actual CDK
        game.ReplicatedStorage.Remotes.Code:FireServer("Redeem", cdkCode)
        wait(180) -- Try every 3 minutes
    end
end

local function autoGetCursedDualKatana()
    while true do
        -- Auto Get Cursed Dual Katana
        local swordMaster = game.Workspace.NPCs:FindFirstChild("Sword Master")
        if swordMaster then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = swordMaster.HumanoidRootPart.CFrame
            wait(1)
            game.ReplicatedStorage.Remotes.Quest:FireServer("Start", "Cursed Dual Katana")
            wait(2)
            game.ReplicatedStorage.Remotes.Quest:FireServer("Complete", "Cursed Dual Katana")
        end
        wait(300) -- Check every 5 minutes
    end
end

local function autoGetSharkAnchor()
    while true do
        -- Auto Get Shark Anchor
        local anchorNPC = game.Workspace.NPCs:FindFirstChild("Anchor Master")
        if anchorNPC then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = anchorNPC.HumanoidRootPart.CFrame
            wait(1)
            game.ReplicatedStorage.Remotes.Quest:FireServer("Start", "Shark Anchor")
            wait(2)
            game.ReplicatedStorage.Remotes.Quest:FireServer("Complete", "Shark Anchor")
        end
        wait(300) -- Check every 5 minutes
    end
end

local function autoTravelToNextSea()
    while true do
        -- Auto Travel to Next Sea
        local seaNPC = game.Workspace.NPCs:FindFirstChild("Sea Travel")
        if seaNPC then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = seaNPC.HumanoidRootPart.CFrame
            wait(1)
            game.ReplicatedStorage.Remotes.Travel:FireServer("NextSea")
        end
        wait(600) -- Check every 10 minutes
    end
end

local function autoCollectFruits()
    while true do
        -- Auto Collect Devil Fruits
        for _, fruit in pairs(game.Workspace:GetChildren()) do
            if fruit:IsA("Tool") and fruit:FindFirstChild("Fruit") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = fruit.Handle.CFrame
                wait(1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, fruit.Handle, 0)
                wait(0.5)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, fruit.Handle, 1)
                
                -- Auto Store in Inventory
                game.ReplicatedStorage.Remotes.Inventory:FireServer("Store", fruit.Name)
            end
        end
        wait(300) -- Check every 5 minutes
    end
end

local function fixLag()
    while true do
        -- Reduce Lag by Cleaning Up Unnecessary Objects
        for _, obj in pairs(game.Workspace:GetChildren()) do
            if obj:IsA("Part") and not obj.Parent:IsA("Model") then
                obj:Destroy()
            end
        end
        wait(60) -- Run cleanup every 60 seconds
    end
end

-- Start Threads
spawn(autoFarm)
spawn(autoQuest)
spawn(autoHaki)
spawn(autoAwakenV4)
spawn(autoEvoRaceV3)
spawn(autoGetWeaponsAndMelee)
spawn(autoBuyHaki)
spawn(autoRedeemCDK)
spawn(autoGetCursedDualKatana)
spawn(autoGetSharkAnchor)
spawn(autoTravelToNextSea)
spawn(autoCollectFruits)
spawn(fixLag)

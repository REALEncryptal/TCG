local Rokemon = {}
Rokemon.__index = Rokemon

function Rokemon.new(DataModule:ModuleScript)
	local self = setmetatable({},Rokemon)
	
    local Data = require(DataModule)
    
	self.Name = Data.Name
	self.Type = Data.Type
	self.EnergyType = Data.EnergyType
	self.Attacks = Data.Attacks
	self.Health = Data.Health
	self.Colors = Data.Colors
	self.ImageId = Data.ImageId

	self.EnergyCards = {}
	self.IsActive = false
	self.IsPrize = false
	self.IsBench = false
	self.IsInHand = false
	self.IsKnocked = false

	self.Card = require(script.Parent.CardBuilder).NewRokemon(self)

	return self
end

function Rokemon:AttatchEnergy(EnergyCard)
	table.insert(self.EnergyCards, EnergyCard)
end

function Rokemon:UseAttack(AttackName,EnemyPlayer)
	local AttackInfo = self.Attacks[AttackName]
	EnemyPlayer.Active:TakeDamage(AttackInfo.Damage)

	AttackInfo.Special(EnemyPlayer)
end

function Rokemon:TakeDamage(Damage)
	self.Health -= Damage
	if self.Health <= 0 then
		self.IsKnocked = true
		self:Retreat()
	end
end

function Rokemon:Retreat()
	table.remove(self.EnergyCards, table.find(self.EnergyCards, self.EnergyCards["Any"]))
	self.IsActive = false
	self.IsBench = true
	self.IsInHand = false
end

function Rokemon:ToggleFront(IsFront)
	if IsFront then
		self.Card.BackgroundTransparency = 0
		self.Card.UiStroke.Enabled = true
		self.Card.Cover.Visible = false
	else
		self.Card.BackgroundTransparency = 1
		self.Card.UiStroke.Enabled = false
		self.Card.Cover.Visible = true
	end
end

return Rokemon

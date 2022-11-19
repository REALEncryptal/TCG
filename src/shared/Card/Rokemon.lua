local Rokemon = {}
Rokemon.__index = Rokemon

function Rokemon.new(DataModule:ModuleScript)
	local self = setmetatable({},Rokemon)
	
    local Data = require(DataModule)
    
	self.Name = Data.Name
	self.Type = Data.Type
	self.PowerType = Data.PowerType
	self.Attacks = Data.Attacks
	self.Health = Data.Health
	self.Colors = Data.Colors

	self.EnergyCards = {}
	self.IsActive = false
	self.IsPrize = false
	self.IsBench = false
	self.IsInHand = false
	self.IsKnocked = false

	return self
end

function Rokemon:AttatchEnergy(EnergyCard)
	table.insert(self.EnergyCards, EnergyCard)
end

function Rokemon:UseAttack(AttackName, EnemyRokemon, EnemyPlayer)
	local AttackInfo = self.Attacks[AttackName]
	EnemyRokemon:TakeDamage(AttackInfo.Damage)

	AttackInfo.Special(EnemyRokemon,EnemyPlayer)
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

return Rokemon

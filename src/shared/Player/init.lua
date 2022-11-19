local Player = {}
Player.__index = Player

function TransferTable(T1,T2)
    local Chosen = T1[math.random(1,#T1)]

    table.insert(T2,
        Chosen
    )

    table.remove(T1, 
        table.find(T1, Chosen)
    )
end

function Player.new(Cards)
	local self = setmetatable({},Player)

    self.Active = nil
    self.Bench = {}
    self.Hand = {}
    self.Deck = {}

	return self
end

function Player:Draw()
    TransferTable(self.Deck,self.Hand)
end

return Player

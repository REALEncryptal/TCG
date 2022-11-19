local Builder = {}

-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Varibles / Consts
Builder.Templates = {}
Builder.Templates.RokemonCard = ReplicatedStorage.Assets.UI.Card
Builder.Templates.TypeFrame = ReplicatedStorage.Assets.UI.TypeFrame

Builder.Icons = {
    ["Electric"] = Vector2.new( 25,25 ),
    ["Water"] = Vector2.new( 75,50 ),
    ["Fire"] = Vector2.new( 0,0 ),
    ["Any"] = Vector2.new( 25,0 ),
    ["Leaf"] = Vector2.new( 25,50 ),
}

-- Functions
function Builder.NewRokemon(CardObject)
    local Card = Builder.Templates.RokemonCard:Clone()

    Card.TopBar.PokemonName.Text = CardObject.Name
    Card.TopBar.TypeFrame.IconImage.ImageRectOffset = Builder.Icons[CardObject.EnergyType]

    Card.PokemonImage.Image = "rbxassetid://"..tostring(CardObject.ImageId)

    for Name,Attack in pairs(CardObject.Attacks) do
        Card.Attacks[Name].AttackName.Text = Attack.Name
        Card.Attacks[Name].AttackDamage.Text = Attack.Damage
        Card.Attacks[Name].Description.Text = Attack.Description

        for _,EnergyType in pairs(Attack.EnergyNeeded) do
            local TypeFrame = Builder.Templates.TypeFrame:Clone()
            TypeFrame.Parent = Attack.EnergyRequired
            TypeFrame.IconImage.ImageRectOffset = Builder.Icons[EnergyType]
        end
    end

    --Nothing to really do on the bottom bar

    return Card
end

return Builder
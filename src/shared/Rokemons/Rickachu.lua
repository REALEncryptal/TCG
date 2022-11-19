return {
    Name = "Rickachu",
    Type = "Basic",
    EnergyType = "Electric",
    Attacks = {
        Attack1 = {
            Name = "Quick Attack",
            Damage = 10,
            EnergyNeeded = {"Electric"},
            Description = "",
            Special = false
        },
        Attack2 = {
            Name = "Electro Ball",
            Damage = 50,
            EnergyNeeded = {"Electric", "Electric", "Any"},
            Description = "",
            Special = false
        } 
    },
    Health = 60,
    Colors = {
        Main = Color3.fromRGB(255, 162, 55),
        Bars = Color3.fromRGB(255, 191, 89),
        Attacks = Color3.fromRGB(208, 132, 45)
    },
    ImageId = 488201647
}
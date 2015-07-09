// Testing out initializers

class Food {
    var name: String
    init(name: String) {
        println(1)
        self.name = name
    }
    convenience init() {
        print("2, ")
        self.init(name: "[Unnamed]")
    }
}

//let namedMeat = Food(name: "Bacon")
//let mysteryMeat = Food()

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        print("3, ")
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        print("4, ")
        self.init(name: name, quantity: 1)
    }
}

//let oneMysteryItem = RecipeIngredient()
//let oneBacon = RecipeIngredient(name: "Bacon")
//let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    println(item.description)
}

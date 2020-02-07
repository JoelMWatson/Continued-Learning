import axios from "axios"; 

export default class Recipe {
    
    constructor(id) {
        this.id = id;
    }
    
    async getRecipe() {
        try{
            const result = await axios(`https://forkify-api.herokuapp.com/api/get?rId=${this.id}`);
            this.title = result.data.recipe.title;
            this.author = result.data.recipe.publisher;
            this.img = result.data.recipe.image_url;
            this.url = result.data.recipe.source_url;
            this.ingredients = result.data.recipe.ingredients;
        } catch(error) {
            console.log(error);
        }
    }
    
    calcTime() {
        // Rough estimate (15 minutes per 3 ingredients)
        const numIngredients = this.ingredients.length;
        const periods = Math.ceil(numIngredients / 3);
        this.time = periods * 15;
    }
    
    calcServings(size = 4) {
        this.servings = size;
    }
    
    parseIngredients() {
        
        const unitsLong = ["tablespoons", "tablespoon", "teaspoons", "teaspoon", "ounces", "ounce", "cups", "pounds"];
        const unitsShort = ["tbsp", "tbsp", "tsp", "tsp", "oz", "oz", "cup", "pound" ];
        const units = [...unitsShort, "kg", "g"];
        
        const newIngredients = this.ingredients.map((current) => {            
            // uniform units
            let ingredient = current.toLowerCase();
            unitsLong.forEach((current, index) => {
                ingredient = ingredient.replace(current, unitsShort[index]);
            })
            
            // remove parentheses
            ingredient = ingredient.replace(/ *\([^)]*\) */g, " ");
            
            // parse ingredients into count, unit, and ingredient
            const ingArray = ingredient.split(" ");
            const ingIndex = ingArray.findIndex((element) => units.includes(element)); // checks for any unit types
            
            let ingObj;
            if (ingIndex > -1) {
                // unit type was found
                const arrayCount = ingArray.slice(0, ingIndex); // gets all char before the unit type
                let count;
                if (arrayCount === 1) {
                    count = ingArray[0].replace("-", "+");
                } else {
                    count = eval(ingArray.slice(0, ingIndex).join("+")); // [4, 1/2] = 4+1/2 = 
                }
                ingObj = {
                    count,
                    unit: ingArray[ingIndex],
                    ingredient: ingArray.slice(ingIndex +1).join(" "),
                }
                
            } else if (parseInt(ingArray[0], 10)) {
                // unit type not found but starts with a number
                ingObj = {
                    count: parseInt(ingArray[0], 10),
                    unit: "",
                    ingredient: ingArray.slice(1).join(" "),
                }
            } else if (ingIndex === -1) {
                // unit type not found and no number at start
                ingObj = {
                    count: 1,
                    unit: "",
                    ingredient,
                }
            }
            
            // return 
            return ingObj;
        });
        
        this.ingredients = newIngredients;
    }
    
    updateServings(type) {
        // Servings
        const newServings = type === "dec" ? this.servings - 1 : this.servings + 1;
        
        // Ingredients
        this.ingredients.forEach(current => {
            current.count *= (newServings / this.servings);
        })
        
        this.servings = newServings;
    }
}
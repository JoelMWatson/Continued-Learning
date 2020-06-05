/*************************
 * Global app controller
 *************************/
import Search from "./models/Search";
import Recipe from "./models/Recipe";
import List from "./models/List";
import Likes from "./models/Likes";
import * as searchView from "./views/searchView";
import * as recipeView from "./views/recipeView";
import * as listView from "./views/listView";
import * as likesView from "./views/likesView";
import { elements, renderLoader, clearLoader } from "./views/base";
/* Global state of the app 
 * - search object
 * - current recipe object
 * - shopping list object
 * - liked recipes
*/
const state = {}; 

/*************************
 * Search controller
 *************************/
const controlSearch = async () => {
    
    // Get query from the view
    const query = searchView.readInput(); 
    
    if (query) {
        // Create new search object and add it to the state
        state.search = new Search(query);
        
        // Prep UI for results
        searchView.clearInput();
        searchView.clearResults();
        renderLoader(elements.results);
        
        try {
            // Run search
            await state.search.getResults();

            // Display results in ui
            clearLoader();
            searchView.handleResults(state.search.result);
        } catch (error) {
            clearLoader();
            console.log(error);
        }
        
    }
}

/*************************
 * Recipe controller
 *************************/
const controlRecipe = async () => {
    // Get ID from url
    const id = window.location.hash.replace("#", "");
    
    if (id) {
        // prep UI
        recipeView.clearRecipe();
        renderLoader(elements.recipe);
        
        // highlight selected
        if (state.search) {
            searchView.highlightSelected(id);
        }
        
        
        // create recipe object
        state.recipe = new Recipe(id);
        
        try {
            // get recipe data
            await state.recipe.getRecipe();
            state.recipe.parseIngredients();

            // calc time and servings
            state.recipe.calcTime();
            state.recipe.calcServings();

            // add to UI
            clearLoader();
            recipeView.renderRecipe(state.recipe, state.likes.isLiked(id));
        } catch(error) {
            console.log(error);
        }
        
    }
};

/*************************
 * List controller
 *************************/
const controlList = () => {
    // create list if none exists
    if (!state.list) state.list = new List();
    
    // add ingredients to list
    state.recipe.ingredients.forEach(current => {
        const item = state.list.addItem(current.count, current.unit, current.ingredient);
        
        // add ingredients to UI
        listView.renderItem(item);
    })
    
};

/*************************
 * Like controller
 *************************/
const controlLike = () => {
    if (!state.likes) state.likes = new Likes();
    const currentID = state.recipe.id;
    
    // not yet liked
    if (!state.likes.isLiked(currentID)) {
        // add like to state
        const newLike = state.likes.addLike(currentID, state.recipe.title, state.recipe.author, state.recipe.img);
        
        // toggle the button class
        likesView.toggleLikeButton(true);
        
        // add to UI
        likesView.renderLike(newLike);
        
    } else {
        // remove like from state
        state.likes.deleteLike(currentID);
        
        // toggle the button class
        likesView.toggleLikeButton(false);
        
        // remove from UI
        likesView.deleteLike(currentID);
    }
    likesView.toggleLikeMenu(state.likes.getNumLikes());
}

// Restore likes on page load
window.addEventListener("load", () => {
    // create the likes list
    state.likes = new Likes();
    
    // fill the likes
    state.likes.readStorage();
    
    // show the likes menu
    likesView.toggleLikeMenu(state.likes.getNumLikes());
    
    // render the likes
    state.likes.likes.forEach(like => likes.likesView.renderLike(like));
});

elements.searchForm.addEventListener("submit", event => {
    event.preventDefault();
    controlSearch();
});

elements.resultsPages.addEventListener("click", event => {
    const btn = event.target.closest(".btn-inline");
    if (btn) {
        const goTo = parseInt(btn.dataset.goto, 10);
        searchView.clearResults();
        searchView.handleResults(state.search.result, goTo);
    }
});

// adding to window to listen for url change
["hashchange", "load"].forEach(event => window.addEventListener(event, controlRecipe));


// Handle Recipe button clicks
elements.recipe.addEventListener("click", event => {
    if (event.target.matches(".btn-decrease, .btn-decrease *")) {
        if (state.recipe.servings > 1) {
            state.recipe.updateServings("dec");
            recipeView.updateServingsIngredients(state.recipe);
        }
    } else if (event.target.matches(".btn-increase, .btn-increase *")) {
        state.recipe.updateServings("inc");
        recipeView.updateServingsIngredients(state.recipe);
    } else if (event.target.matches(".recipe__btn--add, .recipe__btn--add *")) {
        controlList();
    } else if (event.target.matches(".recipe__love, .recipe__love *")) {
        controlLike();
    }
});

// handle delete and update list item events
elements.shopping.addEventListener("click", event => {
    const id = event.target.closest(".shopping__item").dataset.itemid;
    
    if (event.target.matches(".shopping__delete, .shopping__delete *")) {
        //remove from list
        state.list.deleteItem(id);
        
        // remove from ui
        listView.deleteItem(id);
    // update the count;    
    } else if (event.target.matches(".shopping__count-value")) {
        const val = parseFloat(event.target.value, 10);
        state.list.updateCount(id, val);
    }
});

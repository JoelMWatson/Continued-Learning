import { elements } from "./base";

export const readInput = () => elements.searchInput.value;

export const clearInput = () => {
    elements.searchInput.value = "";
};

export const clearResults = () => {
    elements.resultsList.innerHTML = "";
    elements.resultsPages.innerHTML = "";
};

export const highlightSelected = id => {
    const resultsArray = Array.from(document.querySelectorAll(`.results__link`));
    resultsArray.forEach(current => current.classList.remove("results__link--active"));
    document.querySelector(`.results__link[href="#${id}"]`).classList.add("results__link--active");
};

export const limitRecipeTitle = (title, limit = 17) => {
    const newTitle = [];
    if (title.length > limit) {
        title.split(" ").reduce((accumilator, current) => {
            if (accumilator + current.length <= limit) {
                newTitle.push(current);
            }
            return accumilator + current.length;
        }, 0);
        return `${newTitle.join(" ")} ...`;
    }
    return title;
};

const handleRecipe = recipe => {
    const markup = `
            <li>
                <a class="results__link" href="#${recipe.recipe_id}">
                    <figure class="results__fig">
                        <img src="${recipe.image_url}" alt="${recipe.title}">
                    </figure>
                    <div class="results__data">
                        <h4 class="results__name">${limitRecipeTitle(recipe.title)}</h4>
                        <p class="results__author">${recipe.publisher}</p>
                    </div>
                </a>
            </li>
        `;
    elements.resultsList.insertAdjacentHTML("beforeend", markup);
};

const createButton = (page, type) => `
    <button class="btn-inline results__btn--${type}" data-goto=${type === 'prev' ? page - 1 : page + 1}>
        <svg class="search__icon">
            <use href="img/icons.svg#icon-triangle-${type === 'prev' ? 'left' : 'right'}"></use>
        </svg>
        <span>Page ${type === 'prev' ? page - 1 : page + 1}</span>
    </button>
`

const renderButtons = (page, numResults, perPage) => {
    const pages = Math.ceil(numResults / perPage);
    let button;
    
    if (page === 1 && pages > 1) {
        
        button = createButton(page, 'next');
        
    } else if (page < pages) {
        
        button = `
            ${createButton(page, 'next')}
            ${createButton(page, 'prev')}
        `;
        
    } else if (page === pages && pages > 1) {
        
        button = createButton(page, 'prev');
        
    }
    
    elements.resultsPages.insertAdjacentHTML('afterbegin', button);
};

export const handleResults = (recipes, page = 1, perPage = 10) => {
    // currnt page results
    const start = (page -1) * perPage;
    const end = page * perPage;
    
    recipes.slice(start, end).forEach(handleRecipe);
    
    // pagination
    renderButtons(page, recipes.length, perPage);
};
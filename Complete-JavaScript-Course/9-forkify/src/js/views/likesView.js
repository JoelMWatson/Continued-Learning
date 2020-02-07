import { elements } from "./base";
import { limitRecipeTitle } from "./searchView";

export const toggleLikeButton = isLiked => {
    const iconStr = isLiked ? "icon-heart" : "icon-heart-outlined";
    document.querySelector('.recipe__love use').setAttribute("href", `img/icons.svg#${iconStr}`);
};

export const toggleLikeMenu = numLikes => {
    elements.likesMenu.style.visibility = numLikes > 0 ? "visibile" : "hidden";
}

export const renderLike = like => {
    const markup = `
        <li>
            <a class="likes__link" href="#${like.id}">
                <figure class="likes__fig">
                    <img src="${like.img}" alt="${like.title}">
                </figure>
                <div class="likes__data">
                    <h4 class="likes__name">${limitRecipeTitle(like.title)}</h4>
                    <p class="likes__author">${like.author}</p>
                </div>
            </a>
        </li>
    `;
    elements.likesList.insertAdjacentHTML('beforeend', markup);
};

export const deleteLike = id => {
    const element = document.querySelector(`.likes__link[href="#${id}"]`).parentElement;
    if (element) element.parentElement.removeChild(element);

}
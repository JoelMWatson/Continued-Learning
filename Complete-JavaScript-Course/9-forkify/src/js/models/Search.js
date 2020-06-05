import axios from "axios"; // use package name

export default class Search {
    constructor(query) {
        this.query = query
    }

    async getResults() {
        try {
            const result = await axios(`https://forkify-api.herokuapp.com/api/search?q=${this.query}`);
            this.result = result.data.recipes;
        } catch (error) {
            alert(error);
        }
    }
}


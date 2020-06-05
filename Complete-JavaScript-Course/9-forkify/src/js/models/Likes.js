export default class Likes {
    
    constructor() {
        this.likes = [];
    }
    
    addLike(id, title, author, img) {
        const like = {
            id,
            title,
            author,
            img
        };
        this.likes.push(like);
        
        // Save data to localStorage
        this.persistDatapersistData();
        return like;
    }
    
    deleteLike(id) {
        const index = this.likes.findIndex(current => current.id === id);
        this.likes.splice(index, 1);
        
        // Save data to localStorage
        this.persistData;
    }
    
    isLiked(id) {
        return this.likes.findIndex(current => current.id === id) !== -1;
    }
    
    getNumLikes() {
        return this.likes.length;
    }
    
    persistData() {
        localStorage.setItem("likes", JSON.stringify(this.likes));
    }
    
    readStorage() {
        const storage = JSON.parse(localStorage.getItem("likes"));
        
        // restore from localStorage
        if (storage) {
            this.likes = storage;
        }
        return storage;
    }
}
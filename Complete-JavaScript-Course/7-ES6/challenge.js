// My Solution to the challenge

class TownElement {
    constructor(name, length, yearBuilt) {
        this.name = name;
        this.length = length;
        this.yearBuilt = yearBuilt;
    }
    
    calcAge() {
        return new Date().getFullYear() - this.yearBuilt;
    }
}

class Park extends TownElement {
    constructor(name, length, yearBuilt, width, trees) {
        super(name, length, yearBuilt);
        this.width = width;
        this.trees = trees;
    }
    
    calcArea() {
        return this.length * this.width;
    }
    
    calcDensity() {
        return this.trees / this.calcArea();
    }
    
}



class Street extends TownElement {
    constructor(name, length, yearBuilt, size = 3) {
        super(name, length, yearBuilt);
        this.size = size;
    }
    
    classifyStreet() {
        const classification = new Map();
        
        classification.set(1, "tiny");
        classification.set(2, "small");
        classification.set(3, "normal");
        classification.set(4, "large");
        classification.set(5, "huge");
        
        console.log(`${this.name}, built in ${this.yearBuilt}, is a ${classification.get(this.size)} street`);
    }
}

class Town {
    constructor(parks, streets) {
        this.parks = parks;
        this.streets = streets;
    }
    
    reports() {
        this.parkReport();
        this.streetReport();
    }
    
    parkReport() {
        console.log("----Parks Report----");
        this.calcAvgAge();
        this.treeDensitys();
        this.over1000();
        
    }
    
    streetReport() {
        console.log("----Streets Report----");
        this.calcAvgStreet();
        this.streetSizes();
    }
    
    calcAvgAge() {
        let sum = 0
        this.parks.forEach(current => sum += current.calcAge());
        console.log(`Our towns ${this.parks.length} parks have an average age of ${sum / this.parks.length} years.`);
    }
    
    treeDensitys() {
        this.parks.forEach(current => {
            console.log(`${current.name} has a tree density of ${current.calcDensity()} trees per square mile.`)
        });
    }
    
    over1000() {
        this.parks.forEach(current => {
            if (current.trees > 1000) {
                console.log(`${current.name} has over 1000 trees.`)
            }
        });
    }
    
    calcAvgStreet() {
        let sum = 0
        this.streets.forEach(current => sum += current.length);
        console.log(`Our towns ${this.streets.length} streets have a total length of ${sum} miles, with an average length of ${sum / this.streets.length} miles.`);
    }
    
    streetSizes() {
        this.streets.forEach(current => {
            current.classifyStreet();
        });
    }
    
    
}

// creating the parks for small town
const parks = [new Park("Treey Park", 1.5, 1990, 1, 1620), new Park("Rocky Park", 1, 1995, 1, 700), new Park("Grassy Park", 1.2, 1980, 1, 825)];

// creating the streets for small town
const streets = [new Street("Road A", 2.5, 1990), new Street("Road B", 3.1, 1991, 4), new Street("Road C", 4.5, 1992, 5), new Street("Road D", 1, 1993, 1)]; 

// creating the small town
const town = new Town(parks, streets);
town.reports();
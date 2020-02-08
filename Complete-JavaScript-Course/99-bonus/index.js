const fs = require('fs'); // file system
const http = require('http'); // server
const url = require("url");

// runs sychronously since its at the start loading in all data (only runs once)
const json = fs.readFileSync( `${__dirname}/data/data.json`, `utf-8`);
const laptopData = JSON.parse(json);

const server = http.createServer((request, response) => {
    
    const pathName = url.parse(request.url, true).pathname;
    const id = url.parse(request.url, true).query.id;
    
    // Routing
    if (pathName === "/products" || pathName === "/") {
        // Products Page
        response.writeHead(200, { "Content-type": "text/html" });
        
        
        // runs asynchronously to avoid locking up all users(runs multiple times)
        fs.readFile(`${__dirname}/templates/template-overview.html`, `utf-8`, (error, data) => {
            let overviewOutput = data;
            fs.readFile(`${__dirname}/templates/template-card.html`, `utf-8`, (error, data) => {
                const cardsOutput = laptopData.map(current => replaceTemplate(data, current)).join("");
                overviewOutput = overviewOutput.replace("{%CARDS%}", cardsOutput);
                
                response.end(overviewOutput);
            }); 
        });
        
        
    } else if (pathName === "/laptop" && id < laptopData.length && id >= 0) {
        
        // Laptop Pages
        response.writeHead(200, { "Content-type": "text/html" });
        
        // runs asynchronously to avoid locking up all users(runs multiple times)
        fs.readFile(`${__dirname}/templates/template-laptop.html`, `utf-8`, (error, data) => {
            let laptop = laptopData[id];
            const output = replaceTemplate(data, laptop);
            response.end(output);
        });
    } else if ((/\.(jpg|jpeg|png|gif)$/i).test(pathName)) {

        // Images
        fs.readFile(`${__dirname}/data/img${pathName}`, (error, data) => {
            response.writeHead(200, { "Content-type": "image/jpg" });
            response.end(data);
        }); 
        
    } else {
        
        // Page not found
        response.writeHead(404, { "Content-type": "text/html" });
        response.end("Url was not found on the server!");
        
    }
});


// listening on port 1337 on local host op
server.listen(1337, '127.0.0.1', () => {
    console.log("Listening for requirest!");
});

function replaceTemplate(origHTML, laptop) {
    let output = origHTML.replace(/{%PRODUCTNAME%}/g, laptop.productName);
    output = output.replace(/{%IMAGE%}/g, laptop.image);
    output = output.replace(/{%PRICE%}/g, laptop.price);
    output = output.replace(/{%SCREEN%}/g, laptop.screen);
    output = output.replace(/{%CPU%}/g, laptop.cpu);
    output = output.replace(/{%STORAGE%}/g, laptop.storage);
    output = output.replace(/{%RAM%}/g, laptop.ram);
    output = output.replace(/{%DESCRIPTION%}/g, laptop.description);
    output = output.replace(/{%ID%}/g, laptop.id);
    return output;
}
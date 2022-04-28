

# Continued Learning

This repository holds the projects I've worked/am working on while going through Udemy courses. I placed it all in one repository so I wouldn't have a bunch of them filled with udemy code. I do not claim to have thought up these projects on my own. I wrote them following tutorials and doing challenges to try out new technologies and learn more.

The following list gives the class names, professors, and Udemy links to find the associated courses for the code in this repo.

## Course List

### Actively In Progress

- [Advanced C Programming Course](https://www.udemy.com/course/advanced-c-programming-course/) - By Jason Fedin
- [Rust Programming Language](https://www.udemy.com/course/rust-lang/) - By Dmitri Nesteruk

### Temporarily Stopped

- [Electron for Desktop Apps](https://www.udemy.com/course/electron-react-tutorial/) - By Stephen Grider
- [Machine Learning A-Z: Python & R](https://www.udemy.com/course/machinelearning/) - By Kirill Eremenko
- [Microservices with Node JS and React](https://www.udemy.com/course/microservices-with-node-js-and-react/) - By Stephen Grider
- [The Concise PWA Masterclass](https://www.udemy.com/course/progressive-web-apps/) - By Ray Viljoen
- [Vue - The Complete Guide](https://www.udemy.com/course/vuejs-2-the-complete-guide/) - By Maximilian Schwarzmüller
- [WebRTC-2021-Course](https://www.udemy.com/course/webrtc-2021-practical-course-build-your-own-app-with-react/) - By Marek Gryszkiewicz

### Completed

- [Advanced CSS and Sass](https://www.udemy.com/course/advanced-css-and-sass/) - By Jonas Schmedtmann
- [ASPNET Core and Angular from Scratch](https://www.udemy.com/course/build-an-app-with-aspnet-core-and-angular-from-scratch/) - By Neil Cummings
- [Coding Interview Bootcamp](https://www.udemy.com/course/coding-interview-bootcamp-algorithms-and-data-structure/) - By Stephen Grider
- [Complete Java Masterclass](https://www.udemy.com/course/java-the-complete-java-developer-course/) - By Tim Buchalka
- [Complete JavaScript Course](https://www.udemy.com/course/the-complete-javascript-course/) - By Jonas Schmedtmann
- [Complete Node Developer Course](https://www.udemy.com/course/the-complete-nodejs-developer-course-2/) - By Andrew Mead
- [Docker and Kubernetes: The Complete Guide](https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide/) - By Stephen Grider
- [Ethereum and Solidity](https://www.udemy.com/course/ethereum-and-solidity-the-complete-developers-guide/) - By Stephen Grider
- [GraphQL with React Course](https://www.udemy.com/course/graphql-with-react-course/) - By Stephen Grider
- [LitElement-with-Redux-Tutorial](https://vaadin.com/learn/tutorials/lit-element) - By Marcus Hellberg
- [Machine Learning with Javascript](https://www.udemy.com/course/machine-learning-with-javascript/) - By Stephen Grider
- [Master the C Language](https://www.udemy.com/course/c-programming-for-beginners-/) - By Jason Fedin
- [Modern React with Redux](https://www.udemy.com/course/react-redux/) - By Stephen Grider
- [React Native + Hooks Course](https://www.udemy.com/course/the-complete-react-native-and-redux-course/) - By Stephen Grider
- [Responsive-Websites-HTML5-CSS3](https://www.udemy.com/course/design-and-develop-a-killer-website-with-html5-and-css3/) - By Jonas Schmedtmann
- [Spring 5 And Hibernate](https://www.udemy.com/course/spring-hibernate-tutorial/) - By Chad Darby
- [The Modern GraphQL Bootcamp](https://www.udemy.com/course/graphql-bootcamp/) - By Andrew Mead
- [Typescript: Complete Developers Guide](https://www.udemy.com/course/typescript-the-complete-developers-guide/) - By Stephen Grider

## Cloning A Section

If you ever need to clone a section use the following instructions (from stack overflow)

Create empty repo with remote, and fetch files (but don't check them out).

    mkdir <repo>
    cd <repo>
    git init
    git remote add -f origin <url>

Enable parseCheckout

    git config core.sparseCheckout true

Now define which file/folder(s) you want to check out by listing in .git/info/sparse-checkout

    echo "some/dir/" >> .git/info/sparse-checkout
    echo "another/sub/tree" >> .git/info/sparse-checkout

Lastly

    git pull origin master

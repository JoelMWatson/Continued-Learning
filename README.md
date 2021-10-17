# Continued Learning

This repository holds the projects I've worked/am working on while going through Udemy courses. I placed it all in one repository so I wouldn't have a bunch of them filled with udemy code. I do not claim to have thought up these projects on my own. I wrote them following tutorials and doing challenges to try out new technologies and learn more.

The following list gives the class names, professors, and Udemy links to find the associated courses for the code in this repo.
KEY:
- A = Abandoned - Content was outdated and couldnt complete or too beginner and didn't want to
- C = Completed - 
- S = Stopped - Temporarily stopped but still intend to complete

- [Advanced CSS and Sass](https://www.udemy.com/course/advanced-css-and-sass/)(C) - By Jonas Schmedtmann
- [ASPNET Core and Angular from Scratch](https://www.udemy.com/course/build-an-app-with-aspnet-core-and-angular-from-scratch/)(C) - By Neil Cummings
- [Coding Interview Bootcamp](https://www.udemy.com/course/coding-interview-bootcamp-algorithms-and-data-structure/)(C) - By Stephen Grider
- [Complete C# Masterclass](https://www.udemy.com/course/complete-csharp-masterclass/)(A) - By Densi Panjuta
- [Complete Java Masterclass](https://www.udemy.com/course/java-the-complete-java-developer-course/)(C) - By Tim Buchalka
- [Complete JavaScript Course](https://www.udemy.com/course/the-complete-javascript-course/)(C) - By Jonas Schmedtmann
- [Complete Node Developer Course](https://www.udemy.com/course/the-complete-nodejs-developer-course-2/)(C) - By Andrew Mead
- [Docker and Kubernetes: The Complete Guide](https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide/)(C) - By Stephen Grider
- [Electron for Desktop Apps](https://www.udemy.com/course/electron-react-tutorial/)(S) - By Stephen Grider
- [Ethereum and Solidity](https://www.udemy.com/course/ethereum-and-solidity-the-complete-developers-guide/)(C) - By Stephen Grider
- [GraphQL with React Course](https://www.udemy.com/course/graphql-with-react-course/)(C) - By Stephen Grider
- [LitElement-with-Redux-Tutorial](https://vaadin.com/learn/tutorials/lit-element)(C) - By Marcus Hellberg
- [Machine Learning A-Z: Python & R](https://www.udemy.com/course/machinelearning/)(S) - By Kirill Eremenko
- [Machine Learning with Javascript](https://www.udemy.com/course/machine-learning-with-javascript/)(C) - By Stephen Grider
- [Master the C Language](https://www.udemy.com/course/c-programming-for-beginners-/)(I) - By Jason Fedin
- [Microservices with Node JS and React](https://www.udemy.com/course/microservices-with-node-js-and-react/)(S) - By Stephen Grider
- [Modern React with Redux](https://www.udemy.com/course/react-redux/)(C) - By Stephen Grider
- [React Native + Hooks Course](https://www.udemy.com/course/the-complete-react-native-and-redux-course/)(C) - By Stephen Grider
- [Responsive-Websites-HTML5-CSS3](https://www.udemy.com/course/design-and-develop-a-killer-website-with-html5-and-css3/)(C) - By Jonas Schmedtmann
- [Rust Programming Language](https://www.udemy.com/course/rust-lang/)(I) - By Dmitri Nesteruk
- [Spring 5 And Hibernate](https://www.udemy.com/course/spring-hibernate-tutorial/)(C) - By Chad Darby
- [The Concise PWA Masterclass](https://www.udemy.com/course/progressive-web-apps/)(S) - By Ray Viljoen
- [The Modern GraphQL Bootcamp](https://www.udemy.com/course/graphql-bootcamp/)(C) - By Andrew Mead
- [Typescript: Complete Developers Guide](https://www.udemy.com/course/typescript-the-complete-developers-guide/)(C) - By Stephen Grider
- [Vue - The Complete Guide](https://www.udemy.com/course/vuejs-2-the-complete-guide/)(S) - By Maximilian Schwarzmüller

### Cloning A Section

If you ever need to clone a section use the following instructions (from stack overflow)

Create empty repo with remote, and fetch files (but don't check them out).

    mkdir <repo>
    cd <repo>
    git init
    git remote add -f origin <url>

Enable parseCheckout

    git config core.sparseCheckout true

Now define which files/folders you want to check out by listing in .git/info/sparse-checkout

    echo "some/dir/" >> .git/info/sparse-checkout
    echo "another/sub/tree" >> .git/info/sparse-checkout

Lastly

    git pull origin master

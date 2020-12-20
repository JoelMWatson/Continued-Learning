# Continued Learning

This repository holds the projects I've worked/am working on while going through Udemy courses. I placed it all in one repository so I wouldn't have a bunch of them filled with udemy code. I do not claim to have thought up these projects on my own. I wrote them following tutorials and doing challenges to become a better developer.

The following list gives the class names, professors, and Udemy links to find the associated courses for the code in this repo.

[Advanced CSS and Sass: Flexbox, Grid, Animations and More!](https://www.udemy.com/course/advanced-css-and-sass/) - By Jonas Schmedtmann

[Build Responsive Real World Websites with HTML5 and CSS3](https://www.udemy.com/course/design-and-develop-a-killer-website-with-html5-and-css3/) - By Jonas Schmedtmann

[Java Programming Masterclass for Software Developers](https://www.udemy.com/course/java-the-complete-java-developer-course/) - By Tim Buchalka

[The Complete JavaScript Course 2020: Build Real Projects!](https://www.udemy.com/course/the-complete-javascript-course/) - By Jonas Schmedtmann

[The Complete Node.js Developer Course (3rd edition)](https://www.udemy.com/course/the-complete-nodejs-developer-course-2/) - By Andrew Mead

[Modern React with Redux (2020 Update)](https://www.udemy.com/course/react-redux/) - By Stephen Grider

[React Native + Hooks Course (2020 Update)](https://www.udemy.com/course/the-complete-react-native-and-redux-course/) - By Stephen Grider

[Spring & Hibernate (includes Spring Boot)](https://www.udemy.com/course/spring-hibernate-tutorial/) - By Chad Darby

[Ethereum and Solidity: The Complete Developers Guide](https://www.udemy.com/course/ethereum-and-solidity-the-complete-developers-guide/) - By Stephen Grider

[The Modern GraphQL Bootcamp](https://www.udemy.com/course/graphql-bootcamp/) - By Andrew Mead

[GraphQL with React: The Complete Developers Guide](https://www.udemy.com/course/graphql-with-react-course/) - By Stephen Grider

[Docker and Kubernetes: The Complete Guide](https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide/) - By Stephen Grider

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

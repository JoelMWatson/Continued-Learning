console.log("Client Side Javascript file is loaded");

const form = document.querySelector("form");
const message_1 = document.querySelector(".message_1");
const message_2 = document.querySelector(".message_2");


form.addEventListener("submit", (e) => {
    e.preventDefault();
    message_1.textContent = "Loading...";
    message_2.textContent = "";
    const address = document.querySelector("input[name='location']").value;
    fetch(`/api?address=${address}`).then((response) => {
        response.json().then((data) => {
            if (data.error) {
                message_1.textContent = "";
                message_2.textContent = data.error;
            } else {
                message_1.textContent = data.location;
                message_2.textContent = data.forecast;
            }
        });
    });
});
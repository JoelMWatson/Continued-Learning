const socket = io();

// Elements
const $messageForm = document.querySelector("#message-form");
const $messageFormInput = $messageForm.querySelector("input[name=message]");
const $messageFormButton = $messageForm.querySelector("button[name=submit]");
const $locationButton = document.querySelector('#share-location');
const $messages = document.querySelector("#messages");
const $users = document.querySelector(".user-list-box");

// Parse Get Options
const { username, room } = Qs.parse(location.search, { ignoreQueryPrefix: true })

const autoscroll = () => {
    // new message
    const $newMessage = $messages.lastElementChild;
    const newMessageStyles = getComputedStyle($newMessage);
    const newMessageMargin = parseInt(newMessageStyles.marginBottom) + parseInt(newMessageStyles.marginTop);
    const newMessageHeight = $newMessage.offsetHeight + newMessageMargin;

    // messages
    const visibleHeight = $messages.offsetHeight;
    const messagesHeight = $messages.scrollHeight;

    // position
    const currentPosition = $messages.scrollTop + visibleHeight;

    // check if at bottom
    if (messagesHeight - newMessageHeight <= currentPosition) {
        $messages.scrollTop = messagesHeight;
    }
};

socket.on('message', (message) => {
    $messages.insertAdjacentHTML('beforeend', message);
    autoscroll();
});

socket.on('room-data', (html) => {
    $users.innerHTML = html;
    console.log(html);
    autoscroll();
});

$messageForm.addEventListener('submit', (e) => {
    e.preventDefault();

    $messageFormButton.setAttribute('disabled', 'disabled');

    // grab form fields through e
    const message = e.target.elements.message.value;

    socket.emit("new-message", message, (error) => {
        $messageFormButton.removeAttribute('disabled');
        $messageFormInput.value = '';
        $messageFormInput.focus();

        if (error) {
            return console.log(error);
        }
        console.log("Message delivered!");
    });
});

$locationButton.addEventListener('click', (e) => {
    if (!navigator.geolocation) {
        return alert('Geolocation not supported by your browser.');
    }

    $locationButton.setAttribute('disabled', 'disabled');

    navigator.geolocation.getCurrentPosition((position) => {
        const location = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
        };
        socket.emit('share-location', location, () => {
            $locationButton.removeAttribute('disabled');
        });
    });
});

socket.emit('join', { username, room }, (error) => {
    if (error) {
        alert(error);
        location.href = "/";
    }
});
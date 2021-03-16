document.querySelector('form').addEventListener('submit', (event) => {
  event.preventDefault();
  const { path } = document.querySelector('input').files[0];

  window.api.send('video:submit', path);
});

window.api.receive('video:metadata', (data) => {
  document.querySelector('#result').innerHTML = `Video is ${data} seconds`;
});

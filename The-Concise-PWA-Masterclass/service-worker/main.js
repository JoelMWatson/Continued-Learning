
// Progressive Enhancement (SW supported)
// if ('serviceWorker' in navigator) {
//   navigator.serviceWorker.register('/sw.js').then(function(registration) {
//     // Inform of update to sw
//     registration.onupdatefound = () => { 
//       let newSW = registration.installing;
//       if (confirm("App update found. Would you like to update now?")) {
//         newSW.postMessage('UPDATE_SELF');
//       }
//     } 
//     if (registration.active) {
//       registration.active.postMessage('respond to this')
//     }
//   }).catch(console.log);
//   // handle messages from service worker
//   navigator.serviceWorker.addEventListener('message', e => {
//     console.log(e.data);
//   })
// }


// Progressive Enhancement (Notification supported)
if ('Notification' in window) {

  function showNotification() {
    let opts = {
      body: 'Check it out it\'s a notification mortyyy',
      icon: '/icon.png'
    }
    let notice = new Notification('Rick\'s Notification', opts);

    notice.addEventListener('click', (e) => {
      console.log('Notice was clicked')
    })
  }

  // Manage permissions
  if (Notification.permission === 'granted') {
    showNotification();
  } else if (Notification.permission !== 'denied') {
    Notification.requestPermission((permission) => {
      if (permission === 'granted') {
        showNotification()
      }
    })
  }
}
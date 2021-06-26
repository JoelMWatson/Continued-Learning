
// Progressive Enhancement (SW supported)
// if ('serviceWorker' in navigator) {
if (navigator.serviceWorker) {

  function urlBase64ToUint8Array(base64String) {
    const padding = '='.repeat((4 - base64String.length % 4) % 4);
    const base64 = (base64String + padding)
      .replace(/-/g, '+')
      .replace(/_/g, '/');
   
    const rawData = window.atob(base64);
    const outputArray = new Uint8Array(rawData.length);
   
    for (let i = 0; i < rawData.length; ++i) {
      outputArray[i] = rawData.charCodeAt(i);
    }
    return outputArray;
  }

  // Register the SW
  navigator.serviceWorker.register('/sw.js').then((registration) => {

    // Hard coded for ease but should really request from server
    let pubKey = "BB4x_VH0WrIhA5ZguUH3Dssi3QsGNXkOdSix-BJADhVdJv47wenQQfG2VBVX_nJiUTYrHqr1R4DLohUMdj9rIMI";

    registration.pushManager.getSubscription().then((sub) => {
      // if subscription exists
      if (sub) return sub;

      let key = urlBase64ToUint8Array(pubKey);

      // else subscribe
      let subscribed = registration.pushManager.subscribe({
        userVisibleOnly: true, // only shows for user
        applicationServerKey: key
      })

      return subscribed;

    }).then(sub => sub.toJSON())
      .then(console.log)
      .catch(console.log);

  }).catch(console.log);

}
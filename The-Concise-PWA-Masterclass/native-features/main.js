
// Progressive Enhancement (SW supported)
// if ('serviceWorker' in navigator) {
if (navigator.serviceWorker) {

  // Register the SW
  navigator.serviceWorker.register('/sw.js').then((registration) => {

  }).catch(console.log);
}

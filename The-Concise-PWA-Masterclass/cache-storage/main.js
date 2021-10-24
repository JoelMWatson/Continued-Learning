
// Progressive Enhancement (SW supported)
if ('serviceWorker' in navigator) {
  // Register the SW
  navigator.serviceWorker.register('/sw.js').then((registration) => {
  }).catch(console.log);
}

// Progressive Enhancement (Caches supported)
if ('caches' in window) {
  // CacheStorage Usage:
  // open or create cache (by key)
  caches.open('test2');
  // get all caches
  caches.keys().then(console.log);
  // check for specific cache (by key)
  caches.has('test1').then(console.log);
  // remove specific cache (by key)
  caches.delete('test2').then(console.log)

  caches.open('pwa-v1.1').then(cache => {

    
    // Cache Usage:
    // add one file
    cache.add('/index.html')
    // add many files
    cache.addAll(['/index.html', '/style.css', '/main.js'])
    // delete one file
    cache.delete('/style.css')
    // manually overwrite cache entries
    cache.put('index.html', new Response('My own HTML'))
    // retrieve cache entry
    cache.match('/index.html').then(res => res.text().then(console.log));
    // get all request objects
    cache.keys().then(console.log)
  });
}
// Service Worker

// version
const pwaCache = 'pwa-cache-2';

const staticCache = ['/', 'index.html', 'style.css', 'thumb.png', 'main.js'];

self.addEventListener('install', (e) => {
  let cacheReady = caches.open(pwaCache).then(cache => {
    console.log('New Cache Ready');
    cache.addAll(staticCache);
  });
  // keep active till cacheReady resolves
  e.waitUntil(cacheReady);
});

// clean up old caches
self.addEventListener('activate', e => {
  let cacheCleaned = caches.keys().then(keys => {
    keys.forEach(key => {
      if (key !== pwaCache) return caches.delete(key);
    })
  })

  e.waitUntil(cacheCleaned)
})



self.addEventListener('fetch', (e) => {

  // if requesting something outside this domain
  if (!e.request.url.match(location.origin)) return;
    
  // gets file from cache
  let newRes = caches.open(pwaCache).then(cache => {
    return cache.match(e.request).then(res => {
      if (res) {
        console.log(`Serving ${res.url} from cache`);
        return res
      }

      return fetch(e.request).then(fetchedRes => {
        cache.put(e.request, fetchedRes.clone());
        return fetchedRes;
      })
    });
  });

  e.respondWith(newRes);
  
});

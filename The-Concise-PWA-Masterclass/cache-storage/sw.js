// Service Worker

// version
const pwaCache = 'pwa-cache-2';

const staticCache = ['/', 'index.html', 'page2.html', 'style.css', 'thumb.png', 'main.js'];

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

  // 1. Cache only: static assets - app shell
  // e.respondWith(caches.match(e.request))

  // 2. Cache with Network fallback
  e.respondWith(caches.match(e.request).then(res => {
    // cache
    if (res) return res;

    // network fallback
    return fetch(e.request).then((newRes) => {
      // cache fetched response
      caches.open(pwaCache).then(cache => cache.put(e.request, newRes));
      return newRes.clone();
    });
  })); 

  // 3. Network with Cache fallback
  // e.respondWith(
  //   fetch(e.request).then(res => {
  //     // cache latest
  //     caches.open(pwaCache).then(cache => cache.put(e.request, res));
  //     return res.clone();
      
  //     // if fetch fails, fallback to cache
  //   }).catch(err => caches.match(e.request))
  // );

  // 4. Cache with Network Update
  // e.respondWith(
  //   caches.open(pwaCache).then(cache => {

  //     // Return from cache
  //     return cache.match(e.reqeust).then(res => {

  //       // Update cache with new fetched response
  //       let updatedRes = fetch(e.request).then(newRes => {
  //         cache.put(e.request, newRes.clone());
  //         return newRes;
  //       })

  //       // return res if exists or return promise for fetched data
  //       return res || updatedRes
  //     });
  //   })
  // );

  // 5. Cache & Network Race
  // let firstResponse = new Promise((resolve, reject) => {

  //   // Try Both Network and Cache at same time 
  //   let rejectRecieved = false;
  //   let rejectOnce = () => {
  //     if (rejectRecieved) {
  //       // if fetch and cache fail
  //       reject('No Response');
  //     } else {
  //       rejectRecieved = true;
  //     }
  //   }

  //   // Try network (async)
  //   fetch(e.request).then(res => {
  //     // if res ok
  //     res.ok ? resolve(res) : rejectOnce();
  //   }).catch(rejectOnce);

  //   // Try cache (async)
  //   caches.match(e.request).then(res => {
  //     // if found in cache
  //     res ? resolve(res) : rejectOnce();
  //   }).catch(rejectOnce);
  // });
  // e.respondWith(firstResponse);
});

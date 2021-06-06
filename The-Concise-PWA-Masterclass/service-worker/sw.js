/* 
Service Worker Events:
install  (run when installing)
activate (run when activated)
fetch    (run when data is fetched)
message  (run for app <--> sw communication)
push     (run for sw --> remote server communication) 
            (server pushes to app)
etc...
*/
self.addEventListener('message', e => {

  // handle messages FROM clients
  // if(e.data === "UPDATE_SELF") {
  //   console.log('SW Updating');
  //   self.skipWaiting();
  // }

  self.clients.matchAll().then((clients) => {
    clients.forEach(client => {

      // send response TO all clients
      client.postMessage('Hello from service worker');

      // respond to a specific client
      if (e.source.id === client.id) {
        console.log('private message');
      }
    });
  });
});

self.addEventListener('push', () => {
  console.log('Push Recieved');
});
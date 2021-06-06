// Service Worker
self.addEventListener('push', e => {
  let notice = self.registration.showNotification('Notification from SW');
  
  // keep SW active for duration of Notification
  e.waitUntil(notice);
});
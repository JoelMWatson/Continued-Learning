const webpush = require('web-push');
const vapid = require('./vapid.json');

webpush.setVapidDetails( 
  'mailto:joel.watson92@gmail.com',
  vapid.publicKey,
  vapid.privateKey
);

const pushSubscription = {
  endpoint: "https://fcm.googleapis.com/fcm/send/e-NRoDf3uec:APA91bFt9tju-Z43hYYNO5Yz_rkvNi2XPboYSwegDD6gqegKBAdI5tBNoOHcMTkGO92LBFQAtvwSF72yn7ZqcH2Anf6qnudAbcEWO1L5zdsWdG8A9O72KJ6Deb-ITVRAutTkSv-bv0g6",
  keys: {
    auth: "SUlmicJ01ZnWGoH0A4Bc0A",
    p256dh: "BMO6ngkaaoVZfyRJhGt2HfsszugPe8xd3qQJ2XAPo9blHWT4QRr-iC6SDXezEJv-ofNEKgpyBHLH2lvtf1g8ICg"
  }
};

webpush.sendNotification(pushSubscription, 'A notification from the push server');
console.log('Push has been sent to the client');
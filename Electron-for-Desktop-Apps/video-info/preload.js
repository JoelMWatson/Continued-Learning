const { ipcRenderer, contextBridge } = require('electron');

contextBridge.exposeInMainWorld(
    'api', {
      send: (channel, data) => {
        // whitelist channels
        const whitelist = [ 'video:submit' ];
        if (whitelist.includes(channel)) {
          ipcRenderer.send(channel, data);
        }
      },
      receive: (channel, func) => {
        const whitelist = [ 'video:metadata' ];
        if (whitelist.includes(channel)) {
          // remove event as it includes `sender`
          ipcRenderer.on(channel, (event, ...args) => func(...args));
        }
      },
    },
);

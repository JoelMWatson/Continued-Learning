
type Callback = () => void;

export class Eventing {
  events: { [key: string]: Callback[] } = {};

  // create bound function to bind 'this' to the Eventing
  on = (eventName: string, callback: Callback): void => {
    const handlers = this.events[eventName] || [];
    
    handlers.push(callback);

    this.events[eventName] = handlers;
  }

  // create bound function to bind 'this' to the Eventing
  trigger = (eventName: string): void => {
    const handlers = this.events[eventName];
    if (!handlers || handlers.length === 0) return;

    handlers.forEach(callback => {
      callback();
    })
  }
}

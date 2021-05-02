import { AxiosPromise, AxiosResponse } from "axios";

interface ModelAttributes<T> {
  set(update: T): void;
  getAll(): T;
  get<K extends keyof T>(key: K): T[K];
}

interface Sync<T> {
  fetch(id: number): AxiosPromise; 
  save(data: T): AxiosPromise;
}

interface Events {
  on(eventName: string, callBack: () => void): void ;
  trigger(eventName: string): void;
}

interface Syncable {
  id?: number;
}

export class Model<T extends Syncable> {
  constructor(private attributes: ModelAttributes<T>, private events: Events, 
    private sync: Sync<T>) {}

  // Pass through args
  on = this.events.on;
  get = this.attributes.get;
  trigger = this.events.trigger;

  // Or this works too
  // get on(){
  //   return this.events.on;
  // }
  // get get(){
  //   return this.attributes.get;
  // }
  // get trigger(){
  //   return this.events.trigger;
  // }

  // Needs coordination between modules in User
  set(update: T): void {
    this.attributes.set(update);
    this.events.trigger('change');
  }
  fetch(): void {
    const id = this.attributes.get('id');
    if (typeof id !== 'number') {
      throw new Error("Cannot fetch without an id");
    }
    this.sync.fetch(id).then((response: AxiosResponse): void => {
      this.set(response.data);
    });
  }
  save(): void {
    this.sync.save(this.attributes.getAll())
      .then((response: AxiosResponse):void => {
        this.trigger('save');
      })
      .catch((error: Error): void => {
        this.trigger('error');
      });
  }
}
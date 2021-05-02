export class Attributes<T> {
  constructor(private data: T) {}

  // create bound function to bind 'this' to the Attributes
  get = <K extends keyof T>(key: K): T[K] => {
    return this.data[key];
  }

  set(update: T): void {
    Object.assign(this.data, update);
  }

  getAll(): T {
    return this.data;
  }
}
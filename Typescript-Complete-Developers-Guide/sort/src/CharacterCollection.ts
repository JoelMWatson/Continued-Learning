import { Sortable, Sorter } from './Sorter'

export class CharactersCollection extends Sorter implements Sortable {
  
  constructor(public data: string) {
    super();
  }

  get length(): number {
    return this.data.length;
  }

  swap(i: number, j: number): void {
    const chars = this.data.split('');
    const temp = chars[i];
    chars[i] = chars[j];
    chars[j] = temp;

    this.data = chars.join('');
  }
  compare(i: number, j: number): boolean {
    return this.data[i].toLowerCase() > this.data[j].toLowerCase();
  }
}
export interface Sortable {
  length: number;
  swap(i: number, j: number): void;
  compare(i: number, j: number): boolean;
}

// type guard (works for all other types)
// if (this.collection instanceof Array) {}
// type guard (works for number, string, boolean, or symbol types)
// if (typeof this.collection === 'string') {}

export abstract class Sorter {
  abstract compare(i: number, j: number): boolean;
  abstract swap(i: number, j: number): void;
  abstract length: number;

  sort(): void {
    const { length } = this;
    for (let i=0; i<length; i++) {
      for (let j=0; j<length - i - 1; j++) {
        if (this.compare(j, j + 1)) {
          this.swap(j, j+1);
        }
      }
    }
  }
}
import { Sortable, Sorter } from './Sorter'

class Node {
  next: Node | null = null;

  constructor(public data: number) {}
}

export class LinkedList extends Sorter implements Sortable {
  head: Node | null = null;

  get length(): number {
    let length = 0;
    let current = this.head;
    while (current) {
      current = current.next;
      length++;
    }
    return length;
  }

  add(data: number) :void {
    const node = new Node(data);
    if (!this.head) {
      this.head = node;
      return;
    }

    let tail = this.head;
    while(tail.next) {
      tail = tail.next;
    }
    tail.next = node;
  }

  at(index: number): Node {
    if (!this.head) throw new Error('Index out of bounds');
    let counter = 0;
    let current: Node | null = this.head;
    while (current) {
      if (counter === index) {
        return current;
      }

      counter++;
      current = current.next;
    }
    throw new Error('Index out of bounds');
  }

  swap(i: number, j: number): void {
    const left = this.at(i);
    const right = this.at(j);

    const temp = left.data;
    left.data = right.data;
    right.data = temp;
  }

  compare(i: number, j: number): boolean {
    if (!this.head) {
      throw new Error('List is empty');
    }
    return this.at(i).data > this.at(j).data;
  }

  print(): void {
    let current: Node | null = this.head;
    while (current) {
      console.log(current.data);
      current = current.next;
    }
  }
}
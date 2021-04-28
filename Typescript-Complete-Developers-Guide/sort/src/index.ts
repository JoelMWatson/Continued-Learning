import { NumbersCollection } from './NumbersCollection';
import { CharactersCollection } from './CharacterCollection';
import { LinkedList } from './LinkedList';

const numbers = new NumbersCollection([10, 3, -5, 0]);
const characters = new CharactersCollection('Hambionie')
const ll = new LinkedList();

ll.add(500);
ll.add(-10);
ll.add(-3);
ll.add(4);

numbers.sort();
characters.sort();
ll.sort();

console.log(numbers.data)
console.log(characters.data)
ll.print();
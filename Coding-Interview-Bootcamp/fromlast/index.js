// --- Directions
// Given a linked list, return the element n spaces
// from the last node in the list.  Do not call the 'size'
// method of the linked list.  Assume that n will always
// be less than the length of the list.
// --- Examples
//    const list = new List();
//    list.insertLast('a');
//    list.insertLast('b');r
//    list.insertLast('c');
//    list.insertLast('d');  t  1
//    fromLast(list, 2).data // 'b'

function fromLast(list, n) {
  let rabbit = list.head;
  let tortois = list.head;
  while(rabbit.next) {
    rabbit = rabbit.next;
    if (n) {
      n--
    } else {
      tortois = tortois.next;
    }
  }
  return tortois;
}

module.exports = fromLast;

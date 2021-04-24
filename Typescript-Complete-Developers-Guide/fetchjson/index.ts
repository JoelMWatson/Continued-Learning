import axios from 'axios';

const url = 'https://jsonplaceholder.typicode.com/todos/1';

interface Todo {
  id: number;
  title: string;
  completed: boolean;
}

axios.get(url).then(response => {
  console.log(response.data);
  const todo = response.data as Todo;
  const id = todo.id;
  const title = todo.title;
  const finished = todo.completed;

  logTodo(id, title, finished)
});

const logTodo = (id: number, title: string, finished: boolean) => {
  console.log(`
    The Todo With ID: ${id}
    The Todo With Title: ${title}
    The Todo finished: ${finished}
  `)
};



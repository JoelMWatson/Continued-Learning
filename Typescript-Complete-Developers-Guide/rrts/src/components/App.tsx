import React from 'react';
import { connect } from 'react-redux';
import { Todo, fetchTodos, deleteTodo } from '../actions';
import { StoreState } from '../reducers';

interface AppProps {
  todos: Todo[];
  fetchTodos: Function; //typeof fetchTodos; work around for redux-thunk w/ typescript
  deleteTodo: typeof deleteTodo;
}

interface AppState {
  fetching: boolean;
}

class _App extends React.Component<AppProps, AppState> {

  constructor(props: AppProps) {
    super(props);

    this.state = { fetching: false };
  }

  componentDidUpdate(prevProps: AppProps): void {
    if (!prevProps.todos.length && this.props.todos.length) {
      this.setState({ fetching: false });
    }
  }

  fetchClick = (): void => {
    this.props.fetchTodos();
    this.setState({fetching: true})
  }

  deleteClick = (id: number): void => {
    this.props.deleteTodo(id);
  }

  renderList(): JSX.Element[] {
    return this.props.todos.map((todo: Todo) => {
      return <div onClick={() => this.deleteClick(todo.id)} key={todo.id}>{todo.title}</div>
    })
  }

  render () {
    return (
      <div>
        <button onClick={this.fetchClick}>Fetch</button>
        {this.state.fetching ? 'Loading' : null}
        {this.renderList()}
      </div>
    );
  }
}

const mapStateToProps = ({todos}: StoreState): { todos: Todo[] } => {
  return { todos };
}

export const App = connect(
  mapStateToProps, 
  { fetchTodos, deleteTodo }
  )(_App);
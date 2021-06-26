import '@vaadin/vaadin-text-field';
import '@vaadin/vaadin-button';
import '@vaadin/vaadin-checkbox';
import '@vaadin/vaadin-radio-button/vaadin-radio-button';
import '@vaadin/vaadin-radio-button/vaadin-radio-group';

import { LitElement, html } from 'lit-element';
import { getVisibleTodoSelector, VisibilityFilters } from '../redux/reducer';
import { store } from '../redux/store';
import { connect } from 'pwa-helpers';
import { addTodo, clearCompleted, updateFilter, updateTodoStatus } from '../redux/actions';

class TodoView extends connect(store)(LitElement) {  

  static get properties() {
    return {
      todos: { type: Array },
      filter: { type: String },
      task: { type: String }
    }
  }

  stateChanged(state) {
    this.todos = getVisibleTodoSelector(state);
    this.filter = state.filter;
  }

  // not really needed since we are using redux 
  // and setting the local state from the store
  // constructor() {
  //   super();
  //   this.todos = [];
  //   this.filter = VisibilityFilters.SHOW_ALL;
  //   this.task = '';
  // }

  updateTask(e) {
    this.task = e.target.value;
  }

  addTodo() {
    if (this.task) {
      store.dispatch(addTodo(this.task))
      this.task = '';
    }
  }

  shortcutListener(e) {
    if (e.key === 'Enter') {
      this.addTodo()
    }
  }

  updateTodoStatus(updatedTodo, complete) {
    store.dispatch(updateTodoStatus(updatedTodo, complete))
  }

  filterChanged(e) {
    store.dispatch(updateFilter(e.target.value))
  }

  clearCompleted() {
    store.dispatch(clearCompleted());
  }

  render() {
    return html`
      <style>
        .container, .input-layout {
          display: flex;
          flex-direction: column;
          justify-content: center;
        }

        .visibility-filters {
          display: flex;
          justify-content: center;
        }
      </style>
      <div class="container">
        <div class="input-layout" @keyup="${this.shortcutListener}">
          <vaadin-text-field
            placeholder="Task"
            value="${this.task || ''}"
            @change="${this.updateTask}"  
          ></vaadin-text-field>
          <vaadin-button
            theme="primary"
            @click="${this.addTodo}"
          >Submit</vaadin-button>
        </div>

        <div className="todos-list">
          ${this.todos.map(todo => html `
            <div className="todo-item">
              <vaadin-checkbox
                ?checked="${todo.complete}"
                @change="${e => this.updateTodoStatus(todo, e.target.checked)}"
              >${todo.task}</vaadin-checkbox>
            </div>
          `)}
        </div>

        <vaadin-radio-group
          class="visibility-filters"
          value="${this.filter}"
          @value-changed="${this.filterChanged}"
        >
          ${Object.values(VisibilityFilters).map(filter => html`
            <vaadin-radio-button value="${filter}">${filter}</vaadin-radio-button>
          `)}
        </vaadin-radio-group>
        <vaadin-button @click="${this.clearCompleted}">
          Clear Completed
        </vaadin-button>
      </div>
    `
  }
}

customElements.define('todo-view', TodoView);
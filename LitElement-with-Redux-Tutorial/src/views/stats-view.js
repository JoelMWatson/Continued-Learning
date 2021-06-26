import { LitElement, html } from "lit-element";
import {connect} from 'pwa-helpers';

import { statsSelector } from '../redux/reducer'
import { store } from '../redux/store';

class StatsView extends connect(store)(LitElement) {
  static get properties() {
    return {
      chartConfig: {type: Object}
    }
  }

  stateChanged(state) {
    const stats = statsSelector(state);
    this.chartConfig = [
      {name: 'Completed', y: stats.completed},
      {name: 'Active', y: stats.active}
    ];
    this.hasTodos = state.todos.length > 0;
  }

  getChart() {
    if (this.hasTodos) {
      return html`
        <div>
          <p>I ain't paying for no chart component</p>
          ${this.chartConfig.map(stat => html`
            <p><b>${stat.name}:</b>${stat.y}</p>
          `)}
        </div>
      `;
    } else {
      return html`
        <p>Nothing to do...still not payin though</p>
      `;
    }
  }

  render() {
    return html`
      <style>
        stats-view {
          display: block;
        }
      </style>

      ${this.getChart()}
    `
  }
}

customElements.define('stats-view', StatsView)
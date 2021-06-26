import { LitElement, html } from "lit-element";

class NotFoundView extends LitElement {
  render() {
    return html`
      <h1>Not Found!</h1>
    `
  }
}

customElements.define('not-found-view', NotFoundView);
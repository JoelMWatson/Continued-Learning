import { LitElement } from 'lit-element';

export class BaseView extends LitElement {
  // Return this html element instead of the shadow root
  createRenderRoot() {
    return this
  }
}
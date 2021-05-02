import { User, UserProps } from '../models/User';
import { View } from './View';

export class UserForm extends View<User, UserProps>{
  eventsMap(): {[key: string]: () => void} {
    return {
      'click:#random': this.random,
      'click:#name': this.nameClick,
      'click:#save': this.save
    }
  }

  random = (): void => {
    this.model.setRandomAge();
  }

  nameClick = (): void => {
    const input = this.parent.querySelector('input');

    if (input) {
      const name = input.value;
      this.model.set({ name });
    }
  }

  save(): void {
    this.model.save();
  }
  
  template(): string {
    return `
      <div>
        <input placeholder="${this.model.get('name')}" />
        <button id="name">Change Name</button>
        <button id="random">Random age generator</button>
        <button id="save">Save</button>
      </div>
    `;
  }

  
}
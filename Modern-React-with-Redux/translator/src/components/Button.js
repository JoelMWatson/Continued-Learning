import React from 'react';
import LaguageContext from '../contexts/LanguageContext';
import ColorContext from '../contexts/ColorContext';

class Button extends React.Component {
  render() {
    return (
      <ColorContext.Consumer>
        {(color) => (
          <button className={`ui button ${color}`}>
            <LaguageContext.Consumer>
              {({ language }) =>
                language === 'english' ? 'Submit' : 'Voorleggen'
              }
            </LaguageContext.Consumer>
          </button>
        )}
      </ColorContext.Consumer>
    );
  }
}

export default Button;

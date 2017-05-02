import React, { Component } from 'react'
import FormContainer from './FormContainer'

class App extends Component {
  render() {
    return (
      <div className="row">
        <div className="medium-6 medium-offset-3 small-12 columns">
          <FormContainer />
        </div>
      </div>
    );
  }
}

export default App

import React, { Component } from 'react';
import TextField from '../components/TextField';

class FormContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      city: '',
      homeState: '',
      zip: '',
      phoneNumber: '',

    };
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleCityChange = this.handleCityChange.bind(this);
    this.handleHomeStateChange = this.handleHomeStateChange.bind(this);
    this.handleZipChange = this.handleZipChange.bind(this);
    this.handlePhoneNumberChange = this.handlePhoneNumberChange.bind(this);
    this.handleSendForm = this.handleSendForm.bind(this);
  }

handleFormSubmit(event) {
  event.preventDefault();
  {
    let formPayload = {
      profile: {
        city: this.state.city,
        homeState: this.state.homeState,
        zip: this.state.zip,
        phoneNumber: this.state.phoneNumber
      }};
    this.handleSendForm(formPayload);
    this.handleClearForm(event);
  }
}

handleCityChange(event) {
  this.setState({city: event.target.value});
}

handleHomeStateChange(event) {
  this.setState ({homeState: event.target.value});
}

handleZipChange(event) {
  this.setState({zip: event.target.value});
}

handlePhoneNumberChange(event) {
  this.setState({phoneNumber: event.target.value});
}


handleClearForm(event){
  event.preventDefault();
  this.setState({
    error: {},
    city: '',
    homeState: '',
    zip: '',
    phoneNumber: '',
   });
  }

handleSendForm(payload){
  fetch('/api/v1/users', {
  credentials: 'include',
  method: 'POST',
  headers: { 'Content-Type': 'application/json'},
  body: JSON.stringify(payload)
  })
  .then(response => response.json())
  .then(parsed => {
    console.log(parsed.user_id);
    window.location.href = `/users/${parsed.user_id}`;
  });
}

  render() {

    return (
      <form id="profile-form" onSubmit={this.handleFormSubmit}>

        <h1 id="profile-head">Your Profile Info</h1>

        <TextField
            content={this.state.city}
            label='City:'
            name='city'
            handlerFunction={this.handleCityChange}
        />

        <TextField
            content={this.state.homeState}
            label='State:'
            name='homeState'
            handlerFunction={this.handleHomeStateChange}
        />

        <TextField
            content={this.state.zip}
            label='Zip Code:'
            name='zip'
            handlerFunction={this.handleZipChange}
          />

        <TextField
            content={this.state.phoneNumber}
            label='Phone Number:'
            name='phoneNumber'
            handlerFunction={this.handlePhoneNumberChange}
          />


        <input type="submit" className="button" value="Submit"/>
      </form>
    )
  }
}

export default FormContainer

import React, { Component } from 'react';
import TextField from '../components/TextField';

class FormContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      zip: '',
      phoneNumber: '',
      commuteOneStart: '',
      commuteOneEnd: '',
      commuteTwoStart: '',
      commuteTwoEnd: ''
    };
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleZipChange = this.handleZipChange.bind(this);
    this.handlePhoneNumberChange = this.handlePhoneNumberChange.bind(this);
    this.handleCommuteOneStartChange = this.handleCommuteOneStartChange.bind(this);
    this.handleCommuteOneEndChange = this.handleCommuteOneEndChange.bind(this);
    this.handleCommuteTwoStartChange = this.handleCommuteTwoStartChange.bind(this);
    this.handleCommuteTwoEndChange = this.handleCommuteTwoEndChange.bind(this);
    this.handleSendForm = this.handleSendForm.bind(this);
  }

handleFormSubmit(event) {
  event.preventDefault();
  {
    let formPayload = {
      profile: {
        zip: this.state.zip,
        phoneNumber: this.state.phoneNumber,
        commuteOneStart: this.state.commuteOneStart,
        commuteOneEnd: this.state.commuteOneEnd,
        commuteTwoStart: this.state.commuteTwoStart,
        commuteTwoEnd: this.state.commuteTwoEnd
      }};
    this.handleSendForm(formPayload);
    this.handleClearForm(event);
  }
}

handleZipChange(event) {
  this.setState({zip: event.target.value});
}

handlePhoneNumberChange(event) {
  this.setState({phoneNumber: event.target.value});
}

handleCommuteOneStartChange(event) {
  this.setState({commuteOneStart: event.target.value});
}

handleCommuteOneEndChange(event) {
  this.setState ({commuteOneEnd: event.target.value});
}

handleCommuteTwoStartChange(event) {
  this.setState ({commuteTwoStart: event.target.value});
}

handleCommuteTwoEndChange(event) {
  this.setState ({commuteTwoEnd: event.target.value});
}

handleClearForm(event){
  event.preventDefault();
  this.setState({
    error: {},
    zip: '',
    phoneNumber: '',
    commuteOneStart: '',
    commuteOneEnd: '',
    commuteTwoStart: '',
    commuteTwoEnd: ''
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
    console.log(parsed.message);
  });
}

  render() {

    return (
      <form id="profile-form" onSubmit={this.handleFormSubmit}>

        <h1>Your Profile Info</h1>

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

          <TextField
              content={this.state.commuteOneStart}
              label='Commute Start Time:'
              name='commuteOneStart'
              handlerFunction={this.handleCommuteOneStartChange}
          />

          <TextField
              content={this.state.commuteOneEnd}
              label='Commute End Time:'
              name='commuteOneEnd'
              handlerFunction={this.handleCommuteOneEndChange}
          />

          <TextField
              content={this.state.commuteTwoStart}
              label='Additional Commute Start Time:'
              name='commuteTwoStart'
              handlerFunction={this.handleCommuteTwoStartChange}
          />

            <TextField
                content={this.state.commuteTwoEnd}
                label='Additional Commute End Time:'
                name='commuteTwoEnd'
                handlerFunction={this.handleCommuteTwoEndChange}
            />

        <input type="submit" className="button" value="Submit "/>
      </form>
    )
  }
}

export default FormContainer

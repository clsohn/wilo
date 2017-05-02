import React, { Component } from 'react';
import TextField from '../components/TextField';
import Select from '../components/Select';

class FormContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      firstName: '',
      lastName: '',
      email: '',
      phoneNumber: '',
      commuteOneStart: '',
      commuteOneEnd: '',
      commuteTwoStart: '',
      commuteTwoEnd: ''
    }
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleFirstNameChange = this.handleFirstNameChange.bind(this);
    this.handleLastNameChange = this.handleLastNameChange.bind(this);
    this.handleEmailChange = this.handleEmailChange.bind(this);
    this.handlePhoneNumberChange = this.handlePhoneNumberChange.bind(this);
    this.handleCommuteOneStartChange = this.handleCommuteOneStartChange.bind(this);
    this.handleCommuteOneEndChange = this.handleCommuteOneEndChange.bind(this);
    this.handleCommuteTwoStartChange = this.handleCommuteTwoStartChange.bind(this);
    this.handleCommuteTwoEndChange = this.handleCommuteTwoEndChange.bind(this);
  }



handleFirstNameChange(event) {
  this.setState({firstName: event.target.value })
}

handleLastNameChange(event) {
  this.setState({lastName: event.target.value})
}

handleEmailChange(event) {
  this.setState({email: event.target.value})
}

handlePhoneNumberChange(event) {
  this.setState({phoneNumber: event.target.value})
}

handleCommuteOneStartChange(event) {
  this.setState({commuteOneStart: event.target.value})
}

handleCommuteOneEndChange(event) {
  this.setState ({commuteOneEnd: event.target.value})
}

handleCommuteTwoStartChange(event) {
  this.setState ({commuteTwoStart: event.target.value})
}

handleCommuteTwoEndChange(event) {
  this.setState ({commuteTwoEnd: event.target.value})
}

handleClearForm(event){
  event.preventDefault();
  this.setState({
    error: {},
    firstName: '',
    lastName: '',
    email: '',
    phoneNumber: '',
    commuteOneStart: '',
    commuteOneEnd: '',
    commuteTwoStart: '',
    commuteTwoEnd: ''
    })
  }


  render() {

    return (
      <form id="profile-form" onSubmit={this.handleFormSubmit}>

        <h1>Your Profile Info</h1>

        <TextField
            content={this.state.firstName}
            label='First Name:'
            name='firstName'
            handlerFunction={this.handleFirstNameChange}
          />
        <TextField
            content={this.state.lastName}
            label='Last Name:'
            name='lastName'
            handlerFunction={this.handleLastNameChange}
          />
        <TextField
            content={this.state.email}
            label='Email:'
            name='email'
            handlerFunction={this.handleEmailChange}
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

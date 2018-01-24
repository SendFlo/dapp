import React, { Component } from 'react';

export default class Soi extends Component {
  render() {
    return (
      <li>
        <table>
          <tbody>
            <tr>
              <td>Recipient:</td>
              <td>{this.props.soi.recipient}</td>
            </tr>
            <tr>
              <td>Sender:</td>
              <td>{this.props.soi.sender}</td>
            </tr>
            <tr>
              <td>Data Json:</td>
              <td>{this.props.soi.data_json}</td>
            </tr>
            <tr>
              <td>Soi timestamp:</td>
              <td>{this.props.soi.soi_timestamp.toString()}</td>
            </tr>
            <tr>
              <td>Doi timestamp:</td>
              <td>{this.props.soi.doi_timestamp}</td>
            </tr>
            <tr>
              <td>Created by:</td>
              <td>{this.props.soi.createdBy}</td>
            </tr>
          </tbody>
        </table>
      </li>
    )
  }
}
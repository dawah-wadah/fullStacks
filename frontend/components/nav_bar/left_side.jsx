import React from 'react';
import { connect } from 'react-redux';



const mapStateToProps = ({ session }) => {
  return {
    loggedIn: Boolean(session.currentUser),
    errors: session.errors
  };
};

export default connect(mapStateToProps, null)(leftSide);
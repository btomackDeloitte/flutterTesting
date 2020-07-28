import 'package:flutter/material.dart';
import 'package:flutter_widget_testing/model/user.dart';
import 'package:flutter_widget_testing/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class TextInput extends StatefulWidget {

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {

  final _formKey = GlobalKey<FormState>();

  bool _isInAsyncCall = false;
  bool _isInvalidAsyncUser = false; // managed after response from server
  bool _isInvalidAsyncPass = false; // managed after response from server

  bool _isLoggedIn = false;

  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  User _user;

  @override
  void initState() {
    _user = User();
    super.initState();
  }

  void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key('AppBar'),
        backgroundColor: Colors.red,
        title: Text(
          'Text Input',
          key: Key('AppBarTitle'),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ModalProgressHUD(
          inAsyncCall: _isInAsyncCall,
          opacity: 0.5,
          progressIndicator: CircularProgressIndicator(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      key: Key(USER_NAME),
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      focusNode: _usernameFocusNode,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'User Name',
                      ),
                      onFieldSubmitted: (_) {
                        fieldFocusChange(context, _usernameFocusNode, _emailFocusNode);
                      },
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your user name.';
                        } else {
                          RegExp regex = RegExp(r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$');
                          if (!regex.hasMatch(value))
                            return 'Invalid username';
                          else {
                            return null;
                          }
                        }
                      },
                      onSaved: (value) => setState(() => _user.userName = value),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      key: Key(USER_EMAIL),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      focusNode: _emailFocusNode,
                      autofocus: true,
                      decoration: InputDecoration(labelText: 'Email'),
                      onFieldSubmitted: (_) {
                        fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
                      },
                      // ignore: missing_return
                      validator: (email)=>EmailValidator.validate(email)? null:'Invalid email address.',
                      onSaved: (email) => setState(() => _user.email = email),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      key: Key(USER_PWORD),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      focusNode: _passwordFocusNode,
                      decoration: InputDecoration(labelText: 'Password'),
                      // ignore: missing_return
                      validator: (password) {
                        Pattern pattern = r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                        RegExp regExp = RegExp(pattern);
                        if (!regExp.hasMatch(password)) {
                          return 'Invalid password.';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (password) => setState(() => _user.password = password),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      key: Key('SubmitButton'),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          print('SAVED: $_user.userName');
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
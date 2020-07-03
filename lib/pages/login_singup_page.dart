import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:honua/application.dart';
import 'package:honua/helpers/app_translations.dart';
import 'package:honua/helpers/theme_changer.dart';
import 'package:honua/models/user.dart';
import 'package:honua/services/repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class LoginSignUpPage extends StatefulWidget {
  LoginSignUpPage({this.mode});

  final FormMode mode;

  @override
  State<StatefulWidget> createState() => new _LoginSignUpPageState();
}

enum FormMode { LOGIN, SIGNUP, RESTPASSWORT }

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  final _formKey = new GlobalKey<FormState>();
  final _nameController = TextEditingController(text: '');
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _email;
  String _password;
  String _errorMessage;
  String _firstname;
  String _lastname;

  // Initial form is login form
  FormMode _formMode;
  bool _isLoading;

  // Check if form is valid before perform login or signup
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  _saveUser() async {
    Application.auth.getCurrentUser().then((firebaseUser) async {
      var prefs = await SharedPreferences.getInstance();

      final QuerySnapshot result = await Firestore.instance
          .collection('users')
          .where('id', isEqualTo: firebaseUser.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        // Update data to server if new user
        User user = User.createUser();
        user.id = firebaseUser.uid;
        user.email = firebaseUser.email;
        user.pushTokens = new List<String>();
        user.pushTokens.add(Application.pushToken);
        user.firstname = _firstname;
        user.lastname = _lastname;

        Repository.internal().createUser(user);

        Application.user = user;

        await prefs.setString('id', firebaseUser.uid);
        Application.userId = firebaseUser.uid;
      } else {
        var user = User.fromMap(documents[0].data);
        Application.user = user;
        await prefs.setString('id', user.id);
        Application.userId = firebaseUser.uid;
      }
    });
  }

  // Perform login or signup
  _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (_validateAndSave()) {
      String userId = "";
      try {
        if (_formMode == FormMode.LOGIN) {
          userId = await Application.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await Application.auth.signUp(_email, _password);
          print('Signed up user: $userId');
        }
        _saveUser();
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false,
          );
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message.toString();
        });
      }
    }
  }

  _validateResetPassword() async {
    setState(() {
      _errorMessage = "";
    });
    if (_nameController.text.isNotEmpty) {
      await Application.auth.resetPassword(_nameController.text);

      _changeFormToLogin();
      _email = _nameController.text;
    } else {
      _errorMessage = "Bitte geben Sie eine E-Mail Adrese an";
    }
  }

  @override
  void initState() {
    _formMode = widget.mode;
    _errorMessage = "";
    _isLoading = false;

    super.initState();
  }

  void _changeFormToSignUp() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void _changeFormToLogin() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  void _openRestPasswort() {
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.RESTPASSWORT;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _themeChanger = Provider.of<ThemeChanger>(context);
    var _translator = AppTranslations.of(context);

    return Scaffold(
      body: new Stack(
        children: <Widget>[
          _showBody(),
          _showCircularProgress(),
        ],
      ),
    );
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget _showBody() {
    switch (_formMode) {
      case FormMode.LOGIN:
        return new Container(
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            child: new Form(
              key: _formKey,
              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _showLogo(),
                  _showEmailInput(),
                  _showPasswordInput(),
                  _showPrimaryButton(),
                  _showSecondaryButton(),
                  _showPasswortRestButton(),
                  _showErrorMessage(),
                ],
              ),
            ));
        break;
      case FormMode.SIGNUP:
        return new Container(
            padding: EdgeInsets.all(5.0),
            child: new Form(
              key: _formKey,
              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _showLogo(),
                  _showEmailInput(),
                  _showPasswordInput(),
                  _showFirstnameInput(),
                  _showLastnameInput(),
                  _showPrimaryButton(),
                  _showSecondaryButton(),
                  _showErrorMessage(),
                ],
              ),
            ));
        break;
      case FormMode.RESTPASSWORT:
        return new Container(
            padding: EdgeInsets.all(5.0),
            child: new Form(
              key: _formKey,
              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _showLogo(),
                  _showResetEmailInput(),
                  _showRestPasswordButton(),
                  _showSecondaryButton(),
                  _showErrorMessage(),
                ],
              ),
            ));
        break;
    }
  }

  Widget _showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget _showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/honua.png'),
        ),
      ),
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        initialValue: _email,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
    );
  }

  Widget _showResetEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        controller: _nameController,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
      ),
    );
  }

  Widget _showFirstnameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Firstname',
            icon: new Icon(
              Icons.person,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'Firstname can\'t be empty' : null,
        onSaved: (value) => _firstname = value,
      ),
    );
  }

  Widget _showLastnameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Lastname',
            icon: new Icon(
              Icons.person,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Lastname can\'t be empty' : null,
        onSaved: (value) => _lastname = value,
      ),
    );
  }

  Widget _showSecondaryButton() {
    return new FlatButton(
      child: _formMode == FormMode.LOGIN
          ? new Text('Create an account',
              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300))
          : new Text('Have an account? Sign in',
              style:
                  new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
      onPressed: _formMode == FormMode.LOGIN
          ? _changeFormToSignUp
          : _changeFormToLogin,
    );
  }

  Widget _showPasswortRestButton() {
    return new FlatButton(
      child: new Text('Passwort vergessen',
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
      onPressed: _openRestPasswort,
    );
  }

  Widget _showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Theme.of(context).primaryColor,
            child: _formMode == FormMode.LOGIN
                ? new Text('Login',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white))
                : new Text('Create account',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: _validateAndSubmit,
          ),
        ));
  }

  Widget _showRestPasswordButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Theme.of(context).primaryColor,
            child: new Text('Passwort Zurücksetzen',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: _validateResetPassword,
          ),
        ));
  }
}

import 'package:flutter/material.dart';

// enum Type {
//   login,
// }

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginScreen();
}

class _LoginScreen extends State<LoginPage> {
  final TextEditingController _userNameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  final _keyState = GlobalKey<FormState>();
  String _username = "";
  String _password = "";
  // Type _form = Type.login;
  _LoginScreen() {
    _userNameController.addListener(_userNameListen);
    _passwordController.addListener(_passwordListen);
  }
  void _userNameListen() {
     setState(() {
    if (_userNameController.text.isEmpty) {
      _username = "";
    } else {
      _username = _userNameController.text;
    }
    });   
  }

  void _passwordListen() {
    setState(() {
      if (_passwordController.text.isEmpty) {
        _password = "";
      } else {
        _password = _passwordController.text;
      }
    });
  }

  // void _typeChange() async {
  //   if (_form == Type.login) {
  //     _form = Type.login;
  //   }
  // }

  void _loginPressed() {
    if (_username == 'Renuga' && _password == '123456'){
   print('The user wants to login with $_username and $_password');
   Navigator.pushReplacementNamed(context, '/catalog');
    }
    else {
  print('Invalid user $_username and $_password');
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            key: _keyState,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.headline3,
              ),
              TextFormField(
                controller: _userNameController,
                validator: UserFieldValidator.validate,
                onSaved: (value) => _username = value,
                decoration: InputDecoration(
                  hintText: 'Username',
                ),
              ),
              TextFormField(
                controller: _passwordController,
                validator: PasswordFieldValidator.validate,
                onSaved: (value) => _password = value,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 24,
              ),
              RaisedButton(
                  color: Colors.yellow,
                  child: Text('ENTER'),
                  onPressed: () {
                    _loginPressed();
                   // Navigator.pushReplacementNamed(context, '/catalog');
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class UserFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'User field can\'t be empty' : null;
  }
}
class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}
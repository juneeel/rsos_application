import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rsos_application/components/constant.dart';
import "package:package_info/package_info.dart";

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _name, _email, _password, _cPassword, _plateNum;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          // UserUpdateInfo updateuser = UserUpdateInfo();
          // updateuser.displayName = _name;
          //  user.updateProfile(updateuser);
          await _auth.currentUser!.updateProfile(displayName: _name);
          // await Navigator.pushReplacementNamed(context,"/") ;

        }
      } catch (e) {
        showError(e.toString());
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  child: Image(
                    image: AssetImage("assets/img/IconNoBackground.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input!.isEmpty) return 'Enter Name';
                              },
                              decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle: TextStyle(color: white),
                                prefixIcon: Icon(Icons.person, color: white,),
                              ),
                              onSaved: (input) => _name = input!),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input!.isEmpty) return 'Enter Phone Number';
                              else if(input.length < 6){
                                  return 'Enter Valid Number';
                              }
                            },
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                labelStyle: TextStyle(color: white),
                                prefixIcon: Icon(Icons.phone, color: white,),
                              ),
                              onSaved: (input) => _name = input!),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input!.isEmpty) return 'Enter Plate Number';
                              },
                              decoration: InputDecoration(
                                labelText: 'Plate Number',
                                labelStyle: TextStyle(color: white),
                                prefixIcon: Icon(Icons.credit_card_sharp, color: white,),
                              ),
                              onSaved: (input) => _name = input!),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input!.isEmpty) return 'Enter Motorcycle Type';
                              },
                              decoration: InputDecoration(
                                labelText: 'Motorcycle Type',
                                labelStyle: TextStyle(color: white),
                                prefixIcon: Icon(Icons.motorcycle, color: white,),
                              ),
                              onSaved: (input) => _name = input!),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input!.isEmpty) return 'Enter Email';
                              },
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: white),
                                  fillColor: Colors.white,
                                  focusColor: Colors.white,
                                  hoverColor: Colors.white,
                                  prefixIcon: Icon(Icons.email, color: white,)),
                              onSaved: (input) => _email = input!),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input!.length < 6)
                                  return 'Provide Minimum 6 Character';
                              },
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: white),
                                prefixIcon: Icon(Icons.lock, color: white,),
                              ),
                              obscureText: true,
                              onSaved: (input) => _password = input!),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input! != _password)
                                  return 'Incorrect Password';
                                else if(input.isEmpty)
                                  return 'Enter Password';
                              },
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                labelStyle: TextStyle(color: white),
                                prefixIcon: Icon(Icons.lock, color: white,),
                              ),
                              obscureText: true,
                          ),
                        ),
                        SizedBox(height: 20),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          onPressed: signUp,
                          child: Text('Register',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
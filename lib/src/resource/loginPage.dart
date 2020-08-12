import 'package:demo_hello_word/src/blocs/login_bloc.dart';
import 'package:demo_hello_word/src/resource/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //khoi tao stream (co nhieu cach de khoi tao)
  LoginBloc bloc = new LoginBloc();
  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                  child: FlutterLogo()),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: Text(
                "Hello\nWelcome back",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                // StreamBuilder de mapping giua bloc(stream) vs widget
                child: StreamBuilder(
                    stream: bloc.userStream,
                    //builder is function
                    builder: (context, snapshot) => TextField(
                          controller: _userController,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Username",
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              labelStyle: TextStyle(
                                  color: Color(0xff888888), fontSize: 15)),
                        ))),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  StreamBuilder(
                      stream: bloc.passwordStream,
                      builder: (context, snapshot) => TextField(
                            controller: _passController,
                            obscureText: !_showPass,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Password",
                                errorText:
                                    snapshot.hasError ? snapshot.error : null,
                                labelStyle: TextStyle(
                                    color: Color(0xff888888), fontSize: 15)),
                          )),
                  GestureDetector(
                    onTap: onToggleShowPass,
                    child: Text(
                      _showPass ? "HIDE" : "SHOW",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  onPressed: onSignInClicked,
                  child: Text(
                    "Signin",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            ),
          ],
        ),
      ),
    );
  }

  //event click button login
  void onSignInClicked() {
    setState(() {
      if (bloc.isValidInfo(_userController.text, _passController.text)) {
        //call ham gotoHome redirect page
        Navigator.push(context, MaterialPageRoute(builder: gotoHome));
      }
    });
  }

  //redirect sang page home khi login thanh cong
  Widget gotoHome(BuildContext context) {
    return HomePage();
  }

  //event show/hidden password
  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}

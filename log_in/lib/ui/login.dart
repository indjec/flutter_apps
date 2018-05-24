import 'package:flutter/material.dart';

class Login extends StatefulWidget{

  @override
  State createState() {
    return new LogInState();
  }
}

class LogInState extends State<Login>{

  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString="";
  String _passwordString="";

  void _erase(){
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  void _showWelcome(){
    setState(() {
      if(_userController.text.isNotEmpty && _passwordController.text.isNotEmpty){
        _welcomeString = _userController.text;
        _passwordString = _passwordController.text;
      }else{
        _welcomeString = "Nothing";
        _passwordString = "Nothing";
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),

      backgroundColor: Colors.blueGrey,

      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            //image/profile
            new Image.asset(
              'Images/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.white,
            ),

            new Padding(padding: new EdgeInsets.only(top: 40.0)),
            new Container(
              height: 200.0,
              width: 520.0,
              color: Colors.white,

              child: new Column(
                children: <Widget>[
                  //TextFiled for Username
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                      hintText: 'Username',
                      icon: new Icon(Icons.person)
                    ),
                  ),

                  //TextField for Password
                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                        hintText: 'Password',
                        icon: new Icon(Icons.lock)
                    ),
                    obscureText: true, 
                  ),

                  new Padding(padding: new EdgeInsets.all(10.5)),
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        //login Button
                        new Container(
                          margin: const EdgeInsets.only(left: 38.0),
                          child: new RaisedButton(
                            onPressed: _showWelcome,
                            color: Colors.redAccent,
                            child: new Text("Login",
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 16.9,
                            ),),),
                        ),

                        //Clear Button
                        new Container(
                          margin: const EdgeInsets.only(left: 250.0),
                          child: new RaisedButton(
                            onPressed: _erase,
                            color: Colors.redAccent,
                            child: new Text("Clear",
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 16.9,
                              ),),),
                        ),
                      ],
                    ),
                  )
                ],

              ),
            ),

            new Padding(padding: new EdgeInsets.only(top: 30.0)),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Welcome: $_welcomeString",
                style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 50.0
                ),),

                new Text("Password: $_passwordString",
                  style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 50.0
                  ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Home extends StatefulWidget{

  @override
  State createState() {
    return new MakeItRainState();
  }
}

class MakeItRainState extends State<Home>{

  int _moneyCounter = 0;

  void _rainMoney(){
    setState(() {
    //Important - setState is called each time we need to update the UI
      _moneyCounter += 100;
    });

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Make it Rain"),
        backgroundColor: Colors.green,
      ),

      body: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
                child: new Text("Get Rich!",
                  style: new TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 29.9
                  ),)
            ),
            
            new Expanded(
                child: new Center(
                  child: new Text('\$$_moneyCounter',
                  style: new TextStyle(
                    color: _moneyCounter > 3000 ? Colors.blueAccent : Colors.red,
                    fontSize: 46.9,
                    fontWeight: FontWeight.w800
                  ),),
                )),

            new Expanded(
                child: new Center(
                  child: new FlatButton(
                    color: Colors.lightGreen,
                      onPressed: _rainMoney,
                      child: new Text("Let it Rain!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0
                      ),)),
                ))
          ],
        ),
      ),
    );
  }
}
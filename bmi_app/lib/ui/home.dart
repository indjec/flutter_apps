import 'package:flutter/material.dart';

class Home extends StatefulWidget{

  @override
  State createState() {
    return new BMIcalculator();
  }
}

class BMIcalculator extends State<Home>{

  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _resultReading = "";
  String _finalResult = "";

  void calculate(){
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height * 12;
      double weight = double.parse(_weightController.text);

      if((_ageController.text.isNotEmpty || age > 0)
        && (_heightController.text.isNotEmpty || inches > 0)
      &&(_weightController.text.isNotEmpty || weight > 0)){

        result = weight / (inches * inches) *703; //our BMI

        if(double.parse(result.toStringAsFixed(1)) < 18.5){
          _resultReading = "UnderWeight";
        }else if(double.parse(result.toStringAsFixed(1)) >= 18.5 && result < 25){
          _resultReading = "Great Shape";
        }else if(double.parse(result.toStringAsFixed(1)) >= 18.5 && result < 30){
          _resultReading = "OverWeight";
        }else if(double.parse(result.toStringAsFixed(1)) >= 30.0){
          _resultReading = "Obese";
        }
      }else{
        result = 0.0;
      }
    });

    _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),

      backgroundColor: Colors.white,

      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
//          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'images/bmilogo.png',
              height: 133.0,
              width: 200.0,
            ),

            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              color: Colors.grey.shade300,
              height: 300.0,
              width: 520.0,

              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Age",
                      hintText: "Enter your age",
                      icon: new Icon(Icons.person_outline)
                    ),
                  ),

                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Height in feet",
                        hintText: "Enter your height",
                        icon: new Icon(Icons.insert_chart)
                    ),
                  ),

                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Weight in lb",
                        hintText: "Enter your weight",
                        icon: new Icon(Icons.line_weight)
                    ),
                  ),


                  //calculate button
                  new Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 40.0),
                      child: new RaisedButton(
                        onPressed: calculate,
                        color: Colors.red,
                        child: new Text("Calculate",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 16.9,
                          ),),
                      )
                  )

                ],
              ),
            ),

            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("$_finalResult",
                style: new TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 19.9,
                  fontStyle: FontStyle.italic
                ),),

                new Padding(padding: const EdgeInsets.all(5.0)),
                new Text("$_resultReading",
                  style: new TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.w500,
                      fontSize: 19.9,
                      fontStyle: FontStyle.italic
                  ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
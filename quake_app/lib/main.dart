import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Map _data;
List _features;
void main() async{

  _data = await getQuakes();

  _features = _data['features'];
//  print(_data['features'][0]['properties']);


  runApp(new MaterialApp(
    title: "Quake",
    home: new Quakes(),
  ));
}

class Quakes extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Quakes"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: new Center(
        child: new ListView.builder(
          itemCount: _features.length,
            padding: const EdgeInsets.all(15.0),
            itemBuilder: (BuildContext context, int position){
            if(position.isOdd) return new Divider();
            final index = position ~/ 2;

            var format = new DateFormat.yMMMMd("en_US").add_jm();
            var date = format.format(new DateTime.fromMillisecondsSinceEpoch(_features[index]['properties']['time'],
                isUtc: true));
            
                return new ListTile(
                  title: new Text("At: $date",
                  style: new TextStyle(fontSize: 19.5,
                    color: Colors.orange,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                  subtitle: new Text("${_features[index]['properties']['place']}",
                    style: new TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey ),
                  ),
                  leading: new CircleAvatar(
                    backgroundColor: Colors.red,
                    child: new Text("${_features[index]['properties']['mag']}",
                    style: new TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontStyle: FontStyle.italic
                    ),
                    ),
                  ),
                  onTap: (){ _showAlertMessage(context, "${_features[index]['properties']['title']}");},
                );
            }),
      ),
    );
  }

  void _showAlertMessage(BuildContext context, String message) {
    var alert = new AlertDialog(
      title: new Text("Quakes"),
      content: new Text(message),
      actions: <Widget>[
        new FlatButton(onPressed: (){Navigator.pop(context);},
            child: new Text('OK'))
      ],
    );
    showDialog(context: context, child: alert);
  }
}


Future<Map> getQuakes() async{
  String apiUrl = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
   http.Response response = await http.get(apiUrl);
   return JSON.decode(response.body);
}
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main(){
    runApp(new MaterialApp(
        title: "IO",
        home: new Home(),
    ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Container();
  }

  Future<String> get _localPath async{
    final directory = await getApplicationDocumentsDirectory(); //gets some path inside our directory
    print(directory);
    return directory.path;
  }

  Future<File> get _localFile async{
    final path = await _localPath;
    print(path);
    return new File('$path/data.txt');
  }

  //Write and Read from our file
Future<File> writeData(String message) async{
    final file = await _localFile;
    return file.writeAsString('$message');
}

Future<String> readData() async{
    try{
      final file = await _localFile;
      //Read
      String data = await file.readAsString();
      return data;
    }catch(e){
      return "Nothing saved yet!";
  }
}

}

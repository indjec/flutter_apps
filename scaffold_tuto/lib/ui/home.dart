import 'package:flutter/material.dart';

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green.shade700,
        title: new Text("Scaffold"),

        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.send), onPressed: () => debugPrint("Send clicked!!")),
          new IconButton(icon: new Icon(Icons.search), onPressed: () => debugPrint("Search clicked!!")),
        ],
      ),

      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new InkWell(
              child: new Text("Text Button!!"),
              onTap: () => debugPrint("Text Button clicked"),
            )
          ],
        ),
      ),

      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: new Icon(Icons.call_missed), title: new Text("Missed")),
        new BottomNavigationBarItem(icon: new Icon(Icons.call_received), title: new Text("Received")),
        new BottomNavigationBarItem(icon: new Icon(Icons.video_call), title: new Text("Video")),
      ],
      onTap: (int i) => debugPrint("Button $i pressed"),
      ),
      
      floatingActionButton: new FloatingActionButton(
        onPressed: () => debugPrint("Floating Button pressed"),
        backgroundColor: Colors.lightBlue,
        tooltip: 'Going up',
        child: new Icon(Icons.call),
      ),
    );
  }
}
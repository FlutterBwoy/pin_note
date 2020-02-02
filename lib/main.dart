import 'package:flutter/material.dart';
import 'existing.dart';

import "package:flutter/services.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pin_Note",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
        SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pin_Note'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            RaisedButton(
              child: Text("Existing Folder"),
              onPressed: () {
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UploadMultipleImageDemo();
                  }));
                }
              },
            ),
           

            

            
          ],
        ),
      ),
    );
  }
}

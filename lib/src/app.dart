import 'package:flutter/material.dart';
import 'package:pics/ui_element/sidebarmenu.dart';
import 'package:http/http.dart' show get;
import 'dart:async';
import 'dart:convert';
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<ImageModel> images = [];

  static doSomething(String nameitem){

    print(nameitem);
  }
  MainMenu myOtherClass = new MainMenu(doSomething);

  void fetchImage() async {
    counter++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var jsonobject = json.decode(response.body);
    var iamgemodel = ImageModel.fromJson(jsonobject);
    setState(() {
      images.add(iamgemodel);
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'let see Image',
            style: TextStyle(fontSize: 18.0),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.bookmark),
              tooltip: 'نشانه گذاری',
            ),
            IconButton(
              icon: Icon(Icons.access_alarm),
              tooltip: 'یادآوری',
            ),
            IconButton(
              icon: Icon(Icons.share),
              tooltip: 'اشتراک گذاری',
            )
          ],
          leading: Builder(builder: (BuildContext ctx) {
            return IconButton(
              onPressed: (){
                _scaffoldKey.currentState.openDrawer();
              },
              icon: Icon(Icons.menu),
              tooltip: 'منو',
            );
          }),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        drawer: myOtherClass.menuinside,
      ),
    );
  }
}

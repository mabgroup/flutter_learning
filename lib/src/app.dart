import 'package:flutter/material.dart';
import 'package:pics/ui_element/sidebarmenu.dart';
import 'package:http/http.dart' show get;

class App extends StatefulWidget {
  @override
  State createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static doSomething(String nameitem){

    print(nameitem);
  }
  MainMenu myOtherClass = new MainMenu(doSomething);

  void fetchImage(){
    counter++;
    get('https://jsonplaceholder.typicode.com/photos/$counter');
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
        body: Container(
          margin: const EdgeInsets.all(15.0),
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$counter Images',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0, color: Colors.blueAccent,fontWeight:FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        drawer: myOtherClass.menuinside,
      ),
    );
  }
}

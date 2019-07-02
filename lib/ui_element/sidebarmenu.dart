import 'package:flutter/material.dart';

class MainMenu {
  Drawer menuinside;
  final void Function(String) callback;

  MainMenu(this.callback) {
    menuinside = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent.shade400,
              ),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    width: 90.0,
                    height: 90.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              'https://via.placeholder.com/150/810b14'),
                          alignment: Alignment(5.0, 5.0),

                        )),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Test User',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              this.callCallaback('Item 1');
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              this.callCallaback('Item 2');
            },
          ),
        ],
      ),
    );
  }

  void callCallaback(String name) {
    callback(name);
  }
}

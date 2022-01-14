// import 'dart:html';

import 'package:flutter/material.dart';

class TabItem {
  String title;
  Icon icon;
  TabItem(this.title, this.icon);
}

final List<TabItem> _tabBar = [
  TabItem('Camera', Icon(Icons.camera)),
  TabItem('Photos', Icon(Icons.photo_album)),
  TabItem('Chat', Icon(Icons.chat)),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter homework 5',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter homework 5'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int tabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // late PersistentBottomSheetController _controller;

  // void toggelBottomSheet() {
  //   if (_controller == null) {
  //     _controller =
  //         scaffoldKey.currentState.showBottomSheet((context) => Container(
  //               color: Colors.blueGrey,
  //               child: Text('Goodbye =)'),
  //             ));
  //   } else {
  //     _controller.close();
  //     _controller = null;
  //   }
  // }

  // void openDrawer() {
  // scaffoldKey.currentState.openDrawer();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(Icons.person)))
        ],
      ),

      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            DrawerHeader(
                child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://picsum.photos/1200/501'),
            )),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Images'),
            ),
            ListTile(
              leading: Icon(Icons.file_copy),
              title: Text('Files'),
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsets.all(20),
                          child: TextButton(
                              onPressed: () {},
                              child: Text("Sign out"),
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.black12,
                                  textStyle: TextStyle(fontSize: 16),
                                  padding: EdgeInsets.all(16)))),
                      Container(
                          margin: EdgeInsets.all(20),
                          child: TextButton(
                              onPressed: () {},
                              child: Text("Help"),
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.black12,
                                  textStyle: TextStyle(fontSize: 16),
                                  padding: EdgeInsets.all(16))))
                    ],
                  )),
            )
          ],
        ),
      ),

      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
            Text(
              'You are user',
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),

      body: Center(
        child: Text(
          'Hello!',
          style: TextStyle(fontSize: 30, color: Colors.blueGrey),
        ),
      ),

      // body: TabBarView(
      //   controller: ,
      //   children: [
      //     Container(
      //       color: Colors.black,
      //       child: Text('Primite'),
      //     ),
      //     Container(
      //       color: Colors.white,
      //       child: Text('Moyo'),
      //     ),
      //     Container(
      //       color: Colors.blue,
      //       child: Text('DZ'),
      //     )
      //   ],
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 300,
                  color: Colors.amber,
                );
              });
        }, //toggelBottomSheet,
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: BottomNavigationBar(
              elevation: 0,
              // onTap: (),
              // currentIndex: ,
              selectedItemColor: Colors.purple,
              items: _tabBar.map((e) {
                return BottomNavigationBarItem(icon: e.icon, label: e.title);
              }).toList()),
        ),
      ),

      // bottomSheet: BottomSheet(
      // animationController: bottomController,
      //   builder: (context) => Container(
      //     color: Colors.blueGrey,
      //     height: 250,
      //     child: Center(
      //       child: Text(
      //         'Goodbye =)',
      //         style: TextStyle(color: Colors.white, fontSize: 24),
      //       ),
      //     ),
      //   ),
      //   onClosing: () {},
      //   backgroundColor: Colors.indigo,
      // ),
    );
  }
}

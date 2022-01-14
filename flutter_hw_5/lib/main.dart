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
  PersistentBottomSheetController _controller;

  void toggelBottomSheet() {
    if (_controller == null) {
      _controller =
          scaffoldKey.currentState.showBottomSheet((context) => Container(
                color: Colors.blueGrey,
                child: Text('Goodbye =)'),
              ));
    } else {
      _controller.close();
      _controller = null;
    }
  }

  void openDrawer() {
    scaffoldKey.currentState.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,

      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.person)))
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://picsum.photos/1200/501'),
              child: Text('User'),
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
          ],
        ),
      ),

      endDrawer: Drawer(
        child: ListView(),
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
        onPressed: toggelBottomSheet,
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: BottomNavigationBar(
              // onTap: (),
              // currentIndex: ,
              selectedItemColor: Colors.purple,
              items: _tabBar.map((e) {
                return BottomNavigationBarItem(icon: e.icon, label: e.title);
              }).toList()),
        ),
      ),

      bottomSheet: BottomSheet(
        builder: (context) => Container(
          color: Colors.blueGrey,
          height: 250,
          child: Center(
            child: Text('Goodbye =)'),
          ),
        ),
        onClosing: () {},
        backgroundColor: Colors.indigo,
      ),
    );
  }
}

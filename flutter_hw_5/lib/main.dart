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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  PersistentBottomSheetController? _controller;
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      print("Listener: ${_tabController.index}");
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  void toggelBottomSheet() {
    if (_controller == null) {
      _controller =
          scaffoldKey.currentState?.showBottomSheet((context) => Container(
              color: Colors.amber,
              height: 200,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      margin: EdgeInsets.all(20),
                      child: Row(children: [
                        Expanded(
                          child: Text('Please', style: TextStyle(fontSize: 24)),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            child: Text('Push me',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black)),
                            onPressed: () {},
                          ),
                        )
                      ])))));
    } else {
      _controller?.close();
      _controller = null;
    }
  }

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
          child: TabBarView(
        controller: _tabController,
        children: [
          Container(
            color: Colors.blue[50],
            child: Center(
                child: Text(
              'Primite',
              style: TextStyle(color: Colors.black, fontSize: 24),
            )),
          ),
          Container(
            color: Colors.white,
            child: Center(
                child: Text('Moyo',
                    style: TextStyle(color: Colors.black, fontSize: 24))),
          ),
          Container(
            color: Colors.amber,
            child: Center(
                child: Text('DZ',
                    style: TextStyle(color: Colors.black, fontSize: 24))),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.add),
          label: Text('Open'),
          onPressed: toggelBottomSheet),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  _tabController.index = index;
                  _currentTabIndex = index;
                });
              },
              currentIndex: _currentTabIndex,
              selectedItemColor: Colors.purple,
              items: _tabBar.map((e) {
                return BottomNavigationBarItem(icon: e.icon, label: e.title);
              }).toList()),
        ),
      ),
    );
  }
}

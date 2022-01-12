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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: BottomNavigationBar(
              items: _tabBar.map((e) {
            return BottomNavigationBarItem(icon: e.icon, label: e.title);
          }).toList()
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.camera), label: 'Camera'),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.photo_album), label: 'Photos'),
              // BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat')
              // ],
              ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController tabController;
  int _currentIndex = 0;
  @override
  void initState() {
    tabController =
        TabController(vsync: this, length: 2, initialIndex: _currentIndex);

    tabController.animation
      ..addListener(() {
        int nextIndex = (tabController.animation.value)
            .round(); //tabController.animation.value returns double
        if (nextIndex != _currentIndex) {
          setState(() {
            _currentIndex = nextIndex;
            print('Index: $_currentIndex');
          });
        }
      });
    super.initState();
  }

  exampleChangeIndex() {
    //Go to page index 0
    tabController.index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight),
            child: TabBar(
              controller: tabController,
              tabs: [
                Tab(icon: Icon(Icons.ac_unit), text: 'TAB-A'),
                Tab(icon: Icon(Icons.ac_unit), text: 'TAB-B'),
              ],
            )),
        actions: [_currentIndex == 1 ? Icon(Icons.search) : SizedBox()],
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            child: Center(
              child: Text('AAA'),
            ),
          ),
          Container(
            child: Center(
              child: Text('BBB'),
            ),
          )
        ],
      ),
    );
  }
}

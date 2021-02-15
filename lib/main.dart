import 'package:flutter/material.dart';

// 定数
const kColorDarkGreen = Color(0xff01714e);
const kColorGreen = Color(0xff05986a);
const kColorWhite = Color(0xffffffff);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant Shop App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PlantShopHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class PlantShopHomePage extends StatefulWidget {
  PlantShopHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PlantShopHomePageState createState() => _PlantShopHomePageState();
}

class _PlantShopHomePageState extends State<PlantShopHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}

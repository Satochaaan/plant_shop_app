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
  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorGreen,
        leading: Icon(Icons.arrow_back_ios_rounded),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz_outlined),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.zoom_out_map_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/person.png'),
            label: '',
          ),
        ],
        backgroundColor: kColorDarkGreen,
        selectedItemColor: kColorWhite,
        unselectedItemColor: kColorWhite,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onPageChanged,
      ),
    );
  }
}

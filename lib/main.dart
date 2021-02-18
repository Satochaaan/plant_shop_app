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
        elevation: 0,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _Header(),
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

class _HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height * 0.6)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height,
        size.width,
        size.height * 0.6,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = 400;
    return Container(
      height: height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: _HeaderBackground(height: height),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Column(
                children: [
                  Text(
                    'Our Plants',
                    style: TextStyle(fontSize: 32.0, color: kColorWhite),
                  ),
                  Text(
                    'Lorem Ipsum Dammy Plants',
                    style: TextStyle(fontSize: 16.0, color: kColorWhite),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Price:\$66',
                        style: TextStyle(fontSize: 16.0, color: kColorWhite),
                      ),
                      SizedBox(
                        width: 30,
                        child: Text(
                          "|",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kColorWhite),
                        ),
                      ),
                      Text(
                        'Size: Medium',
                        style: TextStyle(fontSize: 16.0, color: kColorWhite),
                      ),
                      SizedBox(
                        width: 30,
                        child: Text(
                          "|",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kColorWhite),
                        ),
                      ),
                      Text(
                        'Plant: Gimam',
                        style: TextStyle(fontSize: 16.0, color: kColorWhite),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _HeaderBackground extends StatelessWidget {
  final double height;

  const _HeaderBackground({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _HeaderCurveClipper(),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: kColorGreen,
        ),
      ),
    );
  }
}

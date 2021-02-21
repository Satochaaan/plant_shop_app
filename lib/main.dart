import 'package:flutter/material.dart';

// 定数
const kColorDarkGreen = Color(0xff01714e);
const kColorGreen = Color(0xff05986a);
const kColorWhite = Color(0xffffffff);
const kColorSearchField = Color(0xffF0F0F0);

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
    final Size deviceSize = MediaQuery.of(context).size;

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
            Text(
              'Explor More',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              width: deviceSize.width * 0.7,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search |',
                  hintStyle: TextStyle(
                    color: kColorGreen,
                  ),
                  filled: true,
                  fillColor: kColorSearchField,
                  suffixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: kColorGreen,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(28.0),
                    ),
                    borderSide: BorderSide(
                      width: 0,
                      color: kColorSearchField,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(28.0),
                    ),
                    borderSide: BorderSide(
                      width: 0,
                      color: kColorSearchField,
                    ),
                  ),
                ),
              ),
            ),
            _PlantList(),
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

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = 320;
    final Size devideSize = MediaQuery.of(context).size;

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
                    style: TextStyle(
                      fontSize: 32.0,
                      color: kColorWhite,
                      fontWeight: FontWeight.bold,
                    ),
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
          ),
          Positioned(
            left: 0,
            bottom: 35.0,
            child: RaisedButton(
              padding: EdgeInsets.all(17.0),
              child: Icon(Icons.arrow_back_outlined),
              color: kColorDarkGreen,
              textColor: kColorWhite,
              shape: const CircleBorder(
                side: BorderSide(
                  color: kColorDarkGreen,
                  width: 0,
                  style: BorderStyle.solid,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Positioned(
            bottom: -20.0,
            child: SizedBox(
              width: devideSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/gimam.png'),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 35.0,
            child: RaisedButton(
              padding: EdgeInsets.all(17.0),
              child: Icon(Icons.arrow_forward_outlined),
              color: kColorDarkGreen,
              textColor: kColorWhite,
              shape: const CircleBorder(
                side: BorderSide(
                  color: kColorDarkGreen,
                  width: 0,
                  style: BorderStyle.solid,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height * 0.7)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 1.2,
        size.width,
        size.height * 0.7,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
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

class _PlantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 238,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _PlantListTile(),
                _PlantListTile(),
                _PlantListTile(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PlantListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 238,
      width: 165,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 137.0,
              width: 131.0,
              color: kColorGreen,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 131.0,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Gbit Plant',
                    style: TextStyle(
                      color: kColorWhite,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    '\$88',
                    style: TextStyle(
                      color: kColorWhite,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

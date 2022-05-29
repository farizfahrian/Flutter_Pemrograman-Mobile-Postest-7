import 'package:flutter/material.dart';
import 'package:postest7_farizfahrian_1915026033/page/checkout.dart';
import 'package:postest7_farizfahrian_1915026033/page/profile_page.dart';
import 'package:postest7_farizfahrian_1915026033/page/cart_page.dart';
import 'package:postest7_farizfahrian_1915026033/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  List<Widget> pages = <Widget>[
    LandingPage(),
    CartPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (int index) {
          setState(
            () {
              _index = index;
            },
          );
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                border: Border(),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/icon_user.png'),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Hai, Fariz Fahrian",
                    style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    "Selamat Datang",
                    style: grayTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return ListView(children: [
      header(),
      const SizedBox(height: 25),
      Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: const Text(
          "Terlaris",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 20),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            ProductList(),
            ProductList(),
            ProductList(),
            ProductList(),
            ProductList(),
            ProductList(),
            ProductList(),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: const Text(
          "Daftar Sepatu",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 20),
      Expanded(
        child: Column(
          children: <Widget>[
            ProductList2(),
            ProductList2(),
            ProductList2(),
            ProductList2(),
            ProductList2(),
            ProductList2(),
            ProductList2(),
          ],
        ),
      ),
    ]);
  }
}

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details-page');
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: defaultMargin,
          left: 15,
          right: 15,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            // padding: EdgeInsets.only(top: 20),
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              const Text(
                "Ultra 4D 5 Shoes",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                "assets/images/image_shoes2.png",
              ),
              const Text(
                "Rp2.000.000",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ]),
            decoration: const BoxDecoration(
              color: Color(0xffECEDEF),
            ),
            width: 150,
            height: 200,
          ),
        ),
      ),
    );
  }
}

class ProductList2 extends StatelessWidget {
  ProductList2({Key? key}) : super(key: key);

  @override
  var orientation, size, height, width;
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details-page');
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  "Ultra 4D 5 Shoes",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  "assets/images/image_shoes2.png",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rp2.000.000",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) {
                                return CheckoutPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Beli",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xffECEDEF),
            ),
          ),
        ),
        width: width,
        height: 420,
      ),
    );
  }
}

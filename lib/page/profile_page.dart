import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Stack(children: [
        Container(
          color: Colors.blue,
          height: 200,
        ),
        Positioned(
          top: 40,
          right: 0,
          left: 0,
          child: Center(
            child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset("assets/images/image_shoes.png"),
                )),
          ),
        ),
        Positioned(
          top: 150,
          right: 0,
          left: 0,
          child: Text(
            "Fariz Fahrian",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ]),
      Card(
        elevation: 2,
        // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 15),
                Text("Profil Saya"),
              ],
            ),
          ),
        ),
      ),
      Card(
        elevation: 2,
        // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.payment),
                SizedBox(width: 15),
                Text("Daftar Transaksi"),
              ],
            ),
          ),
        ),
      ),
      Card(
        elevation: 2,
        // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Icon(
                  Icons.favorite,
                ),
                SizedBox(width: 15),
                Text("Wishlist"),
              ],
            ),
          ),
        ),
      ),
      Card(
        elevation: 2,
        // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.language),
                SizedBox(width: 15),
                Text("Bahasa/Languange"),
              ],
            ),
          ),
        ),
      ),
      Card(
        elevation: 2,
        // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.help_center),
                SizedBox(width: 15),
                Text("Pusat Bantuan"),
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: 15),
      Text(
        "ShoesApp. All Right Reserved",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
      ),
    ]);
  }
}

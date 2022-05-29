import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:postest7_farizfahrian_1915026033/theme.dart';

class DetailsPage extends StatefulWidget {
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List images = [
    'assets/images/image_shoes2.png',
    'assets/images/image_shoes2.png',
    'assets/images/image_shoes2.png',
  ];

  int currentindex = 0;
  bool isFavoriteList = true;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference carts = firestore.collection("carts");

    Widget indicator(int index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        width: 4,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentindex == index ? mainColor : backgroundColor,
        ),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.chevron_left),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavoriteList = !isFavoriteList;
                    });

                    if (isFavoriteList) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: successColor,
                          content: Text('Telah ditambahkan ke list favorit')));
                    } else {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: alertColor,
                          content: Text('Telah dihapus dari list favorit')));
                    }
                  },
                  child: GestureDetector(
                    child: Icon(
                        isFavoriteList ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: images
                .map(
                  (image) => Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentindex = index;
                  });
                }),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 27),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Ultra 4D 5 Shoes",
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      top: defaultMargin,
                      left: defaultMargin,
                      right: defaultMargin,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deskripsi",
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Segarkan langkahmu dengan Nike Air Max 270 React SE. Ini memiliki fitur warna-warna segar dan bahan tanpa jahitan super bernapas di bagian atas. Ini fitur warna-warna segar dan bahan tanpa jahitan super bernapas di bagian atas. Ini fitur warna-warna segar dan bahan tanpa jahitan super bernapas di bagian atas. Ini fitur warna-warna segar dan bahan tanpa jahitan super bernapas di bagian atas. Ini fitur warna-warna segar dan bahan tanpa jahitan super bernapas di bagian atas. Kaki bawah Nike... Baca selengkapnya",
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget button() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            top: defaultMargin,
            bottom: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 54,
                child: OutlinedButton(
                  onPressed: () {
                    carts.add(
                      {
                        'name': 'Ultra 4D 5 Shoes',
                        'price': 2000000,
                        'imgUrl': 'assets/images/image_shoes2.png'
                      },
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: successColor,
                        content: Text('Telah ditambahkan ke keranjang')));
                  },
                  child: Text("Tambah ke Keranjang"),
                  style: TextButton.styleFrom(
                    primary: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 54,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Beli",
                    style: primaryTextStyle.copyWith(
                        color: Colors.white, fontSize: 16, fontWeight: medium),
                  ),
                  style: TextButton.styleFrom(
                    primary: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: mainColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffECEDEF),
      body: ListView(
        children: [
          header(),
          content(),
          button(),
        ],
      ),
    );
  }
}

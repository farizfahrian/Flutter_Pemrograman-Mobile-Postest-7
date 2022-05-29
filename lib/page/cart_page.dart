import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:postest7_farizfahrian_1915026033/models/product_model.dart';
import 'package:postest7_farizfahrian_1915026033/page/product_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference carts = firestore.collection("carts");

    return Stack(
      children: [
        ListView(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: carts.snapshots(),
              builder: (_, snapshot) {
                return (snapshot.hasData)
                    ? Column(
                        children: snapshot.data!.docs
                            .map(
                              (e) => ProductCard(
                                e.get('name'),
                                e.get('price'),
                                e.get('imgUrl'),
                                onUpdate: () {
                                  carts.doc(e.id).update(
                                    {'quantity': e.get('quantity') + 1},
                                  );
                                },
                                onDelete: () {
                                  carts.doc(e.id).delete();
                                },
                              ),
                            )
                            .toList(),
                      )
                    : Text('Load Carts');
              },
            ),
            SizedBox(height: 150)
          ],
        ),
      ],
    );
  }
}

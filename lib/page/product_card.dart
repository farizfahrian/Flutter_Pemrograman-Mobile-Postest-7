import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final int price;
  final String imgUrl;

  final Function? onUpdate;
  final Function? onDelete;

  ProductCard(this.name, this.price, this.imgUrl,
      {this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
              imgUrl,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                SizedBox(height: 15),
                Text('Rp.$price'),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            width: 60,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  primary: Colors.white,
                ),
                child: Center(
                    child: Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 255, 79, 79),
                )),
                onPressed: () {
                  if (onDelete != null) onDelete!();
                }),
          )
          // IconButton(
          //   onPressed: () {
          //     controller.removeProduct(product);
          //   },
          //   icon: Icon(Icons.remove_circle),
          // ),
          // Text('$quantity'),
          // IconButton(
          //   onPressed: () {
          //     controller.addProduct(product);
          //   },
          //   icon: Icon(Icons.add_circle),
          // ),
        ],
      ),
    );
  }
}

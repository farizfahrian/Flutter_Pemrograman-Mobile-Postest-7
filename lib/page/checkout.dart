import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

enum Size { unknown, small, medium, large, xtraLarge }

class _CheckoutPageState extends State<CheckoutPage> {
  String namaDepan = "", alamat = "";

  final namaDepanController = TextEditingController();
  final alamatController = TextEditingController();

  Size? size = Size.unknown;

  @override
  void dispose() {
    namaDepanController.dispose();
    alamatController.dispose();
    super.dispose();
  }

  String getSize(Size? value) {
    if (value == Size.small) {
      return "Small";
    } else if (value == Size.medium) {
      return "Medium";
    } else if (value == Size.large) {
      return "Large";
    } else if (value == Size.xtraLarge) {
      return "Xtra Large";
    } else
      return "Pilih Ukuran";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text("Nama: ${namaDepan} "),
            Text("Alamat: ${alamat}"),
            Text("Ukuran: ${getSize(size)}"),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 12),
              child: Divider(thickness: 5),
            ),
            TextField(
              controller: namaDepanController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input Nama Anda',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 6,
              controller: alamatController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Input Alamat Anda'),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      'S',
                      style: TextStyle(fontSize: 12),
                    ),
                    horizontalTitleGap: 0,
                    leading: Radio(
                      value: Size.small,
                      groupValue: size,
                      onChanged: (Size? g) {
                        setState(() {
                          size = g;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      'M',
                      style: TextStyle(fontSize: 12),
                    ),
                    horizontalTitleGap: 0,
                    leading: Radio(
                      value: Size.medium,
                      groupValue: size,
                      onChanged: (Size? g) {
                        setState(() {
                          size = g;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      'L',
                      style: TextStyle(fontSize: 12),
                    ),
                    horizontalTitleGap: 0,
                    leading: Radio(
                      value: Size.large,
                      groupValue: size,
                      onChanged: (Size? g) {
                        setState(() {
                          size = g;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      'XL',
                      style: TextStyle(fontSize: 12),
                    ),
                    horizontalTitleGap: 0,
                    leading: Radio(
                      value: Size.xtraLarge,
                      groupValue: size,
                      onChanged: (Size? g) {
                        setState(() {
                          size = g;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  namaDepan = namaDepanController.text;
                  alamat = alamatController.text;
                });
              },
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

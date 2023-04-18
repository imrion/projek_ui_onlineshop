import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:retinol/database/sqf.dart';
import 'package:retinol/models/product.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String formatRupiah(int value) {
  final format = NumberFormat("#,###");
  return 'Rp. ${format.format(value)}';
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isChecked = false;
  DBHelper? dbHelper = DBHelper();
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  int _hitung = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'My Chart',
            style: GoogleFonts.nunito(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Container(
                              width: 100,
                              height: 125,
                              child: Card(
                                margin: EdgeInsets.only(top: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.white,
                                elevation: 5.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        transformAlignment: Alignment.topLeft,
                                        child: Transform.translate(
                                          offset: Offset(-20, -20),
                                          child: Checkbox(
                                            activeColor: Colors.pink,
                                            value: _isChecked,
                                            onChanged: (value) {
                                              setState(() {
                                                _isChecked = value!;
                                              });
                                            },
                                          ),
                                        )),
                                    Container(
                                      child: Row(
                                        children: [
                                          Transform.translate(
                                            offset: Offset(-35, 0),
                                            child: Image(
                                              height: 100,
                                              width: 100,
                                              image: AssetImage(products[index]
                                                  .image
                                                  .toString()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            child: Transform.translate(
                                              offset: Offset(-25, 0),
                                              child: RichText(
                                                maxLines: 2,
                                                text: TextSpan(
                                                  text:
                                                      '${products[index].name.toString()}\n',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Transform.translate(
                                              offset: Offset(-68, 0),
                                              child: RichText(
                                                maxLines: 2,
                                                text: TextSpan(
                                                    text: formatRupiah(
                                                        products[index].price),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black)),
                                              ),
                                            ),
                                          ),
                                          ValueListenableBuilder<int>(
                                            valueListenable: _counter,
                                            builder: (BuildContext context,
                                                int value, Widget? child) {
                                              return Row(
                                                children: [
                                                  Container(
                                                    child: IconButton(
                                                      icon: Icon(
                                                        Icons.remove,
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Transform.translate(
                                                      offset: Offset(-70, 0),
                                                      child: IconButton(
                                                        icon:
                                                            Icon(Icons.remove),
                                                        onPressed: () {
                                                          setState(() {
                                                            _hitung--;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Transform.translate(
                                                      offset: Offset(-60, 0),
                                                      child: Text('$_hitung'),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Transform.translate(
                                                      offset: Offset(-50, 0),
                                                      child: IconButton(
                                                        icon: Icon(Icons.add),
                                                        onPressed: () {
                                                          setState(() {
                                                            _hitung++;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                      transformAlignment:
                                                          Alignment.topLeft,
                                                      child:
                                                          Transform.translate(
                                                        offset: Offset(15, 0),
                                                        child: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              Icons.delete,
                                                            )),
                                                      )),
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        }),
                  ],
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: InkWell(
            child: Card(
          color: Colors.white,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  height: 85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20, right: 30),
                            child: Text(
                              formatRupiah(products[index].price),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange,
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            // padding: EdgeInsets.only(right: 250),
                            child: Text(
                              '${products[index].name.toString()}\n',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: ButtonBar(
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 238, 150, 180)),
                                  ),
                                  onPressed: () {},
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: Text('Checkout',
                                        style: GoogleFonts.poppins(
                                          color: Colors.pink,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        )));
  }
}

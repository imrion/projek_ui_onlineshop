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

// @override
// void initState() {
//   super.initState();
//   context.read<CartProvider>().getData();
// }
// final cart = Provider.of<CartProvider>(context);

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
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Container(
                    width: 100,
                    height: 125,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 5.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    image: AssetImage(
                                        products[index].image.toString()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ),
                                  ),
                                ),
                                ValueListenableBuilder<int>(
                                  valueListenable: _counter,
                                  builder: (BuildContext context, int value,
                                      Widget? child) {
                                    return Row(
                                      children: [
                                        Container(
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _hitung--;
                                              });
                                            },
                                          ),
                                        ),
                                        Container(
                                          child: Transform.translate(
                                            offset: Offset(-70, 0),
                                            child: IconButton(
                                              icon: Icon(Icons.remove),
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
                                            child: Transform.translate(
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
              Column(),
              // Consumer(
              //   builder: (BuildContext context, value, child) {
              //     final ValueNotifier<int?> totalPrice = ValueNotifier(null);
              //   }
              //   ),
        ],
      ),
      // bottomNavigationBar: InkWell(
      //   onTap: () {},
      // ),
    );
  }
}
// return Container(
                //   width: 370,
                //   height: 125,
                //   margin: EdgeInsets.only(bottom: 50),
                //   padding: EdgeInsets.only(left: 15, right: 15),
                //   child: Card(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(15.0),
                //       ),
                //       color: Colors.white,
                //       elevation: 10,
                //       child: Column(
                //         children: [
                //           Container(
                //             alignment: Alignment.centerRight,
                //             child: Row(
                //               children: [
                //                 Checkbox(
                //                   value: _isChecked,
                //                   onChanged: (value) {
                //                     setState(() {
                //                       _isChecked = value!;
                //                     });
                //                   },
                //                 ),
                //                 Container(
                //                   alignment: Alignment.centerLeft,
                //                   child: Image.asset(
                //                     products[index].image.toString(),
                //                     height: 100,
                //                     width: 100,
                //                   ),
                //                 ),
                //                 Column(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     Container(
                //                       alignment: Alignment.centerLeft,
                //                       child: Text(
                //                         '${products[index].name.toString()}\n',
                //                         style: GoogleFonts.poppins(
                //                             fontWeight: FontWeight.normal,
                //                             color: Colors.black,
                //                             fontSize: 15),
                //                       ),
                //                     ),
                //                     Container(
                //                       alignment: Alignment.centerLeft,
                //                       child: Text(
                //                         formatRupiah(products[index].price),
                //                         style: GoogleFonts.poppins(
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 15,
                //                           color: Colors.black,
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //                 ValueListenableBuilder<int>(
                //                   valueListenable: _counter,
                //                   builder: (BuildContext context, int value,
                //                       Widget? child) {
                //                     return Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.center,
                //                       children: [
                //                         IconButton(
                //                           icon: Icon(Icons.remove),
                //                           onPressed: () {
                //                             setState(() {
                //                               _hitung--;
                //                             });
                //                           },
                //                         ),
                //                         Text('$_hitung'),
                //                         IconButton(
                //                           icon: Icon(Icons.add),
                //                           onPressed: () {
                //                             setState(() {
                //                               _hitung++;
                //                             });
                //                           },
                //                         ),
                //                         IconButton(
                //                             onPressed: () {},
                //                             icon: Icon(
                //                               Icons.delete,
                //                             )),
                //                       ],
                //                     );
                //                   },
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ],
                //       )),
                // );
// ValueListenableBuilder<int>(
                                //   valueListenable: provider.cart[index].quantity!, builder: builder)
                                // ValueListenableBuilder<int>(
                                //   valueListenable: _counter,
                                //   builder: (BuildContext context, int value,
                                //       Widget? child) {
                                //     return Text('Counter value: $value');
                                //   },
                                // ),

// return Card(
//                   color: Colors.white,
//                   elevation: 5.0,
//                   // child: Padding(
//                   //   padding: const EdgeInsets.only(top: 50),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     // mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Checkbox(
//                         value: _isChecked,
//                         onChanged: (value) {
//                           setState(() {
//                             _isChecked = value!;
//                           });
//                         },
//                       ),
//                       Image(
//                         height: 80,
//                         width: 80,
//                         image: AssetImage('assets/images/product.jpg'),
//                       ),
//                       SizedBox(
//                         width: 130,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 5.0,
//                             ),
//                             ListTile(
//                               title: Text('Retinol Renewal Serum',
//                               style: GoogleFonts.poppins(color: Colors.black, fontSize: 7)
//                               ),
//                             )
//                             // RichText(
//                             //   overflow: TextOverflow.fade,
//                             //   maxLines: 2,
//                             //   text: TextSpan(
//                             //     text: 'Retinol Renewal Serum',
//                                 // style: GoogleFonts.poppins(color: Colors.black)
//                             //   ),
//                             // )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   // ),
//                 );

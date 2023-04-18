import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:retinol/database/sqf.dart';
import 'package:retinol/models/product.dart';
import 'package:intl/intl.dart';
import 'package:css_colors/css_colors.dart';
import 'package:retinol/page/detailchat.dart';

class DescProduct extends StatefulWidget {
  const DescProduct({super.key});

  @override
  State<DescProduct> createState() => _DescProductState();
}

String formatRupiah(int value) {
  final format = NumberFormat("#,###");
  return 'Rp. ${format.format(value)}';
}

class _DescProductState extends State<DescProduct> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0.0,
        //   backgroundColor: Colors.white,
        //   leading: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back_ios_new,
        //       color: Colors.black,
        //     ),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        //   // title: Image.asset('assets/images/product.jpg'),
        // ),
        body: ListView(
          children: [
            Container(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: 320,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/images/product.jpg"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Container(
                        child: Icon(Icons.arrow_back_ios_new),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CSSColors.lightGrey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Retinol Renewal Serum',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              subtitle: Text(
                'Rp. 130.000',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                    fontSize: 17),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                  SizedBox(
                    width: 7,
                  ),
                  Text('4.0'),
                  SizedBox(
                    width: 7,
                  ),
                  Icon(
                    Icons.circle,
                    size: 7,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    '50 Reviews',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            ListTile(
                title: Text(
                  'Product Info',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  children: [
                    SizedBox(height: 5),
                    Text(
                        'Lorem ipsum dolor sit amet consectetur. Nam volutpat pretium lacinia ut mattis faucibus. Velit velit facilisis cras tellus.'),
                  ],
                )),
            Card(
              child: ListTile(
                  leading: Icon(Icons.file_copy),
                  title: Text('Product Detail',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))),
            ),
            Card(
              child: ListTile(
                  leading: Icon(Icons.how_to_vote_sharp),
                  title: Text('Product Review',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))),
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.add_shopping_cart_outlined,
                                          size: 17,
                                          color: Colors.pink,
                                        ),
                                        SizedBox(width: 5,),
                                        Text('Checkout',
                                            style: GoogleFonts.poppins(
                                              color: Colors.pink,
                                            )),
                                      ],
                                    ),
                                    // child: Text('Checkout',
                                    //     style: GoogleFonts.poppins(
                                    //       color: Colors.pink,
                                    //     )),
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

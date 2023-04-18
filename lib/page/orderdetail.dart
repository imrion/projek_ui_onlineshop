import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:retinol/database/sqf.dart';
import 'package:retinol/models/product.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

String formatRupiah(int value) {
  final format = NumberFormat("#,###");
  return 'Rp. ${format.format(value)}';
}

class _OrderDetailState extends State<OrderDetail> {
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
            'Order Detail',
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Produk',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 17),
                      ),
                    ),
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
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Lokasi Pengiriman',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                        leading: Icon(Icons.location_on_outlined, size: 35),
                        title: Text('Standform Bridge',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('London 45, England'),
                        trailing: TextButton(
                          onPressed: () {},
                          child: Text('Ubah',
                              style: TextStyle(color: Colors.pink)),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://w7.pngwing.com/pngs/31/475/png-transparent-asia-bank-bca-central-indonesian-banks-in-indonesia-logo-badge-icon.png'),
                        ),
                        title: Text('Bank BCA - VA',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        trailing: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Ubah',
                            style: TextStyle(color: Colors.pink),
                          ),
                        )),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Order Info',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ListTile(
                      title: Text('Retinol Renewal Serum'),
                      trailing: Text('Rp. 130,000'),
                    ),
                    ListTile(
                      title: Text('Biaya Pengiriman'),
                      trailing: Text('Rp. 30,000'),
                    ),
                    ListTile(
                      title: Text('Total'),
                      trailing: Text('Rp. 160,000',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                              // formatRupiah(products[index].price),
                              'Rp. 160,000',
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

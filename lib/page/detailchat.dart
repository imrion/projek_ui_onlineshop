import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:retinol/database/sqf.dart';
import 'package:retinol/models/product.dart';
import 'package:intl/intl.dart';
import 'package:css_colors/css_colors.dart';

String logoURL =
    'https://i.pinimg.com/564x/ba/f2/b9/baf2b95b4c351532a3c97732c94b332d.jpg';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(top: 10, left: 5),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 25,
                color: Colors.black,
              ),
            ),
          ),
          leadingWidth: 20,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    logoURL,
                    width: 45,
                    height: 45,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Lee Juyeon',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Dokter Kulit',
                        style: TextStyle(
                            fontSize: 10, color: Colors.grey.withOpacity(.8)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 10, right: 25),
              child: Row(
                children: [
                  Icon(
                    Icons.circle_sharp,
                    size: 10,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Online',
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 100, top: 10),
                child: ClipPath(
                  child: ClipPath(
                    clipper: UpperNipMessageClipperTwo(MessageType.receive),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 25, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Hallo John, Ada yang bisa saya \n bantu?',
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 200),
                            child: Text(
                              '19.00',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(top: 20, left: 80, bottom: 15),
                child: ClipPath(
                  child: ClipPath(
                    clipper: UpperNipMessageClipperTwo(MessageType.send),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 10, top: 10, right: 20, bottom: 10),
                      decoration: BoxDecoration(
                        color: CSSColors.lightGrey,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              ' Hallo Dok, iyaa saya mau konsultasi   \n mengenai wajah saya.'),
                          Container(
                            padding: EdgeInsets.only(left: 200),
                            child: Row(
                              children: [
                                Text(
                                  '19.01',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.check, size: 15, color: Colors.blue),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 80, top: 10),
                child: ClipPath(
                  child: ClipPath(
                    clipper: UpperNipMessageClipperTwo(MessageType.receive),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 25, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Baik, boleh dijelaskan terlebih dahulu apa \n keluhan dan masalahnya?',
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 250),
                            child: Text(
                              '19.02',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(top: 20, left: 80, bottom: 15),
                child: ClipPath(
                  child: ClipPath(
                    clipper: UpperNipMessageClipperTwo(MessageType.send),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 10, top: 10, right: 20, bottom: 10),
                      decoration: BoxDecoration(
                        color: CSSColors.lightGrey,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              ' Iyaa dok jadi sebenernya muka saya ga \n bisa glowing kaya orang orang, dan karena \n ga glowing saya jadi jomblo sulit dapet \n pacar.'),
                          Container(
                            padding: EdgeInsets.only(left: 240),
                            child: Row(
                              children: [
                                Text(
                                  '19.03',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.check, size: 15, color: Colors.blue),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(top: 20, left: 80, bottom: 15),
                child: ClipPath(
                  child: ClipPath(
                    clipper: UpperNipMessageClipperTwo(MessageType.send),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 10, top: 10, right: 20, bottom: 10),
                      decoration: BoxDecoration(
                        color: CSSColors.lightGrey,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              ' Kira-kira ada recomendasi skincare yang \n cocok untuk saya gak dok'),
                          Container(
                            padding: EdgeInsets.only(left: 225),
                            child: Row(
                              children: [
                                Text(
                                  '19.03',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.check, size: 15, color: Colors.blue),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 80, top: 10),
                child: ClipPath(
                  child: ClipPath(
                    clipper: UpperNipMessageClipperTwo(MessageType.receive),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 25, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/product.jpg',
                            width: 270,
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 10,),
                          Container(
                            padding: EdgeInsets.only(left: 250),
                            child: Text(
                              '19.02',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        child: ListTile(
          leading: IconButton(
            icon: Icon(Icons.add, color: Colors.black, size: 30),
            onPressed: () {},
          ),
          title: Container(
            // width: 325,
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: CSSColors.lightGrey,
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: CircleAvatar(
                      backgroundColor: Colors.pink,
                      child: Container(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.mic,
                              color: Colors.purple,
                            )),
                      ),
                    ),
                    hintText: '   Ketik disini',
                    border: InputBorder.none),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

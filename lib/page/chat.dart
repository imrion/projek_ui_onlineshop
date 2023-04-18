import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:retinol/database/sqf.dart';
import 'package:retinol/models/product.dart';
import 'package:intl/intl.dart';
import 'package:css_colors/css_colors.dart';
import 'package:retinol/page/detailchat.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // The search area here
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
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search',
                  border: InputBorder.none),
            ),
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.pink,
            child: Container(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.chat_outlined,
                    color: Colors.purple,
                  )),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 5, top: 5),
                      child: Card(
                        margin: EdgeInsets.only(top: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        elevation: 5.0,
                        child: ListTile(
                          leading: Image.network(
                            'https://i.pinimg.com/564x/ba/f2/b9/baf2b95b4c351532a3c97732c94b332d.jpg',
                            cacheHeight: 100,
                            cacheWidth: 100,
                          ),
                          title: Text(
                            "Dr. Lee Juyeon",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Lorem ipsum dolor sit amet...'),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '19.00',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.check, color: Colors.blue,)
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return ChatPage();
                              }),
                            );
                          },
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.1,
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

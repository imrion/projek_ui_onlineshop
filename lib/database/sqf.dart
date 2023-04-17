import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:retinol/models/cart.dart';
import 'package:retinol/models/item.dart';

class DBHelper {
 static Database? _database;

 Future<Database?> get database async {
   if (_database != null) {
     return _database!;
   }
   _database = await initDatabase();
   return null;
 }

 initDatabase() async {
   io.Directory directory = await getApplicationDocumentsDirectory();
   String path = join(directory.path, 'cart.db');
   var db = await openDatabase(path, version: 1, onCreate: _onCreate);
   return db;
 }
// creating database table
 _onCreate(Database db, int version) async {
   await db.execute(
       'CREATE TABLE cart(id INTEGER PRIMARY KEY, productId VARCHAR UNIQUE, productName TEXT, initialPrice INTEGER, productPrice INTEGER, quantity INTEGER, unitTag TEXT, image TEXT)');
 }
// inserting data into the table
 Future<Cart> insert(Cart cart) async {
   var dbClient = await database;
   await dbClient!.insert('cart', cart.toMap());
   return cart;
 }
// getting all the items in the list from the database
 Future<List<Cart>> getCartList() async {
   var dbClient = await database;
   final List<Map<String, Object?>> queryResult =
       await dbClient!.query('cart');
   return queryResult.map((result) => Cart.fromMap(result)).toList();
 }
// Future<int> updateQuantity(Cart cart) async {
//  var dbClient = await database;
//  return await dbClient!.update('cart', cart.quantityMap(),
//      where: "productId = ?", whereArgs: [cart.productId]);
// }

// deleting an item from the cart screen
 Future<int> deleteCartItem(int id) async {
   var dbClient = await database;
   return await dbClient!.delete('cart', where: 'id = ?', whereArgs: [id]);
 }
}

class CartProvider with ChangeNotifier {
 DBHelper dbHelper = DBHelper();
 int _counter = 0;
 int _quantity = 1;
 int get counter => _counter;
 int get quantity => _quantity;

 double _totalPrice = 0.0;
 double get totalPrice => _totalPrice;

 List<Cart> cart = [];

 Future<List<Cart>> getData() async {
   cart = await dbHelper.getCartList();
   notifyListeners();
   return cart;
 }

 void _setPrefsItems() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setInt('cart_items', _counter);
   prefs.setInt('item_quantity', _quantity);
   prefs.setDouble('total_price', _totalPrice);
   notifyListeners();
 }

 void _getPrefsItems() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   _counter = prefs.getInt('cart_items') ?? 0;
   _quantity = prefs.getInt('item_quantity') ?? 1;
   _totalPrice = prefs.getDouble('total_price') ?? 0;
 }

 void addCounter() {
   _counter++;
   _setPrefsItems();
   notifyListeners();
 }

 void removeCounter() {
   _counter--;
   _setPrefsItems();
   notifyListeners();
 }

 int getCounter() {
   _getPrefsItems();
   return _counter;
 }

 void addQuantity(int id) {
   final index = cart.indexWhere((element) => element.id == id);
   cart[index].quantity!.value = cart[index].quantity!.value + 1;
   _setPrefsItems();
   notifyListeners();
 }

 void deleteQuantity(int id) {
   final index = cart.indexWhere((element) => element.id == id);
   final currentQuantity = cart[index].quantity!.value;
   if (currentQuantity <= 1) {
     currentQuantity == 1;
   } else {
     cart[index].quantity!.value = currentQuantity - 1;
   }
   _setPrefsItems();
   notifyListeners();
 }

 void removeItem(int id) {
   final index = cart.indexWhere((element) => element.id == id);
   cart.removeAt(index);
   _setPrefsItems();
   notifyListeners();
 }

 int getQuantity(int quantity) {
   _getPrefsItems();
   return _quantity;
 }

 void addTotalPrice(double productPrice) {
   _totalPrice = _totalPrice + productPrice;
   _setPrefsItems();
   notifyListeners();
 }

 void removeTotalPrice(double productPrice) {
   _totalPrice = _totalPrice - productPrice;
   _setPrefsItems();
   notifyListeners();
 }

 double getTotalPrice() {
   _getPrefsItems();
   return _totalPrice;
 }
}
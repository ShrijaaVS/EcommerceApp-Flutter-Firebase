import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class CartItems {
  String productId = '';
  int price = 0;
  int quantitySelected = 0;

  CartItems({required this.productId, required this.price, required this.quantitySelected});

  Map<String, dynamic> toMap() {
    return {
      'productid': productId,
      'price': price,
      'quantitySelected': quantitySelected,
    };
  }

}
List<CartItems> cartItems = [];

List<String> uniqueResult = [];

void sendDataToFireBase(int totalPrice, int totalQuantity) async {
  CollectionReference cart = FirebaseFirestore.instance.collection('order-details');
  String orderId = generateUniqueAlphanumericString(5);
  List<Map<String, dynamic>> itemsMapList = cartItems.map((item) => item.toMap()).toList();
  await cart.doc(orderId).set({
    'orderId': orderId,
    'items': itemsMapList,
    'totalPrice': totalPrice,
    'TotalNumberOfOrderedItems': totalQuantity,
    'timestamp': DateTime.now(),
  }).then((value) {
    cartItems = [];
    // print('Order successfully placed');


  }).catchError((error) {
    cartItems = [];
    // print(error);
  });
}

String generateUniqueAlphanumericString(int length) {
  final Random random = Random();
  const String characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  String result = '';

  for (int i = 0; i < length; i++) {
    final int randIndex = random.nextInt(characters.length);
    result += characters[randIndex];
  }

  if (uniqueResult.contains(result)) {
    result = generateUniqueAlphanumericString(length);
  }

  uniqueResult.add(result);
  return result;
}

// void receiveDataFromDatabase(String orderId) async {
//   CollectionReference cart = FirebaseFirestore.instance.collection('order-details');
//
//   cart.doc(orderId).get().then((DocumentSnapshot documentSnapshot) {
//     if (documentSnapshot.exists) {
//       // Document exists, retrieve the data
//       Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
//       // Process the data as needed
//       print(data);
//     } else {
//       // Document does not exist
//       print('Document does not exist');
//     }
//   }).catchError((error) {
//     // Error occurred while fetching the document
//     print('Error getting document: $error');
//   });
// }
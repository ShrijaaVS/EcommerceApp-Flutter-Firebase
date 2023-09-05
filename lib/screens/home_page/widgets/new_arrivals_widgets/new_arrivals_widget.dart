
import 'package:ecommerceapp/screens/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/app_resources/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
String documentId = '';

class Product {
  String productBrand;
  String productImage;
  String productName;
  String productPrice;
  String productBrand1;
  String productImage1;
  String productName1;
  String productPrice1;

  Product({
    required this.productBrand,
    required this.productImage,
    required this.productPrice,
    required this.productName,
    required this.productBrand1,
    required this.productImage1,
    required this.productPrice1,
    required this.productName1,
  });
}

class Products {
  String productBrand = '';
  String productImage = '';
  String productName = '';
  int productPrice = 0;
  String productDesc1 = "";
  String productDesc2 = "";
  String productDesc3 = "";
  int numberOfProductsSelected = 0;

  Products({
    required this.productPrice,
    required this.productName,
    required this.productImage,
    required this.productBrand,
    required this.productDesc3,
    required this.productDesc2,
    required this.productDesc1,
    required this.numberOfProductsSelected,
  });
}

class NewArrivals extends StatefulWidget {
  const NewArrivals({Key? key}) : super(key: key);

  @override
  NewArrivalsState createState() => NewArrivalsState();
}

class NewArrivalsState extends State<NewArrivals> {
  List<Product> products = [];
  List<Products> products1 = [];

  @override
  void initState() {
    super.initState();
    fetchSlideData();
    fetchSlideDataProducts();
  }

  Future<void> fetchSlideData() async {
    final snapshot = await firestore.collection('new-arrivals-details').get();
    setState(() {
      products = snapshot.docs.map((doc) {
        documentId = doc.id;
        final brand = doc.get('productBrand') as String;
        final image = doc.get('productImage') as String;
        final name = doc.get('productName') as String;
        final price = doc.get('productPrice') as String;
        final brand1 = doc.get('productBrand1') as String;
        final image1 = doc.get('productImage1') as String;
        final name1 = doc.get('productName1') as String;
        final price1 = doc.get('productPrice2') as String;
        return Product(
          productBrand: brand,
          productImage: image,
          productName: name,
          productPrice: price,
          productBrand1: brand1,
          productImage1: image1,
          productName1: name1,
          productPrice1: price1,
        );
      }).toList();
    });
  }

  Future<void> fetchSlideDataProducts() async {
    final snapshot = await firestore.collection('productDetails').get();
    setState(() {
      products1 = snapshot.docs.map((doc) {
        final brand = doc.get('productBrand') as String;
        final image = doc.get('productImage') as String;
        final name = doc.get('productName') as String;
        final price = doc.get('productPrice') as int;
        final productdesc1 = doc.get('productDesc1') as String;
        final productdesc2 = doc.get('productDesc2') as String;
        final productdesc3 = doc.get('productDesc3') as String;
        final number = doc.get('numberOfProductsSelected');

        return Products(
          productBrand: brand,
          productImage: image,
          productName: name,
          productPrice: price,
          productDesc1: productdesc1,
          productDesc2: productdesc2,
          productDesc3: productdesc3,
          numberOfProductsSelected: number,
        );
      }).toList();
    });
  }
  var size=const Size(0, 0);
  var height=0.0;
  var width=0.0;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child:
      ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        primary: false,
        itemBuilder: (context, index) {
          // final product = products1[index];
          // final product1 = products1[index + 1];
          return Column(
            children: [
              Row(
                children: [
                  Hero(
                    tag: 'productImage_$index',
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              products: products1[index],
                              tagName: 'productImage_$index',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: products[index].productImage.isNotEmpty
                                ? NetworkImage(products[index].productImage) as ImageProvider<Object>
                                : const AssetImage('assets/images/shoe.jpg'),
                          ),
                        ),
                        height: height/(4.6),
                        width: width/(2.3),
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, right: 5.0),
                          child: FractionallySizedBox(
                            heightFactor: 0.2,
                            widthFactor: 0.2,
                            child: FloatingActionButton(
                              onPressed: () {},
                              heroTag: null,
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              child: const Icon(Icons.favorite_outline, size: 14.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              SizedBox(width: width/30),
                  Hero(
                    tag: 'productImage_${index + 2}',
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              products: products1[index+1],
                              tagName: 'productImage_${index + 2}',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: products[index].productImage1.isNotEmpty
                                ? NetworkImage(products[index].productImage1) as ImageProvider<Object>
                                : const AssetImage('assets/images/shoe.jpg'),
                          ),
                        ),
                        height: height/(4.6),
                        width: width/(2.3),
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, right: 5.0),
                          child: FractionallySizedBox(
                            heightFactor: 0.2,
                            widthFactor: 0.2,
                            child: FloatingActionButton(
                              heroTag: null,
                              onPressed: () {},
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              child: const Icon(Icons.favorite_outline, size: 14.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        products[index].productBrand,
                        style: kdetailsStyle,
                      ),
                      Text(
                        products[index].productName,
                        style: kdeStyle,),

                      Text(
                        products[index].productPrice,
                        style: kdetailsStyle,
                      ),
                    ],
                  ),
                  SizedBox(width: width/6),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        products[index].productBrand1,
                        style: kdetailsStyle,
                      ),
                      Text(
                        products[index].productName1,
                        style: kdeStyle,
                      ),
                      Text(
                        products[index].productPrice1,
                        style: kdetailsStyle,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height/50),
            ],
          );
        },
      ),
    );
  }
}

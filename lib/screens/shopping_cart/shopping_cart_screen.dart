import 'package:ecommerceapp/app_resources/constants.dart';
import 'package:ecommerceapp/screens/shopping_cart/widgets/dismissible_cart_item_widget.dart';
import 'package:ecommerceapp/screens/checkout_payment//order_confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ecommerceapp/app_resources/lottie_animations.dart';


import '../../repositories/shopping_cart/shopping_cart_repository.dart';



ValueNotifier<int> numberOfCartItems = ValueNotifier(0);
ValueNotifier<double> totalPrice = ValueNotifier(0);

class ShoppingCart extends StatefulWidget {
  final PageController pageController;

  const ShoppingCart({Key? key, required this.pageController}) : super(key: key);

  @override
  State<ShoppingCart> createState() => ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCart> {
  late final ScrollController scrollController;
  late final TextEditingController _promoCodeController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    _promoCodeController = TextEditingController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    _promoCodeController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView(
        controller: scrollController,
        children: [
          if (items.value.isEmpty)
            buildEmptyCartAnimation()
    else
            Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 18,
                right: 25.0,
                bottom: 34.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Padding(padding: EdgeInsets.only(left:10.0),child:
                        Text('My Cart', style: kmajortextStyle))],
                      ),
                       const Spacer(),
                      Stack(
                        children: [
                          FloatingActionButton(
                            mini: true,
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              size: 20.0,
                            ),
                            onPressed: () {},
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 17.0,
                              height: 17.0,
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: ValueListenableBuilder<int>(
                                  valueListenable: numberOfCartItems,
                                  builder: (context, value, _) {
                                    return Text(
                                      '$value',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // const SizedBox(height: 15.0),

                  SizedBox(height: MediaQuery.of(context).size.height/40),//10.0
              SizedBox(
                    child: ValueListenableBuilder<List<Widget>>(
                      valueListenable: items,
                      builder: (context, value, child) {
                        return const DismissibleShoppingCartItems();
                      },
                    )

                  ),
    SizedBox(height: MediaQuery.of(context).size.height/30),
                  TextFormField(
                    style: klabelStyle,
                    controller: _promoCodeController,
                    validator: null,

                    decoration: InputDecoration(

                      contentPadding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Promo Code",
                      hintStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black26,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20.0,left: 5.0),
                        child: Container(
                          height: 33.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: Colors.black,
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Apply',
                              style: TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        maxWidth: 90.0,
                        maxHeight: 80.0,
                      ),
                    ),
                    onChanged: (value) => {},
                  ),
    SizedBox(height: MediaQuery.of(context).size.height/20),
                ],
              ),
            ),
        ],
      ),
   persistentFooterButtons:

       [Padding(
         padding: const EdgeInsets.only(left: 15.0,right:10.0),
         child:Row(
        children: [
          ValueListenableBuilder<int>(
            valueListenable: numberOfCartItems,
            builder: (context, value, _) {
              return Text(
                'Total ($value items) :',
                style: kloginpagetext,
              );
            },
          ),
          const Spacer(),
          ValueListenableBuilder<double>(
            valueListenable: totalPrice,
            builder: (context, value, _) {
              return Text(
                '\$$value',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              );
            },
          )
        ],
      ),),
    SizedBox(height: MediaQuery.of(context).size.height/90),
      SizedBox(
        height: 55.0,
        width: 400.0,
        child: FloatingActionButton.extended(
          heroTag: null,
          extendedPadding: const EdgeInsets.only(left: 25.0, right: 25.0),
          onPressed: () {
            sendDataToFireBase(totalPrice.value.toInt(),numberOfCartItems.value.toInt());
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OrderSuccessful()),
            );
          },
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Proceed to Checkout',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 115.0,),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Icon(FontAwesomeIcons.caretRight, color: Colors.black, size: 25.0,),
                ),
              ),
            ],
          ),
        ),
      ),
   ] );
  }
}


import 'package:ecommerceapp/repositories/shopping_cart/shopping_cart_repository.dart';

import 'package:ecommerceapp/screens/shopping_cart/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ecommerceapp/app_resources/constants.dart';
import '../../home_page/widgets/new_arrivals_widgets/new_arrivals_widget.dart';
import 'dismissible_cart_item_widget.dart';

class ShoppingCartItems extends StatefulWidget {
  late int numberOfSelected;
  Products products;

  ShoppingCartItems({
    Key? key,
    required this.numberOfSelected,
    required this.products,
  }) : super(key: key);

  @override
  State<ShoppingCartItems> createState() => ShoppingCartItemsState();
}

class ShoppingCartItemsState extends State<ShoppingCartItems> {
  // late ShoppingCartBloc shoppingCartBloc;

  @override
  void initState() {
    super.initState();
    // shoppingCartBloc = BlocProvider.of<ShoppingCartBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      width: double.infinity, // Adjusted to take the full width of the screen
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10.0,
            spreadRadius: 0.5,
            offset: const Offset(-0.5, -0.5),
          ),
        ],
      ),
      child: Row( // Changed to Row to enable responsive layout
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4, // Adjusted flex to allocate appropriate space for image and details
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                    image: widget.products.productImage.isNotEmpty
                        ? NetworkImage(widget.products.productImage) as ImageProvider<Object>
                        : const AssetImage('assets/images/image.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5, // Adjusted flex to allocate appropriate space for details and buttons
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.products.productBrand,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.products.productName,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black45,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      Text(
                        '\$${widget.products.productPrice}.00',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 19,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4, // Adjusted flex to allocate appropriate space for buttons
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5.0,right: 5.0),
              child: Column(
                children: [
                  const SizedBox(height: 75.0),
                  Container(
                    padding: EdgeInsets.zero,
                    height: 45.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30.0,
                          width: 30.0,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (widget.numberOfSelected > 0) {
                                  totalPrice.value -= widget.products.productPrice;
                                  widget.numberOfSelected--;
                                  itemStocks[items.value.indexOf(widget)] = widget.numberOfSelected;
                                  cartItems[items.value.indexOf(widget)].quantitySelected = widget.numberOfSelected;
                                }
                              });
                            },
                            style: kplusbuttonstyle,
                            child: const Icon(
                              FontAwesomeIcons.minus,
                              size: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30.0,
                          child: Center(
                            child: Text(
                              widget.numberOfSelected.toString(),
                              style: klabelSStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                          width: 30.0,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                widget.numberOfSelected++;
                                totalPrice.value += widget.products.productPrice;
                                itemStocks[items.value.indexOf(widget)] = widget.numberOfSelected;
                                cartItems[items.value.indexOf(widget)].quantitySelected = widget.numberOfSelected;
                              });
                            },
                            style: kplusbuttonstyle,
                            child: const Icon(
                              FontAwesomeIcons.plus,
                              size: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

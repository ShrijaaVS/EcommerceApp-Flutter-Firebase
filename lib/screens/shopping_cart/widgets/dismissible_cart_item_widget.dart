
import 'package:ecommerceapp/app_resources/constants.dart';
import 'package:ecommerceapp/screens/shopping_cart/shopping_cart_screen.dart';
import 'package:ecommerceapp/screens/shopping_cart/widgets/shopping_cart_items_widget.dart';
import 'package:flutter/material.dart';

ValueNotifier<List<Widget>> items = ValueNotifier([]);
List<int> itemStocks = [];

class DismissibleShoppingCartItems extends StatefulWidget {
  const DismissibleShoppingCartItems({Key? key}) : super(key: key);

  @override
  State<DismissibleShoppingCartItems> createState() => DismissibleShoppingCartItemsState();
}

class DismissibleShoppingCartItemsState extends State<DismissibleShoppingCartItems> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.builder(
          itemCount: items.value.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = items.value[index];
            final products = items.value[index] as ShoppingCartItems;
            final productDetails = products.products;

            return Dismissible(
              direction: DismissDirection.endToStart,
              key: UniqueKey(),
              onDismissed: (direction) {
                setState(() {
                  numberOfCartItems.value--;
                  totalPrice.value -= (itemStocks[index] * productDetails.productPrice);
                  items.value.removeAt(index);
                  itemStocks.removeAt(index);
                });
              },
              confirmDismiss: (direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Confirm',
                        style: kaddStyle,
                      ),
                      content: const Text(
                        'Are you sure you want to dismiss this item?',
                        style: kaddStyle,
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text(
                            'Dismiss',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    );
                  },
                );
              },
              background: Container(
                color: Colors.green,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20.0),
                child: const Icon(Icons.archive),
              ),
              secondaryBackground: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Colors.black,
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20.0),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
              child: SizedBox(
                width: constraints.maxWidth, // Adjusted to take the full width available
                child: ListTile(
                  title: item,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

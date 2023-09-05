import 'package:ecommerceapp/app_resources/constants.dart';
import 'package:ecommerceapp/repositories/shopping_cart/shopping_cart_repository.dart';
import 'package:ecommerceapp/screens/shopping_cart/widgets/shopping_cart_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ecommerceapp/screens/shopping_cart/widgets/dismissible_cart_item_widget.dart';
import 'package:ecommerceapp/screens/shopping_cart/shopping_cart_screen.dart';


import 'package:ecommerceapp/screens/home_page/widgets/new_arrivals_widgets/new_arrivals_widget.dart';

int numberOfProductItems=0;
double itemPrice=198.00;

class ProductDetails extends StatefulWidget{
  Products products ;
  String tagName;
   ProductDetails({super.key,required this.products,required this.tagName});

  @override
  State<ProductDetails> createState() => ProductDetailsState();

}
class ProductDetailsState extends State<ProductDetails>{

  @override
  void initState() {
    super.initState();

  }



  bool iszero=true;

  List<bool> sizePressed=[false,false,false,false,false];
  List<bool> colorPressed=[false,false,false,false];
  void _incrementStock(){
    numberOfProductItems++;
    iszero=false;

  }
  void _decrementStock(){
    if(numberOfProductItems>0) {
      numberOfProductItems--;
      iszero=false;
    }

    if(numberOfProductItems==0){
      iszero = true;
    }
  }
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body:Column(
        children: [
          Stack(
            children: [
             Hero(tag:widget.tagName,child:Container(
                decoration:  BoxDecoration(
                  image: DecorationImage(
                      image:widget.products.productImage.isNotEmpty
                          ? NetworkImage(widget.products.productImage) as ImageProvider<Object>
                          : const AssetImage('assets/images/image.jpg'),
                      fit: BoxFit.cover
                  ),
                ),
              height: 523,
                child:
                Padding(padding:const EdgeInsets.only(top:40.0,left: 15.0,right:20.0,bottom: 60.0),
                  child:Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FloatingActionButton(
                            mini:true,
                            heroTag: null,
                            backgroundColor: Colors.black,
                            child: const Icon(FontAwesomeIcons.caretLeft,size: 20.0,),
                            onPressed: (){
                              Navigator.pop(context);
                            }),
                        const Spacer(),
                        FloatingActionButton(
                            mini:true,
                            heroTag: null,
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            child: const Icon(Icons.shopping_bag_outlined,size: 20.0,),

                            onPressed: (){}
                        ),
                      ],
                    ),

                    const Spacer(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:[FloatingActionButton(
                            mini:true,
                            heroTag:null,
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            child: const Icon(Icons.favorite_border_rounded,size: 20.0,),
                            onPressed: (){}
                        ),])

                  ],),),
              ),),


              Padding(padding: const EdgeInsets.only(top:475.0)
                ,child:Container(
                height: 418,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),topRight: Radius.circular(40.0)),
                  color: Colors.white,

                ),
                  child: Column(children:[
                    Padding(padding: const EdgeInsets.only(right:20.0,left: 25.0,top:20.0),
                      child:Row(
                    children: [
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(widget.products.productBrand,style: ksizetextStyle,),
                          Text(widget.products.productName,style: kdescStyle,),
                          const SizedBox(height:5.0),
                          const Row(
                            children: [
                            Icon(Icons.star,color: Colors.amber,),
                            Icon(Icons.star,color: Colors.amber,),
                            Icon(Icons.star,color: Colors.amber,),
                            Icon(Icons.star,color: Colors.amber,),
                            Icon(Icons.star,color: Colors.amber,),
                              SizedBox(width:10.0),
                              Text('(320 Reviews)',style: kerrormsgStyle,)
                          ],)

                        ]
                      ),
                      // const SizedBox(width: 34.5,),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Visibility(visible : iszero==false?true:false ,
                            replacement: SizedBox(height:45.0,width:90.0,
                              child:FloatingActionButton.extended(
                                heroTag: null,
                                enableFeedback: true,
                                onPressed: () {
                                  HapticFeedback.mediumImpact();
                                  setState(() {
                                  iszero=false;numberOfProductItems=1;
                                }); },
                                backgroundColor: Colors.grey.shade200,
                                foregroundColor: Colors.black,
                                elevation:0.0,
                                label:const Text('Add',style: kaddStyle,)
                            ),),child:Container(
                            padding: EdgeInsets.zero,
                            height: 45.0,
                            width:100.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(40.0)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                 SizedBox(height: 30.0,width:30.0,
                                   child:
                                     TextButton(onPressed: (){
                                     setState(() {
                                       _decrementStock();
                                     });

                                   },style: kplusbuttonstyle,
                                    child: const Icon(FontAwesomeIcons.minus,size: 15.0,
                                      color: Colors.black,),
                                ),),
                            SizedBox(width:30.0,
                              child:Center(child:Text(numberOfProductItems.toString(),style: klabelSStyle,),),),
                                SizedBox(height: 30.0,width:30.0,
                              child: TextButton(onPressed: (){
                                setState(() {
                                  _incrementStock();
                                });

                              },
                                style: kplusbuttonstyle,
                                  child: const Icon(FontAwesomeIcons.plus,size: 15.0,
                                    color: Colors.black,),
                                ),),

                              ],
                            ),
                          ),),
                          const SizedBox(height: 5.0,),
                          const Text('Available in Stock',style: klabelsStyle,)
                        ],
                      )

                    ],
                  ),
                  ),
                    SizedBox(height: MediaQuery.of(context).size.height/60),//10.0
                    Padding(padding: const EdgeInsets.only(right:25.0,left: 25.0),
                  child:Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                           // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children:[
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             // mainAxisAlignment: MainAxisAlignment.start,
                             children:[
                                const Padding(padding: EdgeInsets.only(top:15.0),child:
                              Text('Size',style: ksizetextStyle,),),
                               Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width:50.0, height:50.0, child:TextButton(onPressed: (){
                                  setState(() {
                                    if(sizePressed[0]==false) {
                                      sizePressed[0]=true;
                                    }
                                    else{
                                      sizePressed[0]=false;
                                    }
                                    sizePressed[1]=sizePressed[2]=sizePressed[3]=sizePressed[4]=false;
                                  });
                                },
                                  style: sizePressed[0]==true?ksizeButtonPressedStyle:ksizeButtonUnpressedStyle,
                                child: const Text('S',),),),
                                const SizedBox(width: 10.0,),
                                SizedBox(width:50.0, height:50.0, child:TextButton(onPressed: (){
                                  setState(() {
                                    if(sizePressed[1]==false) {
                                      sizePressed[1]=true;
                                    }
                                    else{
                                      sizePressed[1]=false;
                                    }
                                    sizePressed[0]=sizePressed[2]=sizePressed[3]=sizePressed[4]=false;
                                  });
                                },
                                  style: sizePressed[1]==true?ksizeButtonPressedStyle:ksizeButtonUnpressedStyle,

                                  child: const Text('M'),),),
                                const SizedBox(width: 10.0,),
                                SizedBox(width:50.0, height:50.0, child:TextButton(onPressed: (){
                                  setState(() {
                                    if(sizePressed[2]==false) {
                                      sizePressed[2]=true;
                                    }
                                    else{
                                      sizePressed[2]=false;
                                    }
                                    sizePressed[1]=sizePressed[0]=sizePressed[3]=sizePressed[4]=false;
                                  });
                                },
                                  style: sizePressed[2]==true?ksizeButtonPressedStyle:ksizeButtonUnpressedStyle,
                                  child: const Text('L'),),),
                                const SizedBox(width: 10.0,),
                                SizedBox(width:50.0, height:50.0, child:TextButton(onPressed: (){
                                  setState(() {
                                    if(sizePressed[3]==false) {
                                      sizePressed[3]=true;
                                    }
                                    else{
                                      sizePressed[3]=false;
                                    }
                                    sizePressed[1]=sizePressed[2]=sizePressed[0]=sizePressed[4]=false;
                                  });
                                },
                                  style: sizePressed[3]==true?ksizeButtonPressedStyle:ksizeButtonUnpressedStyle,
                                  child: const Text('XL'),),),
                                const SizedBox(width: 10.0,),
                                SizedBox(width:50.0, height:50.0, child:TextButton(onPressed: (){
                                  setState(() {

                                    if(sizePressed[4]==false) {
                                      sizePressed[4]=true;
                                    }
                                    else{
                                      sizePressed[4]=false;
                                    }
                                    sizePressed[1]=sizePressed[2]=sizePressed[3]=sizePressed[0]=false;
                                  });
                                },
                                  style: sizePressed[4]==true?ksizeButtonPressedStyle:ksizeButtonUnpressedStyle,
                                  child: const Text('XLL'),),),
                              ],
                            ),
                               const SizedBox(height:20.0),
                               const Text('Description',style:ksizetextStyle),
                             ],
                           ),
                               const SizedBox(width: 38.5,),

                             Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                                 children:[Container(
                               height:150.0,
                               width: 45.0,
                               decoration: BoxDecoration(
                                   // shape: BoxShape.rectangle,
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(40.0),
                                 // border: Border.all(color: Colors.black),
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.grey.withOpacity(0.3),
                                     blurRadius: 10.0,
                                     spreadRadius: 0.5,
                                     offset: const Offset(-0.5,
                                         -0.5), // Adjust the offset to control the shadow position
                                   ),
                                 ],

                               ),
                               child:Padding(padding:const EdgeInsets.only(top:10.0),child:Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   SizedBox(width:25.0, height:25.0, child:TextButton(onPressed: (){
                                     setState(() {
                                       if(colorPressed[0]==false) {
                                         colorPressed[0]=true;
                                       }
                                       else{
                                         colorPressed[0]=false;
                                       }
                                       colorPressed[1]=colorPressed[2]=colorPressed[3]=false;
                                     });
                                   },
                                     style:  ButtonStyle(
                                         backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                         shape:  MaterialStateProperty.all<CircleBorder>(
                                             CircleBorder(
                                               side:BorderSide(color: Colors.grey.shade200),
                                             )
                                         ),
                                         fixedSize:MaterialStateProperty.all<Size>(const Size(2.0, 2.0)),

                                     ),
                                     child: colorPressed[0] == true
                                         ? const Icon(Icons.check, size: 10.0,color: Colors.black,)
                                         : Container(),
                                     ),),
                                   const SizedBox(height: 10.0,),
                                   SizedBox(width:25.0, height:25.0, child:TextButton(onPressed: (){
                                     setState(() {
                                       if(colorPressed[1]==false) {
                                         colorPressed[1]=true;
                                       }
                                       else{
                                         colorPressed[1]=false;
                                       }
                                       colorPressed[0]=colorPressed[2]=colorPressed[3]=false;
                                     });
                                   },
                                     style: ButtonStyle(
                                         backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                         shape:  MaterialStateProperty.all<CircleBorder>(
                                           CircleBorder(
                                               side:BorderSide(color: Colors.grey.shade200),
                                             )
                                         ),
                                     ),

                                     child: colorPressed[1] == true ? const Icon(Icons.check, size: 10.0,color: Colors.white,) : Container(),),),
                                   const SizedBox(height: 10.0,),
                                   SizedBox(width:25.0, height:25.0, child:TextButton(onPressed: (){
                                     setState(() {
                                       if(colorPressed[2]==false) {
                                         colorPressed[2]=true;
                                       }
                                       else{
                                         colorPressed[2]=false;
                                       }
                                       colorPressed[1]=colorPressed[0]=colorPressed[3]=false;
                                     });
                                   },
                                     style:ButtonStyle(
                                         backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade200),
                                         shape:  MaterialStateProperty.all<CircleBorder>(
                                             CircleBorder(
                                               side:BorderSide(color: Colors.grey.shade200),
                                             )
                                         ),

                                     ),
                                     child:colorPressed[2] == true
                                         ?  const Icon(Icons.check, size: 10.0,color: Colors.black,)
                                         : Container(),),),
                                   const SizedBox(height: 10.0,),
                                   SizedBox(width:25.0, height:25.0, child:TextButton(onPressed: (){
                                     setState(() {
                                       if(colorPressed[3]==false) {
                                         colorPressed[3]=true;
                                       }
                                       else{
                                         colorPressed[3]=false;
                                       }
                                       colorPressed[1]=colorPressed[0]=colorPressed[2]=false;
                                     });
                                   },
                                     style:ButtonStyle(
                                         backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                                         shape:  MaterialStateProperty.all<CircleBorder>(
                                              CircleBorder(
                                               side:BorderSide(color: Colors.grey.shade200),
                                             )
                                         ),

                                     ),
                                     child:colorPressed[3] == true
                                         ? const Icon(Icons.check, size: 10.0,color: Colors.black,)
                                         : Container(),),),
                                   // const SizedBox(height: 10.0,),

                                 ],
                               ),)

                             )])
                           ],
                           ),

                          ],
                        )
                      ],
                    ),),
                  Padding(padding: const EdgeInsets.only(left: 25.0,right:25.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5.0,),
                          Text(widget.products.productDesc1,style: kdesctextStyle,softWrap: false,),
    Text(widget.products.productDesc2,style: kdesctextStyle,),
                             Text(widget.products.productDesc3,style: kdesctextStyle,),
                        ],
                      )
                    ),
                     // const SizedBox(height:15.0),
                    const Spacer(),
                   Padding(
                        padding: const EdgeInsets.only(left:25.0,right:25.0,bottom: 10.0),
                      child: (
                      Row(
                        children:[
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                             const Text('Total Price',style: kdesctextStyle),
                            Text('\$${widget.products.productPrice}.00',style:kmajortextStyle),
                            ]

                          ),
                          // const SizedBox(width:54.5),
                          const Spacer(),
                          SizedBox(width:200.0,child:FloatingActionButton.extended(
                            heroTag: null,
                            onPressed: (){
                              if(numberOfProductItems>=1)
                                {
                                  firestore.collection('productDetails').doc(documentId).update({'numberOfProductsSelected': numberOfProductItems});
                                   numberOfCartItems.value++;
                                   totalPrice.value+=widget.products.productPrice*numberOfProductItems;
                                   items.value.add(  ShoppingCartItems(numberOfSelected: numberOfProductItems,products: widget.products,));
                                     itemStocks.add(numberOfProductItems);
                                     cartItems.add(CartItems(productId:generateUniqueAlphanumericString(4) ,price: widget.products.productPrice,quantitySelected: numberOfProductItems));

                                }
                            },
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                          label: const Center(child:Row(children:[
                            Icon(Icons.shopping_bag_outlined),
                            SizedBox(width:4.5),
                            Text('Add to Cart',style:kaddStyle),
                          ]),),
    ),)
                        ]
                      )
                      ),
                    )

                  ],
                  ),
              ),
              ),
            ],
          )

        ],
      )
    );
  }
}

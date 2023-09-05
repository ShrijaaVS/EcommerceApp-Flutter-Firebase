
import 'package:flutter/material.dart';
import 'package:ecommerceapp/app_resources/constants.dart';
import 'package:ecommerceapp/screens/home_page/widgets/new_arrivals_widgets//new_arrivals_main_widget.dart';
import 'package:ecommerceapp/screens/home_page/widgets/slider_widgets/slides_main_widget.dart';



class HomePageDesign extends StatefulWidget {
  const HomePageDesign({Key? key}) : super(key: key);

  @override
  State<HomePageDesign> createState() => _HomePageDesignState();
}

class _HomePageDesignState extends State<HomePageDesign> {
  final TextEditingController _searchBarController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    _searchBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 0.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double screenWidth = constraints.maxWidth;


                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                     SizedBox(height: MediaQuery.of(context).size.height/40),//25.0
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 25.0), child: Text('Welcome,', style: kmajortextStyle)),
                            Padding(padding: EdgeInsets.only(left: 25.0), child: Text('Our Fashions App', style: ktextStyle)),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            height: 53.0,
                            width: 53.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(45.0),
                            ),
                            child: FloatingActionButton(
                              heroTag: null,
                              onPressed: () {},
                              backgroundColor: Colors.black,
                              child: const Icon(Icons.person_2_rounded, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/40),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.04),
                          child: SizedBox(
                            width: screenWidth * 0.75,
                            height:  MediaQuery.of(context).size.height/15,//60.0
                            child: TextFormField(
                              style: kloginpagetext,
                              controller: _searchBarController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search_rounded),
                                hintText: 'Search',
                                hintStyle: kloginpagetext,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.grey[300],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.zero,
                          child: SizedBox(
                            height: 53.0,
                            width: 53.0,
                            child: FloatingActionButton(
                              heroTag: null,
                              backgroundColor: Colors.black,
                              onPressed: () {},
                              child: const Icon(Icons.sort),
                            ),
                          ),
                        ),
                      ],
                    ),
                SizedBox(height: MediaQuery.of(context).size.height/25),//40
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.05),
                      child: const Slides(),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/60),//10.0
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
                      child: Row(
                        children: [
                          const Text('New Arrivals', style: kStyle),
                          const Spacer(),
                          TextButton(onPressed: () {}, child: const Text('View All', style: kwidgetStyle)),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/50.0),
                    const NewArrivalsPages(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

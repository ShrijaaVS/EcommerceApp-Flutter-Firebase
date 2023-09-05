
import 'package:ecommerceapp/screens/notifications/widgets/notification_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/app_resources/constants.dart';

class Notifications extends StatefulWidget {
  final PageController pageController;

  const Notifications({Key? key, required this.pageController}) : super(key: key);

  @override
  State<Notifications> createState() => NotificationState();
}

// class NotificationState extends State<Notifications> {
//   final ScrollController scrollController = ScrollController();
//
//   @override
//   void dispose() {
//     scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         controller: scrollController,
//         primary: false,
//
//         children: [Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           padding: const EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 34.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Notifications',
//                     style: kmajortextStyle,
//                   ),
//                 SizedBox(width: MediaQuery.of(context).size.width/(3.6)),
//                   FloatingActionButton(
//                     mini: true,
//                     backgroundColor: Colors.white,
//                     foregroundColor: Colors.black,
//                     child: const Icon(
//                       Icons.more_vert,
//                       size: 20.0,
//                     ),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//            SizedBox(height: MediaQuery.of(context).size.height/25),
//               Expanded(
//                 child: ListView(
//                    controller: scrollController,
//                   primary: false,
//                   physics: const NeverScrollableScrollPhysics(),
//                   children: const [
//                     NotificationCard(),
//                     NotificationCard(),
//                     NotificationCard(),
//                     NotificationCard(),
//                     NotificationCard(),
//                     NotificationCard(),
//                     NotificationCard(),
//                     NotificationCard(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//     ]
//       ),
//     );
//   }
// }
class NotificationState extends State<Notifications> {
  final ScrollController scrollController = ScrollController();
  final List<NotificationCard> notificationCards = [
    const NotificationCard(),
    const NotificationCard(),
    const NotificationCard(),
    const NotificationCard(),
    const NotificationCard(),
    const NotificationCard(),
    const NotificationCard(),

  ];

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: scrollController,
        primary: false,
        itemCount: notificationCards.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 34.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Notifications',
                        style: kmajortextStyle,
                      ),
                     const Spacer(),
                      FloatingActionButton(
                        mini: true,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        child: const Icon(
                          Icons.more_vert,
                          size: 20.0,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 25),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      physics: const NeverScrollableScrollPhysics(),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: notificationCards.length,
                      itemBuilder: (context, index) {
                        return notificationCards[index];
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}

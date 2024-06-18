// import 'dart:async';

// import 'package:bawana_app/data/book_data.dart';
// import 'package:bawana_app/data/user_data.dart';
// import 'package:bawana_app/models/book_model.dart';
// import 'package:bawana_app/widgets/all_book_card.dart';
// import 'package:bawana_app/widgets/image_place_holder.dart';
// import 'package:bawana_app/widgets/reading_book_card.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// final List<String> imagePath = [
//   'assets/Carousel Slider pictures/pic1.png',
//   'assets/Carousel Slider pictures/pic2.png',
//   'assets/Carousel Slider pictures/pic3.png',
// ];

// late List<Widget> imageSliders; //_page
// int activePage = 0;
// final PageController controller = PageController(initialPage: 0);
// Timer? timer;

// class _HomePageState extends State<HomePage> {
//   final userData = UserData().favBookList;
//   final bookData = BookData().bookList;

//   void startTimer() {
//     timer = Timer.periodic(const Duration(seconds: 5), (timer) {
//       if (controller.page != null && controller.page == imagePath.length - 1) {
//         controller.animateToPage(0,
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut);
//       } else {
//         controller.nextPage(
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut);
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     imageSliders = List.generate(imagePath.length, (index) {
//       return ImagePlaceHolder(
//         imagePath: imagePath[index],
//         overlay: Stack(
//           children: [
//             Positioned(
//               top: 16,
//               left: 16,
//               child: Image.asset("assets/font image/bawanalogo.png"),
//             ),
//             Positioned(
//               top: 16,
//               right: 16,
//               child: GestureDetector(
//                 onTap: () {
//                   // Handle button tap
//                 },
//                 child: const CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 14,
//                   child: Image(image: AssetImage('assets/icons/notification.png')),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//     startTimer();
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   SizedBox(
//                     width: double.infinity,
//                     height: MediaQuery.of(context).size.height / 4,
//                     child: PageView.builder(
//                         controller: controller,
//                         itemCount: imagePath.length,
//                         onPageChanged: (value) {
//                           setState(() {
//                             activePage = value;
//                           });
//                         },
//                         itemBuilder: (context, index) {
//                           //return image widget
//                           return imageSliders[index];
//                         }),
//                   ),
//                   //code for dots
//                   Positioned(
//                     bottom: 10,
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                       color: Colors.transparent,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           ...List<Widget>.generate(
//                             imagePath.length,
//                             (index) => Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 3),
//                               child: InkWell(
//                                 onTap: () {
//                                   controller.animateToPage(index,
//                                       duration:
//                                           const Duration(milliseconds: 300),
//                                       curve: Curves.easeIn);
//                                 },
//                                 child: CircleAvatar(
//                                   radius: 4,
//                                   backgroundColor: activePage == index
//                                       ? Colors.white
//                                       : Colors.grey,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               //other widgets
//               const SizedBox(
//                 height: 15,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       "දිගටම කියවන්න...",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     GestureDetector(
//                       child: RichText(
//                         text: const TextSpan(
//                           text: "සියල්ල බලන්න",
//                           style: TextStyle(
//                             color: Colors.blue,
//                             decoration: TextDecoration.underline,
//                             decorationColor: Colors.blue,
//                             decorationThickness: 2,
//                           ),
//                         ),
//                       ),
//                       onTap: () {
//                         // Add your onTap functionality here
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               //list view
//               SizedBox(
//                 height: 150,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: userData.length,
//                   itemBuilder: (context, index) {
//                     Books favBook = userData[index];
//                     return ReadingBookCard(
//                       picUrl: favBook.imagePath,
//                       pageCount: favBook.totalPages,
//                       viewerCount: favBook.totalviewers,
//                       ratingDecimal: favBook.rating,
//                       comments: favBook.totalComments,
//                       linearProgressIndicatorValue:
//                           favBook.linearProgressIndicatorPersentage,
//                       editionString: favBook.edition,
//                       dateString: favBook.date,
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       "අලුත්ම කලාප",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     GestureDetector(
//                       child: RichText(
//                         text: const TextSpan(
//                           text: "සියල්ල බලන්න",
//                           style: TextStyle(
//                             color: Colors.blue,
//                             decoration: TextDecoration.underline,
//                             decorationColor: Colors.blue,
//                             decorationThickness: 2,
//                           ),
//                         ),
//                       ),
//                       onTap: () {
//                         // Add your onTap functionality here
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               SizedBox(
//                 height: 350,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: bookData.length,
//                   itemBuilder: (context, index) {
//                     Books allbook = bookData[index];
//                     return AllBookCard(
//                       imageUrl: allbook.imagePath,
//                       commentCount: allbook.totalComments,
//                       ratingCount: allbook.rating,
//                       date: allbook.date,
//                       editionType: allbook.edition,
//                       read: allbook.description,
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
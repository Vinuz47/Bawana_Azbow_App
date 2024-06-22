// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mosam_azbow/data/models/book_model.dart';
import 'package:mosam_azbow/data/repository/book_data.dart';
import 'package:mosam_azbow/data/repository/comment_data.dart';
import 'package:mosam_azbow/presentation/screens/all_book.dart';
import 'package:mosam_azbow/presentation/widgets/comment_widget.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsPage extends StatefulWidget {
  final int index;

  const DetailsPage({super.key, required this.index});

  @override
  State<DetailsPage> createState() => _DetailsPageState(index: index);
}

final bookData = BookData().bookList;
final commentData = CommentData().commentList;
final pageController = PageController();
final int commentCount = commentData.length;

class _DetailsPageState extends State<DetailsPage> {
  int index;
  _DetailsPageState({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                //background blur image
                Container(
                  height: 536,
                  width: 654,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/cover page for books/bgimage.jpeg'),
                        fit: BoxFit.cover),
                    color: Colors.blue,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 120),
                        child: Container(),
                      ),
                    ),
                  ),
                ),

                //top icons
                Positioned(
                    top: 48,
                    left: (MediaQuery.of(context).size.width - 330) / 2,
                    child: Container(
                      height: 32,
                      width: 335,
                      decoration: const BoxDecoration(
                          //color: Colors.red,

                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_circle_left_sharp,
                              color: Colors.white,
                              size: 32,
                            ),
                            onPressed: () {
                              //navigate to previous page
                            },
                          ),
                          Container(
                            height: 32,
                            width: 32,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                                size: 16,
                              ),
                              onPressed: () {
                                //heart reaction function
                              },
                            ),
                          ),
                        ],
                      ),
                    )),

                //middle image
                Positioned(
                    top: 115,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width-64,
                        height: 456,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: AssetImage(
                                bookData[index].imagePath,

                                //'assets/cover page for books/coverpage5.png'
                              ),
                              fit: BoxFit.cover),
                          //color: Colors.blue,
                        ),
                      ),
                    )),

                //text for '2024 නොවැම්බර් කලාපය'
                Positioned(
                  top: 582,
                  //left: (MediaQuery.of(context).size.width - 226) / 2,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        bookData[index].date + ' කලාපය' ,
                        //+ bookData[index].edition,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffDCDCDC),
                        ),
                      ),
                    ),
                  ),
                ),

                //Rating showing
                // Positioned(
                //   top: 603,
                //   left: 0,
                //   right: 0,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       const ImageIcon(
                //         AssetImage('assets/icons/star.png'),
                //         color: Colors.yellow,
                //         size: 12,
                //       ),
                //       const ImageIcon(
                //         AssetImage('assets/icons/star.png'),
                //         color: Colors.yellow,
                //         size: 12,
                //       ),
                //       const ImageIcon(
                //         AssetImage('assets/icons/star.png'),
                //         color: Colors.yellow,
                //         size: 12,
                //       ),
                //       const ImageIcon(
                //         AssetImage('assets/icons/star.png'),
                //         color: Colors.yellow,
                //         size: 12,
                //       ),
                //       const ImageIcon(
                //         AssetImage('assets/icons/star.png'),
                //         color: Colors.yellow,
                //         size: 12,
                //       ),
                //       const SizedBox(
                //         width: 4,
                //       ),
                //       Text(
                //         bookData[index].rating.toString(),
                //         style: const TextStyle(
                //           fontSize: 16,
                //           fontWeight: FontWeight.w600,
                //           color: Color(0xffDCDCDC),
                //         ),
                //       ),
                //       const SizedBox(
                //         width: 1,
                //       ),
                //       const Text(
                //         '(21 Reviews)',
                //         style: TextStyle(
                //           fontSize: 12,
                //           fontWeight: FontWeight.w400,
                //           color: Color(0xffDCDCDC),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                //Views,comments,pages box
                Positioned(
                    top: 620,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width - 32,
                        decoration: BoxDecoration(
                            color: const Color(0xffFFC1F5),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          child: FittedBox(
                            child: Row(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const ImageIcon(
                                  AssetImage('assets/icons/view.png'),
                                  size: 14,
                                  color: Color(0xff1E1A1A),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  bookData[index].totalviewers.toString() +
                                      ' Viewers',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff1E1A1A),
                                      wordSpacing: 0.1),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const ImageIcon(
                                  AssetImage('assets/icons/comment.png'),
                                  size: 14,
                                  color: Color(0xff1E1A1A),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  bookData[index].totalComments.toString() +
                                      ' Comments',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color:const Color(0xff1E1A1A),
                                      wordSpacing: 0.1),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const ImageIcon(
                                  AssetImage('assets/icons/pages.png'),
                                  size: 14,
                                  color: Color(0xff1E1A1A),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  bookData[index].totalPages.toString() +
                                      ' Pages',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff1E1A1A),
                                      wordSpacing: 0.1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),

                //Kiyawanna box
                Positioned(
                    top: 685,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        //on tap function
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width - 32,
                            decoration: BoxDecoration(
                                color: const Color(0xff32B1E7),
                                borderRadius: BorderRadius.circular(8),
                                // gradient: LinearGradient(colors: [
                                //   Theme.of(context).colorScheme.primary,
                                //   Theme.of(context).colorScheme.secondary,
                                // ])
                                ),
                            child: const Center(
                              child: Text(
                                'කියවන්න',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFFFFFF)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),

                //"අදහස්" and "සියල්ල බලන්න" container
                Positioned(
                  top: 770,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 32,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'අදහස්',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFFFFFF)),
                          ),
                          Text('සියල්ල බලන්න',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff32B1E7))),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 280,
            ),
            
            //comment section
            SizedBox(
                height: 150,
                child: PageView(
                  controller: pageController,
                  children: List.generate(commentCount, (index) {
                    return CommentView(
                        name: commentData[index].name,
                        description: commentData[index].description.toString(),
                        date: commentData[index].date);
                  }),
                )),

            //dot indicator
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SmoothPageIndicator(
                controller: pageController,
                count: commentCount,
                effect: JumpingDotEffect(
                  activeDotColor: const Color(0xffFFFFFF).withOpacity(0.65),
                  dotColor: const Color(0xffFFFFFF).withOpacity(0.2),
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
            ),

            const SizedBox(
              height: 40,
            ),

            //"පෙර පලකිරීම්" and "සියල්ල බලන්න" container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'පෙර පලකිරීම්',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFFFFFF)),
                    ),
                    Text('සියල්ල බලන්න',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff32B1E7))),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //bottom horizontal list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bookData.length,
                  itemBuilder: (context, index) {
                    Books allbook = bookData[index];
                    return AllBookCard(
                      imageUrl: allbook.imagePath,
                      commentCount: allbook.totalComments,
                      ratingCount: allbook.rating,
                      date: allbook.date,
                      editionType: allbook.edition,
                      read: allbook.description,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

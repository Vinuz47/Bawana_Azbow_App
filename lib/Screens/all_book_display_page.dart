/// The class `AllBookDisplayScreen` is a StatefulWidget in Flutter that displays a column with a stack containing a positioned container.
import 'package:flutter/material.dart';
import 'package:mosam_azbow/Model/book_model.dart';
import 'package:mosam_azbow/Screens/details_page.dart';
import 'package:mosam_azbow/Widget/all_book_list_tile.dart';

class AllBookDisplayScreen extends StatefulWidget {
  const AllBookDisplayScreen({super.key});

  @override
  State<AllBookDisplayScreen> createState() => _AllBookDisplayScreenState();
}

class _AllBookDisplayScreenState extends State<AllBookDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1A1A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //top app bar
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 56, 110, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: const BoxDecoration(

                    //color: Colors.red
                    ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_circle_left_sharp,
                        color: Colors.white,
                        size: 32,
                      ),
                      onPressed: () {
                        //navigate to previous page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailsPage(
                                    index: 4,
                                  )),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    const Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'සියලුම පලකිරීම්',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffDCDCDC)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            //list of books
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                //scrollDirection: Axis.vertical,
                itemCount: bookData.length,
                itemBuilder: (context, index) {
                  Books allbook = bookData[index];
                  return AllBookListTile(
                    imageUrl: allbook.imagePath,
                    description: allbook.longDescription.toString(),
                    pages: allbook.totalPages,
                    ratings: allbook.rating,
                    views: allbook.totalviewers,
                    reviews: allbook.reviews.toString(),
                    title: allbook.date + " " + allbook.edition,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

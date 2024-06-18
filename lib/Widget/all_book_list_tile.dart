import 'package:flutter/material.dart';

class AllBookListTile extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double ratings;
  final String reviews;
  final String description;
  final int pages;
  final int views;

  const AllBookListTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.ratings,
      required this.reviews,
      required this.description,
      required this.pages,
      required this.views});

  @override
  State<AllBookListTile> createState() => _AllBookListTileState();
}

class _AllBookListTileState extends State<AllBookListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SingleChildScrollView(
        child: Container(
          height: 140,
          width: 359,
          decoration: BoxDecoration(
            color: const Color(0xff272727),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              //image
              Container(
                width: 92,
                height: 115,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage(
                        widget.imageUrl,

                        //'assets/cover page for books/coverpage5.png'
                      ),
                      fit: BoxFit.cover),
                  //color: Colors.blue,
                ),
              ),
              const SizedBox(
                width: 4.8,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          // decoration: BoxDecoration(color: Colors.red),
                          height: 16,
                          width: 175,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  //fontSize: 12,
                                  color: Color(0xffDCDCDC)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   width: 1,
                      // ),

                      //favourite function
                      Container(
                        height: 16,
                        //decoration: BoxDecoration(color: Colors.blue),
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border_rounded),
                          color: Colors.white,
                          iconSize: 12,
                          onPressed: () {
                            // favourit function
                          },
                        ),
                      )
                    ],
                  ),

                  //rewiew starts
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        //ecoration: BoxDecoration(color: Colors.blue),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ImageIcon(
                              AssetImage('assets/icons/star.png'),
                              color: Colors.yellow,
                              size: 10,
                            ),
                            const ImageIcon(
                              AssetImage('assets/icons/star.png'),
                              color: Colors.yellow,
                              size: 10,
                            ),
                            const ImageIcon(
                              AssetImage('assets/icons/star.png'),
                              color: Colors.yellow,
                              size: 10,
                            ),
                            const ImageIcon(
                              AssetImage('assets/icons/star.png'),
                              color: Colors.yellow,
                              size: 10,
                            ),
                            const ImageIcon(
                              AssetImage('assets/icons/star.png'),
                              color: Colors.yellow,
                              size: 10,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              widget.ratings.toString(), //rating geting

                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffDCDCDC),
                              ),
                            ),
                            const SizedBox(
                              width: 1,
                            ),
                            Text(
                              '(' +
                                  widget.reviews +
                                  'Reviews)', //reviews count getting
                              style: const TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffDCDCDC),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  //description section
                  Container(
                    //decoration: BoxDecoration(color: Colors.blue),
                    height: 35,
                    width: 222,
                    //width: 300,
                    //decoration: BoxDecoration(color: Colors.red),
                    child: Text(
                      widget.description, //description getting
                      style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 9,
                          color: Color(0xffDCDCDC)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //page section
                          Row(
                            children: [
                              const ImageIcon(
                                AssetImage('assets/icons/pages.png'),
                                size: 12,
                                color: Color(0xffDCDCDC),
                              ),
                              const SizedBox(
                                width: 2.57,
                              ),
                              Text(
                                widget.pages.toString() +
                                    ' Pages', //getting pages count

                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Color(0xffDCDCDC),
                                ),
                              )
                            ],
                          ),

                          //views section
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ImageIcon(
                                AssetImage('assets/icons/view.png'),
                                size: 12,
                                color: Color(0xffDCDCDC),
                              ),
                              const SizedBox(
                                width: 2.57,
                              ),
                              Text(
                                widget.views.toString() + ' Viewers',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Color(0xffDCDCDC),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          //onTap function for 'කියවන්න' button
                        },
                        child: Container(
                          height: 34,
                          width: 111,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xff32B1E7),
                          ),
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'කියවන්න  ',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffFFFFFF)),
                                ),
                                ImageIcon(
                                  AssetImage('assets/icons/pages.png'),
                                  size: 20,
                                  color: Color(0xffDCDCDC),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

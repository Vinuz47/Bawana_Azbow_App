import 'package:flutter/material.dart';

class AllBookCard extends StatefulWidget {
  final String imageUrl;
  final int commentCount;
  final double ratingCount;
  final String date;
  final String editionType;
  final String? read;

  const AllBookCard({
    super.key,
    required this.imageUrl,
    required this.commentCount,
    required this.ratingCount,
    required this.date,
    required this.editionType,
    required this.read,
  });

  @override
  State<AllBookCard> createState() => _AllBookCardState();
}

class _AllBookCardState extends State<AllBookCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 170,
      height: 320, // Adjust height to accommodate the bottom section
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 170,
                height: 240,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon:
                          const Icon(Icons.favorite_border, color: Colors.red),
                      iconSize: 16,
                      onPressed: () {
                        // Handle favorite button press
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 5,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xff000000).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const ClipOval(
                        child: ImageIcon(AssetImage('assets/icons/comment.png'),
                            size: 16, color: Colors.white),
                      ),
                      const SizedBox(width: 4),
                      Text(widget.commentCount.toString(),
                          style: const TextStyle(color: Colors.white)),
                      const SizedBox(width: 12),
                      const ClipOval(
                        child: ImageIcon(
                          AssetImage('assets/icons/star.png'),
                          size: 14,
                          color: Colors.yellow,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(widget.ratingCount.toString(),
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (widget.date),
                  style: const TextStyle(color: Color(0xffDCDCDC)),
                ),
                Text(
                  (widget.editionType),
                  style:
                      const TextStyle(fontSize: 10, color: Color(0xffBBBBBB)),
                ),
                GestureDetector(
                  child: RichText(
                    text: TextSpan(
                      text: (widget.read),
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                  onTap: () {
                    // Add your onTap functionality here
                  },
                ),
              ],
            ),
          ),
        ],
    ),
  );
 }
}
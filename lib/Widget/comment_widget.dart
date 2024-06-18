import 'package:flutter/material.dart';

class CommentView extends StatelessWidget {
  final String name;
  final String description;
  final String date;
  const CommentView({
    super.key,
    required this.name,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width - 16,
            decoration: BoxDecoration(
                color: const Color(0xff212022),
                borderRadius: BorderRadius.circular(6)),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(children: [
                    const Icon(
                      Icons.circle,
                      color: Color(0xffFCB1B1),
                      size: Checkbox.width,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '$name',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    '$description',
                    style: const TextStyle(
                        color: Color(0xffDCDCDC),
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 240,
                    ),
                    Text(
                      '$date',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffDCDCDC)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

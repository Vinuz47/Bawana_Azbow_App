import 'package:flutter/material.dart';
import 'package:mosam_azbow/app_string.dart';

class ProfileDetailsWidget extends StatefulWidget {
  final String name;
  final String number;
  final String email;
  final String startingDate;
  final int finishedMagazines;
  final int finishedPages;
  final String timePeriod;
  const ProfileDetailsWidget(
      {super.key,
      required this.name,
      required this.number,
      required this.email,
      required this.startingDate,
      required this.finishedMagazines,
      required this.finishedPages,
      required this.timePeriod});

  @override
  State<ProfileDetailsWidget> createState() => _nameState();
}

class _nameState extends State<ProfileDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                IconButton(
                  onPressed: () {
                    //edit function
                  },
                  icon: const ImageIcon(
                    AssetImage('assets/icons/edit.png'),
                    color: Colors.white,
                  ),
                )
              ],
            ),
      
            //subscription time period box
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xff272727),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    //diamond gif
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Image(
                          image: AssetImage('assets/icons/diamond.gif'),
                          height: 64,
                          width: 64),
                    ),
      
                    const SizedBox(
                      width: 8,
                    ),
      
                    //main title
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your Subscription',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
      
                          //subtile
                          Text(
                            widget.timePeriod,
                            style: const TextStyle(
                                color: Color(0xffDCDCDC),
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
      
                    const SizedBox(
                      width: 26,
                    ),
      
                    //trail Icon
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: IconButton(
                        onPressed: () {
                          //button press function
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xffDCDCDC),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
      
            //user details box
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: Container(
                  height: 235,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0xff272727),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 16, right: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //user details text
                            Text(
                              'User Details',
                              style: stringStyle(
                                  Colors.white, FontWeight.w600, 16),
                            ),
      
                            //edit icon
                            IconButton(
                              onPressed: () {
                                //edit function
                              },
                              icon: const ImageIcon(
                                AssetImage('assets/icons/edit.png'),
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Divider(
                          color: const Color(0xffFFFFFF).withOpacity(0.2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name',
                                style: stringStyle(
                                    Colors.white, FontWeight.w500, 14),
                              ),
                              Text(
                                widget.name,
                                style: stringStyle(const Color(0xffDCDCDC),
                                    FontWeight.w400, 14),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Phone Number',
                                style: stringStyle(
                                    Colors.white, FontWeight.w500, 14),
                              ),
                              Text(
                                widget.number,
                                style: stringStyle(const Color(0xffDCDCDC),
                                    FontWeight.w400, 14),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'E - mail',
                                style: stringStyle(
                                    Colors.white, FontWeight.w500, 14),
                              ),
                              Text(
                                widget.email,
                                style: stringStyle(const Color(0xffDCDCDC),
                                    FontWeight.w400, 14),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Member Since',
                                style: stringStyle(
                                    Colors.white, FontWeight.w500, 14),
                              ),
                              Text(
                                widget.startingDate,
                                style: stringStyle(const Color(0xffDCDCDC),
                                    FontWeight.w400, 14),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
      
            //statistic box
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0xff272727),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 16, right: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //user details text
                            Text(
                              'Statistics',
                              style: stringStyle(
                                  Colors.white, FontWeight.w600, 16),
                            ),
                          ],
                        ),
                        Divider(
                          color: const Color(0xffFFFFFF).withOpacity(0.2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Magazines Finished',
                                style: stringStyle(
                                    Colors.white, FontWeight.w500, 14),
                              ),
                              Text(
                                widget.finishedMagazines.toString(),
                                style: stringStyle(const Color(0xffDCDCDC),
                                    FontWeight.w400, 14),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Paged Finished',
                                style: stringStyle(
                                    Colors.white, FontWeight.w500, 14),
                              ),
                              Text(
                                widget.finishedPages.toString(),
                                style: stringStyle(const Color(0xffDCDCDC),
                                    FontWeight.w400, 14),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

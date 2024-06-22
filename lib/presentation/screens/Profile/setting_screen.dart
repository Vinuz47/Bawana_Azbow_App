import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:mosam_azbow/presentation/constants/app_strings.dart';
import 'package:mosam_azbow/presentation/screens/Profile/main_profile_screen.dart';
import 'package:mosam_azbow/presentation/widgets/logout_popup_window.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1E1A1A),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.center,
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
                                builder: (context) =>
                                    const MainProfileScreen()),
                          );
                        },
                      ),
                      //const Spacer(),
                      Text(
                        'Settings',
                        style: stringStyle(
                            const Color(0xffDCDCDC), FontWeight.w600, 16),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: IconButton(
                          icon: const Icon(
                            Icons.settings,
                            color: Color(0xff1E1A1A),
                          ),
                          onPressed: () {
                            // setting page to navigate
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const SettingScreen()),
                            // );
                          },
                        ),
                      )
                    ]),
              ),

              //Subscription Container
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  height: 165,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xff272727)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //payement method text widget
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text('Subscription',
                                style: stringStyle(const Color(0xffFFFFFF),
                                    FontWeight.w600, 16)),
                          ),
                        ),

                        // horizontal straight line
                        Divider(
                          color: const Color(0xffFFFFFF).withOpacity(0.2),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          child: Row(
                            children: [
                              Text(
                                'Change Payment Method',
                                style: stringStyle(const Color(0xffFFFFFF),
                                    FontWeight.w500, 14),
                              ),

                              const Spacer(), // this provide considerable space

                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 16, bottom: 12),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: IconButton(
                                      onPressed: () {
                                        //Change Payment Method function
                                      },
                                      icon: const Icon(Icons.arrow_forward_ios),
                                      color: const Color(0xffDCDCDC),
                                      //hoverColor: Colors.red,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        Divider(
                          color: const Color(0xffFFFFFF).withOpacity(0.05),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          child: Row(
                            children: [
                              Text(
                                'Remove Subscription',
                                style: stringStyle(const Color(0xffF36767),
                                    FontWeight.w500, 14),
                              ),

                              const Spacer(), // this provide considerable space

                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 16, bottom: 12),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: IconButton(
                                      onPressed: () {
                                        //Remove Subscription function
                                      },
                                      icon: const Icon(Icons.arrow_forward_ios),
                                      color: const Color(0xffF36767),
                                      //hoverColor: Colors.red,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //Additional box
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 165,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xff272727)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //payement method text widget
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text('Additional',
                                style: stringStyle(const Color(0xffFFFFFF),
                                    FontWeight.w600, 16)),
                          ),
                        ),

                        // horizontal straight line
                        Divider(
                          color: const Color(0xffFFFFFF).withOpacity(0.2),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          child: Row(
                            children: [
                              Text(
                                'App language',
                                style: stringStyle(const Color(0xffFFFFFF),
                                    FontWeight.w500, 14),
                              ),

                              const Spacer(), // this provide considerable space

                              Row(
                                children: [
                                  ///!!!!!!!! USE text span!!!!!!!
                                  Text(
                                    'English ,',
                                    style: stringStyle(const Color(0xffDCDCDC),
                                        FontWeight.w400, 14),
                                  ),
                                  Text(
                                    'සිංහල',
                                    style: stringStyle(const Color(0xffDCDCDC),
                                        FontWeight.w400, 12),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),

                        Divider(
                          color: const Color(0xffFFFFFF).withOpacity(0.05),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          child: Row(
                            children: [
                              Text(
                                'Push Notifications',
                                style: stringStyle(const Color(0xffFFFFFF),
                                    FontWeight.w500, 14),
                              ),

                              const Spacer(), // this provide considerable space

                              //toggle button
                              SizedBox(
                                height: 40,
                                child: LiteRollingSwitch(
                                  value: true,
                                  width: 80,
                                  textOn: 'On',
                                  textOff: 'Off',
                                  colorOn: Colors.greenAccent,
                                  colorOff: Colors.redAccent,
                                  iconOn: Icons.notifications_active_rounded,
                                  iconOff: Icons.notifications_off_rounded,
                                  textSize: 10,
                                  //animationDuration: Duration(milliseconds: 50),
                                  onChanged: (bool position) {
                                    print('The button is $position');
                                  },
                                  onDoubleTap: () {},
                                  onSwipe: () {},
                                  onTap: () {},
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //Support box
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 285,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xff272727)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //payement method text widget
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text('Support',
                                style: stringStyle(const Color(0xffFFFFFF),
                                    FontWeight.w600, 16)),
                          ),
                        ),

                        // horizontal straight line
                        Divider(
                          color: const Color(0xffFFFFFF).withOpacity(0.2),
                        ),

                        //about bawana app
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          child: Row(
                            children: [
                              Text(
                                'About Bhawana App',
                                style: stringStyle(const Color(0xffFFFFFF),
                                    FontWeight.w500, 14),
                              ),

                              const Spacer(), // this provide considerable space

                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 16, bottom: 12),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: IconButton(
                                      onPressed: () {
                                        //About Bhawana App function
                                      },
                                      icon: const Icon(Icons.arrow_forward_ios),
                                      color: const Color(0xffDCDCDC),
                                      //hoverColor: Colors.red,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        Divider(
                          color: const Color(0xffFFFFFF).withOpacity(0.05),
                        ),

                        //help
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          child: Row(
                            children: [
                              Text(
                                'Help',
                                style: stringStyle(const Color(0xffFFFFFF),
                                    FontWeight.w500, 14),
                              ),

                              const Spacer(), // this provide considerable space

                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 16, bottom: 12),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: IconButton(
                                      onPressed: () {
                                        //Help function
                                      },
                                      icon: const Icon(Icons.arrow_forward_ios),
                                      color: const Color(0xffDCDCDC),
                                      //hoverColor: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: const Color(0xffFFFFFF).withOpacity(0.05),
                        ),
                        //terms and condition
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          child: Row(
                            children: [
                              Text(
                                'Terms & Conditions',
                                style: stringStyle(const Color(0xffFFFFFF),
                                    FontWeight.w500, 14),
                              ),

                              const Spacer(), // this provide considerable space

                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 16, bottom: 12),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: IconButton(
                                      onPressed: () {
                                        //Terms & Conditions function
                                      },
                                      icon: const Icon(Icons.arrow_forward_ios),
                                      color: const Color(0xffDCDCDC),
                                      //hoverColor: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: const Color(0xffFFFFFF).withOpacity(0.05),
                        ),
                        //privacy and policy
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          child: Row(
                            children: [
                              Text(
                                'Privacy Policy',
                                style: stringStyle(const Color(0xffFFFFFF),
                                    FontWeight.w500, 14),
                              ),

                              const Spacer(), // this provide considerable space

                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 16, bottom: 12),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: IconButton(
                                      onPressed: () {
                                        //privacy policy function
                                      },
                                      icon: const Icon(Icons.arrow_forward_ios),
                                      color: const Color(0xffDCDCDC),
                                      //hoverColor: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //Log out button
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                    onPressed: () {
                      logoutPopupWindow(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF36767),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ImageIcon(
                            color: Colors.white,
                            AssetImage('assets/icons/logout.png'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Log Out',
                            style:
                                stringStyle(Colors.white, FontWeight.w600, 16),
                          ),
                        ],
                      ),
                    )),
              ),

              //bottom text
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 30),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'Bhawana',
                        style: stringStyle(
                            const Color(0xffDCDCDC), FontWeight.w400, 10),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Icon(
                        Icons.copyright,
                        size: 10,
                        color: Color(0xffDCDCDC),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Copyright 2024 All Rights Reserved.',
                        style: stringStyle(
                            const Color(0xffDCDCDC), FontWeight.w400, 10),
                      ),
                    ]),
                    Text(
                      'Solutions by Azbow.',
                      style: stringStyle(
                          const Color(0xffDCDCDC), FontWeight.w400, 10),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}

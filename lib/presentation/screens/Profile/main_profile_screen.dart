import 'package:flutter/material.dart';
import 'package:mosam_azbow/data/models/profile_details_model.dart';
import 'package:mosam_azbow/data/repository/profile_details_data.dart';
import 'package:mosam_azbow/presentation/screens/Profile/setting_screen.dart';
import 'package:mosam_azbow/presentation/screens/all_book_display_page.dart';
import 'package:mosam_azbow/presentation/screens/subscription.dart';
import 'package:mosam_azbow/presentation/widgets/image_profile_widget.dart';
import 'package:mosam_azbow/presentation/widgets/profile_details_widget.dart';


class MainProfileScreen extends StatefulWidget {
  const MainProfileScreen({super.key});

  @override
  State<MainProfileScreen> createState() => _MainProfileScreenState();
}

final profileDetailsData = ProfileDetailsData().profileDetailsList;

class _MainProfileScreenState extends State<MainProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1A1A),
      
      //bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff161517),
        height: 89,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  //bottom navigation bar - home icon
                  IconButton(
                    onPressed: () {
                      //home direct function
                    },
                    icon: const Icon(
                      Icons.home_filled,
                      color: Color(0xff505156),
                      size: 32,
                    ),
                  ),
    
                  //bottom navigation bar home text widget
                  const Text(
                    'Home',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      color: Color(0xff505156),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  //bottom navigation bar - magazine icon
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllBookDisplayScreen()),
                      );
                    },
                    icon: const Icon(
                      Icons.file_copy_outlined,
                      color: Color(0xff505156),
                      size: 32,
                    ),
                  ),
    
                  //bottom navigation bar Magazines text widget
                  const Text(
                    'Magazines',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      color: Color(0xff505156),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  //bottom navigation bar - Favourite icon
                  IconButton(
                    onPressed: () {
                      //favourite direct function
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Color(0xff505156),
                      size: 32,
                    ),
                  ),
    
                  //bottom navigation bar Favourite text widget
                  const Text(
                    'Favourite',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      color: Color(0xff505156),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  //bottom navigation bar - profile icon
                  IconButton(
                    onPressed: () {
                      //profile direction function
                    },
                    icon: Image.asset(
                      'assets/icons/Profile.png',
                      //color: const Color(0xff505156),
                      height: 32,
                      width: 32,
                    ),
                  ),
    
                  //bottom navigation bar profile text widget
                  const Text(
                    'Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      color: Color(0xff505156),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    
      body: SingleChildScrollView(
        child: Column(
          children: [
    
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: IconButton(
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
                            builder: (context) => const SubscriptionScreen()),
                      );
                    },
                  ),
                ),
            
                const Center(
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                        color: Color(0xffDCDCDC),
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
            
            //setting icon
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // setting page to navigate
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SettingScreen()),
                          );
                    },
                  ),
                )
                
              ]
            ),
          ),
    
            const SizedBox(height: 30),
            const ImageProfileWidget(),
            //const SizedBox(height: 12),
    
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: profileDetailsData.length,
                itemBuilder: (context, index) {
                  ProfileDetails subscription = profileDetailsData[index];
                  return ProfileDetailsWidget(
                      name: subscription.name,
                      number: subscription.number,
                      email: subscription.email,
                      startingDate: subscription.startingDate,
                      finishedMagazines: subscription.finishedMagazines,
                      finishedPages: subscription.finishedPages,
                      timePeriod: subscription.timePeriod);
                })
            
          ],
        ),
      ),
    );
  }
}

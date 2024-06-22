import 'package:flutter/material.dart';
import 'package:mosam_azbow/data/repository/profile_details_data.dart';
import 'package:mosam_azbow/presentation/constants/app_strings.dart';
import 'package:mosam_azbow/presentation/screens/Profile/main_profile_screen.dart';
import 'package:mosam_azbow/presentation/widgets/edit_profile_list_tile.dart';
import 'package:mosam_azbow/presentation/widgets/image_profile_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

final editData = ProfileDetailsData().profileDetailsList;
//ProfileDetails prfiles = editData
final int editDataCount = editData.length;

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1A1A),
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
                                builder: (context) =>
                                    const MainProfileScreen()),
                          );
                        },
                      ),
                    ),

                    const Center(
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                            color: Color(0xffDCDCDC),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),

                    //setting icon
                    Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: InkWell(
                          onTap: () {
                            //on tap function for save
                          },
                          child: Text(
                            'Save',
                            style: stringStyle(
                                const Color(0xff32B1E7), FontWeight.w600, 16),
                          ),
                        ))
                  ]),
            ),
            const SizedBox(height: 30),
            const ImageProfileWidget(),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                //for change profile pic function
              },
              child: Text(
                'Change Profile Photo',
                style:
                    stringStyle(const Color(0xff32B1E7), FontWeight.w600, 16),
              ),
            ),
            SizedBox(
              child: Column(
                children: List.generate(editDataCount, (index) {
                  return EditProfileListTile(
                    name: editData[index].name,
                    email: editData[index].email,
                    number: editData[index].number,
                    username: editData[index].username,
                  );
                }),
              ),
            )

            // const EditProfileListTile(
            //   name: 'vjioxjio',
            //   email: 'uifsiosigsio',
            //   number: '09878967',
            //   username: 'gyiguigu9',            )
          ],
        ),
      ),
    );
  }
}

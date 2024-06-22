import 'package:flutter/material.dart';
import 'package:mosam_azbow/presentation/constants/Utils/logout_button.dart';
import 'package:mosam_azbow/presentation/constants/app_strings.dart';

class EditProfileListTile extends StatefulWidget {
  final String name;
  final String number;
  final String email;
  final String username;
  const EditProfileListTile({
    super.key,
    required this.name,
    required this.number,
    required this.email,
    required this.username,
  });

  @override
  State<EditProfileListTile> createState() => _EditProfileListTileState();
}

class _EditProfileListTileState extends State<EditProfileListTile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            listDetails('Full Name', widget.name, TextInputType.name),
            const SizedBox(
              height: 12,
            ),
            listDetails('Phone Number', widget.number, TextInputType.number),
            const SizedBox(
              height: 12,
            ),
            listDetails('E-mail', widget.email, TextInputType.name),
            const SizedBox(
              height: 12,
            ),
            listDetails('User Name', widget.username, TextInputType.name),
            const SizedBox(
              height: 12,
            ),

            //Log out button
            const LogoutButton(
              mainTitle: 'Log Out',
              iconPath: 'assets/icons/logout.png',
              color: Color(0xffF36767),
              boaderColor: Color(0xffF36767),
              stringColor: Color(0xffFFFFFF),
              logCheck: true,
            ),

            const LogoutButton(
              mainTitle: 'Delete Account',
              iconPath: 'assets/icons/logout.png',
              color: Colors.transparent,
              boaderColor: Color(0xffFFFFFF),
              stringColor: Colors.transparent,
              logCheck: false,
            ),
          ],
        ),
      ),
    );
  }

  //list detail tile
  ListTile listDetails(
      String fixedValue, String value, TextInputType keyboardtype) {
    return ListTile(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
      tileColor: const Color(0xff272727),
      title: Text(
        fixedValue,
        style: stringStyle(const Color(0xff82888B), FontWeight.w500, 11),
      ),
      subtitle: TextFormField(
        //keyboardType: TextInputType.name,
        keyboardType: keyboardtype,
        style: stringStyle(const Color(0xffDCDCDC), FontWeight.w500, 14),
        initialValue: value,
        decoration: const InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}

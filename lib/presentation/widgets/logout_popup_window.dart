import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mosam_azbow/presentation/constants/app_strings.dart';


logoutPopupWindow(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: const Color(0xff272727),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width:
              MediaQuery.of(context).size.width, // Set your desired width here
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Log Out',
                  style: stringStyle(Colors.white, FontWeight.w600, 16),
                ),
              ),
              const Divider(),
              AutoSizeText(
                'Are you sure you want to log out?',
                maxLines: 1,
                style: stringStyle(Colors.white, FontWeight.w500, 16),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff272727),
                    ),
                    child: Container(
                      width: 50,
                      height: 40,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: stringStyle(Colors.white, FontWeight.w500, 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF36767),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: SizedBox(
                      width: 77, // Adjust width as needed
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ImageIcon(
                            size: 16,
                            color: Colors.white,
                            AssetImage('assets/icons/logout.png'),
                          ),
                          const SizedBox(width: 5),
                          AutoSizeText(
                            'Log out?',
                            maxLines: 1,
                            style:
                                stringStyle(Colors.white, FontWeight.w600, 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

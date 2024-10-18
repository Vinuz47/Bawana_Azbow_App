import 'package:flutter/material.dart';
import 'package:mosam_azbow/presentation/constants/app_strings.dart';
import 'package:mosam_azbow/presentation/widgets/logout_popup_window.dart';

class LogoutButton extends StatefulWidget {
  final String mainTitle;
  final String iconPath;
  final Color color;
  final Color boaderColor;
  final Color stringColor;
  final bool logCheck;
  const LogoutButton({
    super.key,
    required this.mainTitle,
    required this.iconPath,
    required this.color,
    required this.boaderColor,
    required this.stringColor,
    required this.logCheck,
  });

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: ElevatedButton(
          onPressed: () {
            if (widget.logCheck) {
              logoutPopupWindow(context);
            } else {
              //Delete account function
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: widget.color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: widget.boaderColor))),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.logCheck
                    ? ImageIcon(
                        color: widget.stringColor,
                        AssetImage(widget.iconPath),
                      )
                    : const SizedBox(
                        width: 5,
                      ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.mainTitle,
                  style: stringStyle(Colors.white, FontWeight.w600, 16),
                ),
              ],
            ),
          )),
    );
  }
}

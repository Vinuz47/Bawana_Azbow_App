import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mosam_azbow/Data/subscription_data.dart';
import 'package:mosam_azbow/Model/subscription_model.dart';
import 'package:mosam_azbow/Screens/all_book_display_page.dart';
import 'package:mosam_azbow/Widget/subscription_list_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

final subscriptionData = SubscriptionData().subscriptionList;

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  var defaultText = const TextStyle(
      color: Color(0xffDCDCDC), fontWeight: FontWeight.w400, fontSize: 9);
  var linkText = const TextStyle(
      color: Color(0xff32B1E7), fontWeight: FontWeight.w400, fontSize: 10);
  final Uri _urlTerms = Uri.parse('https://flutter.dev');
  final Uri _urlPolicy = Uri.parse('https://www.azbow.com/');
int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1A1A),
      body: Column(
        children: [
          //app bar title and back key
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 48),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              //decoration: BoxDecoration(color: Colors.yellow),
              
              //top name and back icon
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        //color: Colors.red
                        ),
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
                                  const AllBookDisplayScreen()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Subscription',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffDCDCDC)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          const SizedBox(height: 25),

          //top destription
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              //decoration: BoxDecoration(color: Colors.yellow),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const AutoSizeText(
                      'Enjoy unlimited access to all magazines and articles for a month.',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xffDCDCDC)),
                      minFontSize: 6,
                      maxLines: 1,
                      //overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Text(
                    'මාසයක් සඳහා සියලුම සඟරා සහ ලිපි සඳහා අසීමිත ප්‍රවේශය භුක්ති විඳින්න.',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        color: Color(0xffDCDCDC)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 5),

          //package field
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: subscriptionData.length,
                  itemBuilder: (context, index) {
                    Subscription subscription = subscriptionData[index];
                    return SubscriptionListTile(
                      index: subscription.index,
                      titleName: subscription.titleName,
                      subTitleName: subscription.subTitleName,
                      amount: subscription.amount,
                      gifUrl: subscription.gifUrl,
                      isSelected: _selectedIndex == index ,
                      onSelect: () {
                        setState(() {
                          _selectedIndex =
                              index; // Update selected index on tap
                        });
                      },
                    );
                  })),

          //Subscribe button
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
            child: GestureDetector(
              onTap: () {
                //subscribe function
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return paymentSelectionBox(1000);
                  },
                );
              },
              child: Container(
                height: 56,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        const Color(0xff6026C0).withOpacity(0.8),
                        const Color(0xff8C2FC8).withOpacity(0.8)
                      ],
                    )),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Subscribe Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              ),
            ),
          ),

          //Bottom text (terms and conditions, privacy policy)
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //first line text
                const Text(
                  'යෙදුම-තුළ මිලදී ගැනීම් USD වලින් අය කෙරේ. වැඩි',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 9,
                      color: Color(0xffDCDCDC)),
                ),

                //second line text
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      style: defaultText, text: 'විස්තර සඳහා, කරුණාකර අපගේ '),
                  TextSpan(
                      style: linkText,
                      text: 'Terms & Conditions',
                      recognizer: TapGestureRecognizer()
                        ..onTap = _launchUrlTerms),
                  TextSpan(style: defaultText, text: ' සහ'),
                ])),

                //third line text
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      style: linkText,
                      text: 'Privacy Policy',
                      recognizer: TapGestureRecognizer()
                        ..onTap = _launchUrlPolicy),
                  TextSpan(style: defaultText, text: ' වෙත පිවිසෙන්න.'),
                ])),
              ],
            ),
          )
        ],
      ),
    );
  }

//url launcher function - term and condition
  Future<void> _launchUrlTerms() async {
    if (!await launchUrl(_urlTerms)) {
      throw Exception('Could not launch $_urlTerms');
    }
  }

  //url launcher function - privacy and policy
  Future<void> _launchUrlPolicy() async {
    if (!await launchUrl(_urlPolicy)) {
      throw Exception('Could not launch $_urlPolicy');
    }
  }

  //payement bottom box
  Widget paymentSelectionBox(double amount) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Container(
        height: 251,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xff272727)),
        child: Padding(
          padding: const EdgeInsets.only(top: 17),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //payement method text widget
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Payment Method',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xffFFFFFF)),
                  ),
                ),
              ),

              // horizontal straight line
              Divider(
                color: const Color(0xffFFFFFF).withOpacity(0.2),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 16),
                child: Row(
                  children: [
                    //G pay icon
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: const Image(
                        image: AssetImage('assets/icons/google_pay.png'),
                        height: 32,
                        width: 64,
                      ),
                    ),

                    //Google Pay text widget
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'Google Pay',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),

                    const Spacer(), // this provide considerable space

                    //arrow key in G pay
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 20,
                          height: 20,
                          child: IconButton(
                            onPressed: () {
                              //google pay function
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
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 16),
                child: Row(
                  children: [
                    //Apple pay icon
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Image(
                        image: AssetImage('assets/icons/apple_pay.png'),
                        height: 32,
                        width: 64,
                      ),
                    ),

                    //Apple Pay text widget
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'Apple Pay',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),

                    const Spacer(), // this provide considerable space

                    //arrow key in Apple pay
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 20,
                          height: 20,
                          child: IconButton(
                            onPressed: () {
                              //apple pay function
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

              //cancle text button
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel',
                    style: TextStyle(
                        color: Color(0xffF36767),
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

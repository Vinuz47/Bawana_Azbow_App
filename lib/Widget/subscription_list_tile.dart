import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SubscriptionListTile extends StatefulWidget {
  final int index;
  final String titleName;
  final String subTitleName;
  final int amount;
  final String gifUrl;
  final bool isSelected;
  final VoidCallback onSelect;
  const SubscriptionListTile({
    super.key,
    required this.index,
    required this.titleName,
    required this.subTitleName,
    required this.amount,
    required this.gifUrl,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  State<SubscriptionListTile> createState() => _SubscriptionListTileState();
}

class _SubscriptionListTileState extends State<SubscriptionListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: widget.onSelect,
        child: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: const Color(0xff272727),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: widget.isSelected
                    ? Colors.purple.shade400
                    : Colors.transparent,
              )),
          child: Row(
            children: [
              //diamond gif
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Image(
                    image: AssetImage(widget.gifUrl), height: 64, width: 64),
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
                    Text(
                      widget.titleName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),

                    //subtile
                    Text(
                      widget.subTitleName,
                      style: const TextStyle(
                          color: Color(0xffDCDCDC),
                          fontSize: 11,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                width: 16,
              ),

              //amount
              Container(
                  height: 34,
                  width: 85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: const Border(
                        top: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white),
                        left: BorderSide(color: Colors.white),
                        right: BorderSide(color: Colors.white),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        widget.amount.toString() + ' LKR',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Color(0xffFFFFFF)),
                        minFontSize: 6,
                        maxLines: 1,
                        //overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
                  // Text(
                  //   widget.amount.toString()+' LKR',
                  //   style: TextStyle(

                  //   ),
                  // ),

                  )
            ],
          ),
        ),
      ),
    );
  }
}

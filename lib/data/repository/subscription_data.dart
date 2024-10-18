

import 'package:mosam_azbow/data/models/subscription_model.dart';

class SubscriptionData {
  final List<Subscription> subscriptionList = [
    Subscription(
      index: 0,
        titleName: '1 Month Package',
        subTitleName: 'මාසික පැකේජය',
        amount: 1999,
        gifUrl: 'assets/icons/diamond.gif'),
    Subscription(
      index: 1,
        titleName: '2 Month Package',
        subTitleName: 'මාසික පැකේජය',
        amount: 2949,
        gifUrl: 'assets/icons/diamond.gif'),
    Subscription(
      index: 2,
        titleName: '3 Month Package',
        subTitleName: 'මාසික පැකේජය',
        amount: 4199,
        gifUrl: 'assets/icons/diamond.gif'),
  ];
}

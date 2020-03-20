//  Flutter Import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//  Providers Import

import './providers/logic.dart';
import './providers/categorie_detail.dart';
import './providers/product_detail.dart';
import './providers/input_provider.dart';
import './providers/seconInputProvider.dart';
import './providers/thirdInputProvider.dart';
import './providers/fourthInputProvider.dart';

//  Screens Import

import './screens/welcome_screen.dart';
import './screens/profile_screen.dart';
import './screens/personal_information.dart';
import './screens/payments_&_payouts.dart';
import './screens/notifications_screen.dart';
import './screens/inbox_screen.dart';
import './screens/invite_friends_screen.dart';
import './screens/saved_screen.dart';
import './screens/progress_screen.dart';
import './screens/new_home_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/order_screen.dart';
import './screens/input_screen.dart';
import './screens/listing_screen.dart';
import './screens/listing_input_screen.dart';
import './screens/first_listing_input_screen.dart';
import './screens/second_listing_input_screen.dart';
import './screens/third_listing_input_screen.dart';
import './screens/fourth_listing_input_screen.dart';
import './screens/see_more_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Logic(),
        ),
        ChangeNotifierProvider.value(
          value: CategoriesDetail(),
        ),
        ChangeNotifierProvider.value(
          value: ProductDetail(),
        ),
        ChangeNotifierProvider.value(
          value: InputFieldItems(),
        ),
        ChangeNotifierProvider.value(
          value: SecondInputProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ThirdInputProvider(),
        ),
        ChangeNotifierProvider.value(
          value: FourthInputProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CupCake',
        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: 'GayathriR',
        ),
        home: WelcomeScreen(),
        routes: {
          InputScreen.routeName: (ctx) => InputScreen(),
          ProfilePage.routeName: (ctx) => ProfilePage(),
          PersonalInformation.routeName: (ctx) => PersonalInformation(),
          PaymentsAndPayouts.routeName: (ctx) => PaymentsAndPayouts(),
          NotificationsScreen.routeName: (ctx) => NotificationsScreen(),
          InboxScreen.routeName: (ctx) => InboxScreen(),
          InviteFriendsScreen.routeName: (ctx) => InviteFriendsScreen(),
          SavedScreen.routeName: (ctx) => SavedScreen(),
          ProgressScreen.routeName: (ctx) => ProgressScreen(),
          NewHomePage.routeName: (ctx) => NewHomePage(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          OrderScreen.routename: (ctx) => OrderScreen(),
          ListingScreen.routeName: (ctx) => ListingScreen(),
          ListingInput.routeName: (ctx) => ListingInput(),
          FirstListingInputScreen.routeName: (ctx) => FirstListingInputScreen(),
          SecondListingInputScreen.routeName: (ctx) =>
              SecondListingInputScreen(),
          ThirdListingInputScreen.routeName: (ctx) => ThirdListingInputScreen(),
          FourthListingInputScreen.routeName: (ctx) =>
              FourthListingInputScreen(),
          SeeMoreScreen.routeName: (ctx) => SeeMoreScreen(),
        },
      ),
    );
  }
}

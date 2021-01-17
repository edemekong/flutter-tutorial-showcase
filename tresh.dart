// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

// // class DynamicLinkApi {
// //   final dynamicLink = FirebaseDynamicLinks.instance;
// //   Future handleDynamicLinks() async {
// //     //Get initial dynamic link if app is started using the link
// //     final PendingDynamicLinkData data = await dynamicLink.getInitialLink();
// //     _handleDeepLink(data);

// //     //handle foreground
// //     dynamicLink.onLink(
// //         onSuccess: (PendingDynamicLinkData dynamicLinkData) async {
// //       _handleDeepLink(dynamicLinkData);
// //     }, onError: (OnLinkErrorException error) async {
// //       print('Failed: ${error.message}');
// //     });
// //   }

// //   Future<String> createReferralLink(String referralCode) async {
// //     final DynamicLinkParameters dynamicLinkParameters = DynamicLinkParameters(
// //       uriPrefix: 'https://neerddev.page.link',
// //       link: Uri.parse('https:mydailyXpress.com/refer?code=$referralCode'),
// //       androidParameters: AndroidParameters(
// //         packageName: 'com.neerddev.my_daily_wash',
// //       ),
// //       socialMetaTagParameters: SocialMetaTagParameters(
// //         title: 'Refer A Friend',
// //         description:
// //             'Refer and earn',
// //         imageUrl: Uri.parse(
// //             'https://www.insperity.com/wp-content/uploads/Referral-_Program1200x600.png'),
// //       ),
// //     );

// //     final ShortDynamicLink shortLink =
// //         await dynamicLinkParameters.buildShortLink();
// //     final Uri dynamicUrl = shortLink.shortUrl;
// //     return dynamicUrl.toString();
// //   }

// //   void _handleDeepLink(PendingDynamicLinkData data) {
// //     final Uri deepLink = data?.link;
// //     if (deepLink != null) {
// //       var isRefer = deepLink.pathSegments.contains('refer');
// //       if (isRefer) {
// //         var code = deepLink.queryParameters['code'];
// //         if (code != null) {
// //           // RouteGenerator.navigateTo(
// //           //   SignUpLogin.routeName,
// //           //   args: code,
// //           // );
// //         }
// //       }
// //     }
// //   }
// // }

import 'package:flutter/material.dart';

class RouteGenerator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      default:
        return _errorPage();
    }
  }

  static Future<dynamic> navigateTo(String routeName, {Object args}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: args);
  }

  static goBack() {
    return navigatorKey.currentState.pop();
  }

  static Route<dynamic> _errorPage() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
            'Page Not Found',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

Future<void> navigatePushToRouteName(BuildContext context, String routeName,
    {Object arguments}) async {
  await Navigator.of(context).pushNamed(routeName, arguments: arguments);
}

Future<void> navigateReplacementToRouteName(
    BuildContext context, String routeName,
    {Object arguments}) async {
  await Navigator.of(context)
      .pushReplacementNamed(routeName, arguments: arguments);
}

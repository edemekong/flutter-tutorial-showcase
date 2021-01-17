import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_tutorials/ui/route/route_generator.dart';
import 'package:flutter_tutorials/ui/views/auth_view/sign_up.dart';

class DynamicLinksApi {
  final dynamicLink = FirebaseDynamicLinks.instance;

  handleDynamicLink() async {
    await dynamicLink.getInitialLink();
    dynamicLink.onLink(onSuccess: (PendingDynamicLinkData data) async {
      handleSuccessLinking(data);
    }, onError: (OnLinkErrorException error) async {
      print(error.message.toString());
    });
  }

  Future<String> createReferralLink(String referralCode) async {
    final DynamicLinkParameters dynamicLinkParameters = DynamicLinkParameters(
      uriPrefix: 'https://devscore.page.link',
      link: Uri.parse('https://fluttertutorial.com/refer?code=$referralCode'),
      androidParameters: AndroidParameters(
        packageName: 'com.devscore.flutter_tutorials',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: 'Refer A Friend',
        description: 'Refer and earn',
        imageUrl: Uri.parse(
            'https://www.insperity.com/wp-content/uploads/Referral-_Program1200x600.png'),
      ),
    );

    final ShortDynamicLink shortLink =
        await dynamicLinkParameters.buildShortLink();

    final Uri dynamicUrl = shortLink.shortUrl;
    print(dynamicUrl);
    return dynamicUrl.toString();
  }

  void handleSuccessLinking(PendingDynamicLinkData data) {
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      var isRefer = deepLink.pathSegments.contains('refer');
      if (isRefer) {
        var code = deepLink.queryParameters['code'];
        print(code.toString());
        if (code != null) {
          GeneratedRoute.navigateTo(
            SignUpView.routeName,
            args: code,
          );
        }
      }
    }
  }
}

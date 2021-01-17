import 'package:flutter/material.dart';
import 'package:flutter_tutorials/ui/views/home_view/widget/create_referral_code.dart';
import 'package:flutter_tutorials/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Tutorial Referral System')),
      body: Consumer<HomeViewModel>(
        builder: (_, model, child) => CreateReferralCode(
          (String referralCode) {
            model.deeplinkApi.createReferralLink(referralCode);
            return Container(
              child: Text('Home'),
            );
          },
        ),
      ),
    );
  }
}

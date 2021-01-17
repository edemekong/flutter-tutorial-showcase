import 'dart:math';
import 'package:flutter/material.dart';

class CreateReferralCode extends StatefulWidget {
  CreateReferralCode(this._builder);

  final Widget Function(String referralCode) _builder;

  @override
  State<StatefulWidget> createState() => _CreateReferralCode();
}

class _CreateReferralCode extends State<CreateReferralCode> {
  String _token;
  String _referralCode;

  var referralCodeGenerator = Random();

  void setReferralCode() {
    if (mounted) {
      setState(() {
        var id = referralCodeGenerator.nextInt(92143543) + 09451234356;
        var randomCode = "Ref-${id.toString().substring(0, 8)}";
        _referralCode = randomCode;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setReferralCode();
  }

  @override
  Widget build(BuildContext context) {
    return widget._builder(_referralCode);
  }
}

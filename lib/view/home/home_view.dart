import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_kod/core/constants/botton/default_button.dart';
import 'package:flutter_qr_kod/core/extension/color.dart';
import 'package:flutter_qr_kod/core/extension/responsive.dart';
import 'package:flutter_qr_kod/core/extension/string_constant.dart';
import 'package:flutter_qr_kod/view/home_detail/home_detail.dart';
import 'package:flutter_qr_kod/view/qr_scan_page/qr_scan_view.dart';

class HomeView extends StatelessWidget {
  static String routeName = StringConstants.instance.homeView;
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('home_page').tr(),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultButton(
              buttonHeight: SizeConfig.screenHeight * .07,
              buttonWidth: SizeConfig.screenWidth * .7,
              text: 'scan_qr'.tr(),
              buttonColor: greenColor,
              radius: 20,
              press: () {
                Navigator.pushNamed(context, QrScanView.routeName);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            DefaultButton(
              buttonHeight: SizeConfig.screenHeight * .07,
              buttonWidth: SizeConfig.screenWidth * .7,
              text: 'browsing_history'.tr(),
              buttonColor: greenColor,
              radius: 20,
              press: () {
                Navigator.pushNamed(context, HomeDetailView.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}

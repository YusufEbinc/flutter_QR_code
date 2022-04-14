import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_kod/core/constants/botton/default_button.dart';
import 'package:flutter_qr_kod/core/extension/color.dart';
import 'package:flutter_qr_kod/core/extension/responsive.dart';
import 'package:flutter_qr_kod/core/extension/string_constant.dart';
import 'package:flutter_qr_kod/view/home/home_view.dart';
import 'package:flutter_qr_kod/view/qr_scan_page/qr_scan_view_model.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanView extends StatefulWidget {
  static String routeName = StringConstants.instance.qrView;
  const QrScanView({Key? key}) : super(key: key);

  @override
  State<QrScanView> createState() => _QrScanViewState();
}

class _QrScanViewState extends State<QrScanView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool changeColor = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QrScanViewModel>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: blackColor,
        body: Consumer<QrScanViewModel>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  flex: 7,
                  child: QRView(
                    key: qrKey,
                    cameraFacing: CameraFacing.back,
                    overlay: QrScannerOverlayShape(
                      borderColor: changeColor ? greenColor : whiteColor,
                      borderRadius: 10,
                      borderLength: 20,
                      borderWidth: 10,
                      cutOutSize: SizeConfig.screenWidth * .8,
                    ),
                    onQRViewCreated: (QRViewController qrcontroller) {
                      controller = qrcontroller;
                      qrcontroller.scannedDataStream.listen((scanData) {
                        setState(() {
                          changeColor = true;
                        });
                        qrcontroller.pauseCamera();
                        value.addQrCode(scanData).then((_) {
                          Navigator.pushNamed(context, HomeView.routeName);
                        });
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: DefaultButton(
                    buttonHeight: SizeConfig.screenHeight * 0.3,
                    buttonWidth: double.infinity,
                    text: 'cancel'.tr(),
                    buttonColor: blackColor,
                    radius: 0,
                    press: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

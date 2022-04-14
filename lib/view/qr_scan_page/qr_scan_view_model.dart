import 'package:flutter/widgets.dart';
import 'package:flutter_qr_kod/core/extension/string_constant.dart';
import 'package:flutter_qr_kod/model/qr_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrScanViewModel extends ChangeNotifier {
  late Box<QrModel> listBox;

  QrScanViewModel() {
    listBox = Hive.box<QrModel>('qrlist');
  }

  Future<void> addQrCode(Barcode code) async {
    if (_linkHandler(code) == true) {
      var barcode = QrModel.fromMap(
        barcode: code.code!,
        dateTime: DateTime.now(),
      );
      await listBox.put(barcode.id, barcode);
      launchURL(code.code!);
    } else {
      return debugPrint('Value Is Not a Link');
    }

    notifyListeners();
  }

  Future<void> delete(QrModel qrModel) async {
    await qrModel.delete();
    notifyListeners();
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'failed to start  $url';
    }
  }

  bool _linkHandler(Barcode data) {
    Pattern urlPattern = StringConstants.instance.value;
    RegExp regExp = RegExp(urlPattern.toString());

    return regExp.hasMatch(data.code!);
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_kod/core/extension/custom_thema.dart';
import 'package:flutter_qr_kod/core/extension/route.dart';
import 'package:flutter_qr_kod/model/qr_model.dart';
import 'package:flutter_qr_kod/view/home/home_view.dart';
import 'package:flutter_qr_kod/view/qr_scan_page/qr_scan_view_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(QrModelAdapter());
  await Hive.openBox<QrModel>('qrlist');
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('tr', 'TR')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QrScanViewModel>.value(
      value: QrScanViewModel(),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.deviceLocale,
        title: 'Qr Code App',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        routes: routes,
        initialRoute: HomeView.routeName,
      ),
    );
  }
}

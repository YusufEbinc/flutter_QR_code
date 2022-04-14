import 'package:flutter/material.dart';
import 'package:flutter_qr_kod/view/home/home_view.dart';
import 'package:flutter_qr_kod/view/home_detail/home_detail.dart';
import 'package:flutter_qr_kod/view/qr_scan_page/qr_scan_view.dart';

final Map<String, WidgetBuilder> routes = {
  HomeView.routeName: (context) => const HomeView(),
  HomeDetailView.routeName: (context) => const HomeDetailView(),
  QrScanView.routeName: (context) => const QrScanView(),
};

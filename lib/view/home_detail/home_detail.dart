import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_kod/core/extension/color.dart';
import 'package:flutter_qr_kod/core/extension/responsive.dart';
import 'package:flutter_qr_kod/core/extension/string_constant.dart';
import 'package:flutter_qr_kod/model/qr_model.dart';
import 'package:flutter_qr_kod/view/qr_scan_page/qr_scan_view_model.dart';
import 'package:provider/provider.dart';

class HomeDetailView extends StatelessWidget {
  static String routeName = StringConstants.instance.homeViewDetail;
  const HomeDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('browsing_history').tr(),
      ),
      body: Consumer<QrScanViewModel>(
        builder: (context, value, child) => value.listBox.isEmpty
            ? Center(
                child: const Text('no_data_found').tr(),
              )
            : ListView.builder(
                itemCount: value.listBox.values.length,
                itemBuilder: (context, index) {
                  List<QrModel> allList = value.listBox.values.toList();
                  allList.sort((b, a) => a.time!.compareTo(b.time!));
                  return Container(
                    height: SizeConfig.screenHeight * .15,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greenColor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            DateFormat('HH:mm   d/M/y')
                                .format(allList[index].time!),
                            style: const TextStyle(
                                color: blackColor, fontSize: 17),
                          ),
                        ),
                        subtitle: InkWell(
                          onTap: () {
                            value.launchURL(allList[index].barcode!);
                          },
                          child: Text(
                            allList[index].barcode.toString(),
                            style: const TextStyle(color: blackColor),
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              value.delete(allList[index]);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: blackColor,
                            )),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

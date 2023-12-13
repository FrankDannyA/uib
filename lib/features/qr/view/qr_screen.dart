import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uib/features/qr/view/result_screen.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  static const String routeName = '/qr_route';

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  bool isComlete = false;
  bool isShowQrScanner = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: isShowQrScanner
                  ? MobileScanner(
                      onDetect: (barcode) {
                        if (!isComlete) {
                          String code = barcode.raw ?? '---';
                          isComlete = true;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                code: code,
                                closeScreen: () {
                                  isComlete = false;
                                },
                              ),
                            ),
                          );
                        }
                      },
                    )
                  : QrImageView(
                      data: 'https://moodle.uib.kz',
                      version: QrVersions.auto,
                    ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Скаранирование происходит автоматически'),
                  ElevatedButton(
                    child: const Text('Показать Qr'),
                    onPressed: () {
                      isShowQrScanner = !isShowQrScanner;
                      setState(() {});
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

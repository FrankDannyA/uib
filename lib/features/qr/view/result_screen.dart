import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uib/core/ui_kit/widgets/widgets.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    required this.code,
    required this.closeScreen,
    Key? key,
  }) : super(key: key);

  final String code;
  final Function() closeScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(
                data: code,
                size: 150,
                version: QrVersions.auto,
              ),
              const HBox(height: 24),
              Text(code),
              const HBox(height: 24),
              ElevatedButton(
                child: const Text('Сохранить'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => const CommingSoonAllert(),
                  );
                },
              ),
              const HBox(height: 24),
              TextButton(
                onPressed: () {
                  closeScreen();
                  Navigator.of(context).pop();
                },
                child: const Text('Закрыть'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

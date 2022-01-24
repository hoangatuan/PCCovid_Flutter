import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pccovid/screens/qr/view_model/scan_qr_view_model.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:easy_localization/src/public_ext.dart';

class ScanQRScreen extends StatefulWidget {
  const ScanQRScreen({Key? key}) : super(key: key);

  @override
  State<ScanQRScreen> createState() => _ScanQRScreenState();
}

class _ScanQRScreenState extends State<ScanQRScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  ScanQRViewModel viewModel = ScanQRViewModel();
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: [
      QRView(
        key: qrKey,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.green.shade400,
            borderRadius: 24,
            borderWidth: 8),
        onQRViewCreated: _onQRViewCreated,
        onPermissionSet: (controller, isAlow) {
          if (!isAlow) {
            handlePermissionNotAllow();
          }
        },
      ),
      Positioned(
        bottom: 24,
        left: (size.width - 80) / 2,
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                height: 32,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Colors.green.shade400),
                child: const Center(
                    child:
                        Text("Close", style: TextStyle(color: Colors.white))))),
      ),
      Positioned(
          left: (size.width - 48) / 2,
          bottom: 72,
          child: IconButton(
            icon: Image.asset(
              'assets/icons/flip.png',
              color: Colors.white,
            ),
            iconSize: 24,
            onPressed: () {
              controller?.flipCamera();
            },
          ))
    ]));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      print("Scan QR data: ${scanData.code}");
      controller.pauseCamera();
      handleScanQr(scanData);
    });
  }

  void handlePermissionNotAllow() {
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("OK"));

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text(("request_camera_permission")).tr(),
              actions: [okButton],
            ));
  }

  Future<void> handleScanQr(Barcode data) async {
    if (data.code == null || data.code!.isEmpty) {
      return;
    }
    bool isSuccess = await viewModel.savePlace(data.code!);
    String message = isSuccess
        ? "You have checked in successfully at ${data.code!}"
        : "checkin_fail".tr();

    Widget okButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          controller!.resumeCamera();
        },
        child: const Text("OK"));

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text((message)),
              actions: [okButton],
            ));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

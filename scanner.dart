import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class scanner extends StatefulWidget {
  const scanner({super.key});

  @override
  State<scanner> createState() => _qrState();
}

class _qrState extends State<scanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // Barcode? result;
  // QRViewController? controller;

  // @override
  // void dispose() {
  //   controller?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.blue.shade700,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      'Ready Set!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      'Scan the below QR to admit',
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                ],
              ),
              preferredSize: const Size(100, 125)),
          backgroundColor: Colors.blue.shade700,
          elevation: 0.0,
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   children: [
              //     Expanded(
              //       flex: 5,
              //       child: QRView(
              //         key: qrKey,
              //         onQRViewCreated: (controller) {
              //           this.controller = controller;
              //           controller.scannedDataStream.listen((scanData) {
              //             setState(() {
              //               result = scanData;
              //             });
              //           });
              //         },
              //       ),
              //     ),
              //     Expanded(
              //       flex: 1,
              //       child: Center(
              //         child: (result != null)
              //             ? Text(
              //           'QR Code Data: ${result!.code}',
              //           style: TextStyle(fontSize: 16),
              //         )
              //             : const Text(
              //           'Scan a QR Code',
              //           style: TextStyle(fontSize: 16),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
        ),
      ),
    );
  }
}

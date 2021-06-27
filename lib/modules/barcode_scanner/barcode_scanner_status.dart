import 'package:camera/camera.dart';

class BarcodeScannerStatus {
  final bool isCameraAvaible;
  final String error;
  final String barcode;
  final bool stopScanner;
  

  BarcodeScannerStatus(
      { this.isCameraAvaible= false,
      this.error = "",
      this.barcode = "",
      this.stopScanner:false, 
      });

  factory BarcodeScannerStatus.available() =>
      BarcodeScannerStatus(isCameraAvaible: true, stopScanner: false);

  factory BarcodeScannerStatus.error(String message) =>
      BarcodeScannerStatus(error: message, stopScanner: true );
  
  factory BarcodeScannerStatus.barcode(String barcode) =>
      BarcodeScannerStatus(barcode: barcode, stopScanner:true);

  bool get showCamera => this.isCameraAvaible && error.isEmpty;
  bool get hasError => this.error.isNotEmpty;
  bool get hasBarcode => barcode.isNotEmpty;
}

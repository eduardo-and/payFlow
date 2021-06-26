import 'package:camera/camera.dart';

class BarcodeScannerStatus {
  final bool isCameraAvaible;
  final String error;
  final String barcode;

  CameraController? cameraController;

  BarcodeScannerStatus(
      { this.isCameraAvaible= false,
      this.cameraController,
      this.error = "",
      this.barcode = ""});

  factory BarcodeScannerStatus.available(CameraController controller) =>
      BarcodeScannerStatus(isCameraAvaible: true, cameraController: controller);

  factory BarcodeScannerStatus.error(String message) =>
      BarcodeScannerStatus(error: message);
  
  factory BarcodeScannerStatus.barcode(String barcode) =>
      BarcodeScannerStatus(barcode: barcode);

  bool get showCamera => this.isCameraAvaible && error.isEmpty;
  bool get hasError => this.error.isEmpty;
  bool get hasBarcode => barcode.isNotEmpty;
}

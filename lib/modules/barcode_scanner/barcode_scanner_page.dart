import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

import 'barcode_scanner_status.dart';

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({Key? key}) : super(key: key);

  @override
  _BarcodeScannerState createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  final BarcodeScannerController ctrl = BarcodeScannerController();

  void initState() {
    ctrl.getAvailableCameras();
    super.initState();
  }

  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: ctrl.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: status.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            }),
        RotatedBox(
          quarterTurns: 1,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                "Escaneie o código de barras",
                style: AppTextStyles.buttonBackground,
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
              leading: BackButton(
                color: AppColors.background,
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: SetLabelButtons(
                primaryLabel: "Inserir código de boleto",
                primaryOnPressed: () {},
                secondaryLabel: "Adicionar da galeria",
                secondaryOnPressed: () {}),
          ),
        ),
        // ValueListenableBuilder<BarcodeScannerStatus>(
        //     valueListenable: ctrl.statusNotifier,
        //     builder: (_, status, __) {
        //       if (status.hasError) {
        //         return BottomSheetWidget(
        //             title: "Não foi possível identificar um código de barras.",
        //             subTitle:
        //                 "Tente escanear novamente ou digite o código do seu boleto.",
        //             primaryLabel: "Escanear novamente",
        //             primaryOnPressed: () {
        //               ctrl.getAvailableCameras();
        //             },
        //             secondaryLabel: "Digitar código",
        //             secondaryOnPressed: () {});
        //       } else {
        //         return Container();
        //       }
        //     }),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/widgets/label_button.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({Key? key}) : super(key: key);

  @override
  _BarcodeScannerState createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Escaneie o código de barras",
          style: AppTextStyles.buttonBackground,
        ),
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
      bottomNavigationBar: Row(
        children: [
          LabelButton(
            label: "Inserir código do boleto",
            onPressed: () {},
          ),
          LabelButton(
            label: "Adicionar da galeria",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

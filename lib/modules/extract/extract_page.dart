import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({ Key? key }) : super(key: key);

  @override
  _ExtractPageState createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final ctrl = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24,left: 24,right: 24),
                child: Text("Meus Extratos",style: AppTextStyles.titleBoldHeading,),
              ),
            ],
          ),  
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 24),
            child: Divider(
              color: AppColors.stroke,
              height: 1,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BoletoListWidget(ctrl: ctrl,),
          ),
        ],
        
      ),
    );
  }
}
import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_info/boleto_widget.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({ Key? key }) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final ctrl = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children:[ 
              Container(
                height: 40,
                width: double.maxFinite,
                color: AppColors.primary,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ValueListenableBuilder<List<BoletoModel>> (valueListenable: ctrl.boletosNotifier, builder: (_,boletos,__) =>
                  AnimatedCard(direction:AnimatedCardDirection.top, child: BoletoInfoWidget(size: boletos.length))
                )) 
              ]
            ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24,left: 24,right: 24),
                child: Text("Meus Boletos",style: AppTextStyles.titleBoldHeading,),
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
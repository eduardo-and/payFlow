import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text_widget/input_text_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatefulWidget {
final String? barcode;
  const InsertBoletoPage({ Key? key, this.barcode }) : super(key: key);
  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final ctrl = InsertBoletoController();

  final moneyMask = MoneyMaskedTextController(leftSymbol: "R\$",decimalSeparator: ",");

  final dueDateMask = MaskedTextController(mask:"00/00/0000");

  final barcodeInputTextController = TextEditingController();


  @override
  void initState() {
    if(widget.barcode!=null){
      barcodeInputTextController.text= widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input,),
       ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 93),
                child: Text("Preencha os dados do boleto",style: AppTextStyles.titleBoldHeading,textAlign: TextAlign.center),
              ),
              SizedBox(height: 24,),
              Form(
                key: ctrl.formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                  validator: ctrl.validateName,
                  label: "Nome do boleto",
                  icon: Icons.description_outlined,
                  onChanged: (value){ctrl.onChanged(name: value);},
                ),
                InputTextWidget(
                  validator: ctrl.validateVencimento,
                  controller: dueDateMask ,
                  label: "Vencimento",
                  icon: FontAwesomeIcons.timesCircle,
                  onChanged: (value){ctrl.onChanged(dueDate: value);}
                ),
                InputTextWidget(
                  validator:(_) => ctrl.validateValor(moneyMask.numberValue), 
                  controller: moneyMask,
                  label: "Valor",
                  icon: FontAwesomeIcons.wallet,
                  onChanged: (value){ctrl.onChanged(value: moneyMask.numberValue);},
                ),
                InputTextWidget(
                  validator: ctrl.validateCodigo,
                  controller: barcodeInputTextController,
                  label: "Código",
                  icon: FontAwesomeIcons.barcode,
                  onChanged: (value){ctrl.onChanged(barcode: value);}
                ),
                  ],
              ))
      
            ],
          ),
        ),
      ),
    bottomNavigationBar: SetLabelButtons(primaryLabel: "Cancelar", primaryOnPressed: (){Navigator.pop(context);},secondaryLabel: "Cadastrar",secondaryOnPressed:()async{await ctrl.cadastrarBoleto(context);},enableSecondaryColor: true,)
      
    );
  }
}
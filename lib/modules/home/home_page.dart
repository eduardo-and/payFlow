import 'package:flutter/material.dart';
import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/meus_boletos_page/meus_boletos_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';


class HomePage extends StatefulWidget {
  
  final UserModel user;
  const HomePage({Key? key,required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ctrl = HomeController();
  final pages = [
    MeusBoletosPage(key: UniqueKey()),
    ExtractPage(key: UniqueKey())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152), 
        child: Container(
            height: 152,
            color: AppColors.primary,
            child: SafeArea(
              child: Center(
                child: ListTile(
                  title: Text.rich(
                    TextSpan(
                        text: "Olá, ",
                        style: AppTextStyles.titleRegular,
                        children: [
                          TextSpan(
                              text: "${widget.user.name}",
                              style: AppTextStyles.titleBoldBackground)
                        ]),
                  ),
                  subtitle: Text(
                    "Mantenha suas contas em dia",
                    style: AppTextStyles.captionShape,
                  ),
                  trailing: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(image: NetworkImage(widget.user.photoUrl!)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            )),
      ),
      bottomNavigationBar: Container(
        //color: AppColors.primary,
        height: 90,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
              onPressed: () {
                setState(() {
                  ctrl.setPage(0);
                });
              },
              icon: Icon(
                Icons.home,
                color:
                    ctrl.currentPage == 0 ? AppColors.primary : AppColors.body,
                size: 30,
              )),
          GestureDetector(
            onTap: () async {
              // Navigator.pushNamed(context, "/barcode_scanner");
              await Navigator.pushNamed(context, "/barcode_scanner");
              setState(() {});
            },  
            child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                )),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  ctrl.setPage(1);
                });
              },
              icon: Icon(
                Icons.description_outlined,
                color:
                    ctrl.currentPage == 1 ? AppColors.primary : AppColors.body,
                size: 30,
              )),
        ]),
      ),
      body: [
    MeusBoletosPage(key: UniqueKey()),
    ExtractPage(key: UniqueKey())
  ][ctrl.currentPage],
    );
  }
}

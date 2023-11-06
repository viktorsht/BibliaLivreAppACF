import 'package:flutter/material.dart';
import '../constants/colors_app.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onSettingsPressed;
  final Function()? onBackPressed; // Nova função

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onSettingsPressed,
    this.onBackPressed, // Adicione a nova função
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          color: ColorsApp.lightColorText,
          fontWeight: FontWeight.w500
        ),
      ),
      backgroundColor: ColorsApp.primaryColor,
      centerTitle: true,
      leading: onBackPressed != null
          ? IconButton(
              onPressed: onBackPressed, // Chame a função de navegação
              icon: Icon(
                Icons.arrow_back,
                color: ColorsApp.lightColorText,
              ),
            )
          : null,
      actions: onSettingsPressed != null
          ? [
              IconButton(
                onPressed: onSettingsPressed,
                icon: Icon(
                  Icons.settings,
                  color: ColorsApp.lightColorText,
                ),
              ),
            ]
          : null,
      elevation: 1,
      iconTheme: IconThemeData(color: ColorsApp.lightColorText),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

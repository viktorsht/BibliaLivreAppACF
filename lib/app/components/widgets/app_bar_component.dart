import 'package:flutter/material.dart';
import '../../constants/colors_app.dart';

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
          color: Theme.of(context).brightness == Brightness.dark 
            ? Theme.of(context).colorScheme.onSecondary 
            : Theme.of(context).colorScheme.onPrimary,
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
            color: Theme.of(context).brightness == Brightness.dark 
              ? Theme.of(context).colorScheme.onSecondary 
              : Theme.of(context).colorScheme.onPrimary,
          ),
        )
      : null,
      elevation: 1,
      iconTheme: IconThemeData(
        color: Theme.of(context).brightness == Brightness.dark 
          ? Theme.of(context).colorScheme.onSecondary 
          : Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

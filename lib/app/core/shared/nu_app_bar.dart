import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_clone/app/core/shared/nu_circle_icon.dart';

import 'nu_icons_icons.dart';

class NuAppBar extends PreferredSize {
  final String title;

  const NuAppBar({this.title});
  
  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NuCircleIcon(
            onTap: () {
              Modular.to.pop();
            },
            icon: NuIcons.nuds_ic_chevron_left,
          ),
        ],
      ),
      title: title != null ? Text(title) : null,
      centerTitle: true,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nubank_clone/app/core/shared/nu_circle_icon.dart';

class HeaderWidget extends StatelessWidget {
  final Function onShowInfo;

  final bool showInfos;
  final String name;

  HeaderWidget({
    @required this.onShowInfo,
    @required this.showInfos,
    @required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Olá, $name",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              NuCircleIcon(
                onTap: onShowInfo,
                icon: showInfos
                    ? FontAwesomeIcons.eye
                    : FontAwesomeIcons.eyeSlash,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


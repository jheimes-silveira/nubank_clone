import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NuCircleIcon extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  const NuCircleIcon({
    @required this.icon,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Theme.of(context).primaryColor,
        child: FaIcon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

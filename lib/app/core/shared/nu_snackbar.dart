import 'package:flutter/material.dart';
import 'package:nubank_clone/app/core/shared/nu_icons_icons.dart';
import 'package:nubank_clone/app/core/utils/error_utils.dart';

class NuSnackbar {
  static success(
    message, {
    @required GlobalKey<ScaffoldState> scaffoldKey,
  }) {
    if (message is Exception) message = ErrorUtils.getMessage(message);
    final snackBar = _snackBar(
      message,
      NuIcons.nuds_ic_check,
    );

    if (message != null) _show(scaffoldKey, snackBar);
  }

  static info(
    message, {
    @required GlobalKey<ScaffoldState> scaffoldKey,
  }) {
    if (message is Exception) message = ErrorUtils.getMessage(message);
    final snackBar = _snackBar(
      message,
      NuIcons.nuds_ic_info,
    );

    if (message != null) _show(scaffoldKey, snackBar);
  }

  static error(
    message, {
    @required GlobalKey<ScaffoldState> scaffoldKey,
  }) {
    if (message is Exception) message = ErrorUtils.getMessage(message);
    final snackBar = _snackBar(
      message,
      NuIcons.ic_error_alert,
    );

    if (message != null) _show(scaffoldKey, snackBar);
  }

  static SnackBar _snackBar(
    message,
    IconData iconData,
  ) {
    return SnackBar(
      action: _buildSnackBarAction(),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildIcon(iconData),
          _buildText(message),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
    );
  }

  static SnackBarAction _buildSnackBarAction() {
    return SnackBarAction(
      label: "Fechar",
      textColor: Colors.white,
      onPressed: () {},
    );
  }

  static Expanded _buildText(message) {
    return Expanded(
      child: Text(
        message,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static Padding _buildIcon(IconData iconData) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
      ),
      child: Icon(
        iconData,
      ),
    );
  }

  static _show(GlobalKey<ScaffoldState> scaffoldKey, SnackBar snackBar) {
    scaffoldKey.currentState.showSnackBar(
      snackBar,
    );
  }
}

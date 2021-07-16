import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_clone/app/core/utils/routers.dart';

import 'home_controller.dart';
import 'widgets/center_card/center_card_widget.dart';
import 'widgets/header/header_widget.dart';
import 'widgets/tab_menu/tab_menu_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();

    controller.fetchUserBank();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                Observer(builder: (_) {
                  return HeaderWidget(
                    onShowInfo: () => controller.setShowInfos(),
                    showInfos: controller.showInfos && !controller.loading,
                    name: controller.name,
                  );
                }),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TabMenuWidget(),
          ),
          Observer(
            builder: (_) {
              return CenterCardWidget(
                controller.showInfos,
                controller.balance,
                () async {
                  await Routers.goToNuShopDashboard();
                  controller.updateBalance();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

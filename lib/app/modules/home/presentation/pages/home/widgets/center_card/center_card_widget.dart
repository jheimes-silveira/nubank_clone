import 'package:flutter/material.dart';
import 'package:nubank_clone/app/modules/home/presentation/pages/home/widgets/card_pages/balance/balance_widget.dart';
import 'package:nubank_clone/app/modules/home/presentation/pages/home/widgets/card_pages/nushop/nushop_widget.dart';

class CenterCardWidget extends StatelessWidget {
  final bool showInfos;
  final double balance;
  final Function onNuShop;
  
  CenterCardWidget(
    this.showInfos,
    this.balance,
    this.onNuShop,
  );

  @override
  Widget build(BuildContext context) {
    List<Widget> cardPages = [
      BalanceWidget(showInfos, balance),
      SizedBox(height: 15),
      NuShopWidget(onNuShop),
    ];
    return Container(
      height: 440,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: cardPages.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: cardPages[index],
          );
        },
      ),
    );
  }
}

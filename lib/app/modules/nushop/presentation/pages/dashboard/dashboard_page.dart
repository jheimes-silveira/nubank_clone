import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_clone/app/core/extensions/double.dart';
import 'package:nubank_clone/app/core/shared/nu_app_bar.dart';
import 'package:nubank_clone/app/core/shared/nu_icons_icons.dart';
import 'package:nubank_clone/app/core/shared/nu_snackbar.dart';
import 'package:nubank_clone/app/core/utils/routers.dart';
import 'package:nubank_clone/app/modules/nushop/domain/model/arguments/purchase_product_argument.dart';
import 'package:nubank_clone/app/modules/nushop/presentation/pages/dashboard/dashboard_controller.dart';
import 'package:nubank_clone/app/modules/nushop/presentation/pages/dashboard/widgets/card_item_product_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage();
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState
    extends ModularState<DashboardPage, DashboardController> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

    controller.updateBalance();
    controller.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _buildAppBar(context),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF5F6FA),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
          ),
        ),
        alignment: Alignment.center,
        child: Observer(builder: (_) {
          if (controller.loading) {
            return CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            );
          }
          if (controller.products == null || controller.products.isEmpty) {
            return Text(
              "Nenhum produto encontrado",
              style: TextStyle(
                color: Colors.black,
              ),
            );
          }
          return Column(
            children: [
              _buildBalance(),
              _buildSearch(),
              _buildProducts(),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildProducts() {
    return Expanded(
      child: Observer(builder: (_) {
        return GridView.builder(
          shrinkWrap: true,
          semanticChildCount: 2,
          itemCount: controller.products.length,
          padding: EdgeInsets.only(
            top: 16,
            right: 16,
            left: 16,
            bottom: 88,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 220,
          ),
          itemBuilder: (_, index) {
            final product = controller.products[index];

            return CardItemProductWidget(
              product,
              onTap: () async {
                final result = await Routers.goToNuShopProduct(product);

                if (result is PurchaseProductArgument) {
                  controller.updateBalance();
                  NuSnackbar.success(
                    "Compra no valor de ${result.product.price.formatMoney()} feita com sucesso",
                    scaffoldKey: scaffoldKey,
                  );
                }
              },
            );
          },
        );
      }),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return NuAppBar(title: "Shopping");
  }

  Widget _buildBalance() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        right: 8.0,
        left: 8.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 8,
              left: 8,
            ),
            child: Icon(
              NuIcons.ic_logo_nu,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(
            "Saldo em conta  ",
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: Colors.black45,
                ),
          ),
          Text(
            controller.balance.formatMoney(),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
        right: 16,
        left: 16,
        bottom: 16,
      ),
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(NuIcons.nuds_ic_search),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

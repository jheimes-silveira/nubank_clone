import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_clone/app/core/extensions/double.dart';
import 'package:nubank_clone/app/core/shared/nu_app_bar.dart';
import 'package:nubank_clone/app/core/shared/nu_network_image.dart';
import 'package:nubank_clone/app/core/shared/nu_snackbar.dart';
import 'package:nubank_clone/app/modules/nushop/domain/model/arguments/purchase_product_argument.dart';
import 'package:nubank_clone/app/modules/nushop/domain/model/entities/product_entity.dart';
import 'package:nubank_clone/app/modules/nushop/presentation/pages/product/product_controller.dart';

class ProductPage extends StatefulWidget {
  final ProductEntity product;

  const ProductPage(this.product);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends ModularState<ProductPage, ProductController> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _buildAppBar(context),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
          ),
        ),
        alignment: Alignment.topCenter,
        child: Observer(builder: (_) {
          return Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 16,
                right: 8,
                left: 8,
                bottom: 88,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildImage(),
                    _buildTitle(context),
                    _buildDescription(context),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildPrice(context),
            _buildButtonPurchase(),
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildButtonPurchase() {
    return ElevatedButton(
      onPressed: () async {
        final purchase = await _showDialogConfirmPurchase(context);

        if (purchase) {
          final message = await controller.purchase(widget.product);
          
          if (message != null) {
            NuSnackbar.error(message, scaffoldKey: scaffoldKey);
            return;
          }

          Modular.to.pop(PurchaseProductArgument(
            widget.product,
          ));
        }
      },
      child: Text(
        "Comprar agora",
      ),
    );
  }

  Widget _buildPrice(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: widget.product.price.formatMoney(),
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          TextSpan(
            text: '  à vista',
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        right: 8,
        left: 8,
      ),
      child: Text(
        widget.product.title,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: Colors.black,
            ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        right: 8,
        left: 8,
      ),
      child: Text(
        widget.product.description,
        style: Theme.of(context).textTheme.bodyText2.copyWith(
              color: Colors.black,
            ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      alignment: Alignment.center,
      child: NuNetworkImage(
        widget.product.image,
        height: 150,
        key: Key(widget.product.id + widget.product.image),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return NuAppBar(title: "Produto");
  }

  Future<bool> _showDialogConfirmPurchase(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Confirmar compra",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black87),
          ),
          content: Text(
            "Confirmar a compra de ${widget.product.title} no valor de ${widget.product.price.formatMoney()}",
            style: TextStyle(color: Colors.black54),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancelar"),
              style: TextButton.styleFrom(
                primary: Theme.of(context).disabledColor,
              ),
              onPressed: () async {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text("Confirmar"),
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}

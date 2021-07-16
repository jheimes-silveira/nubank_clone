import 'package:flutter/material.dart';
import 'package:nubank_clone/app/core/extensions/double.dart';
import 'package:nubank_clone/app/core/shared/nu_network_image.dart';
import 'package:nubank_clone/app/modules/nushop/domain/model/entities/product_entity.dart';

class CardItemProductWidget extends StatelessWidget {
  final Function onTap;
  final ProductEntity product;

  const CardItemProductWidget(
    this.product, {
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              _buildTitle(context),
              _buildPrice(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildPrice(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        right: 8,
        left: 8,
      ),
      child: Text(
        product.price.formatMoney(),
        style: Theme.of(context).textTheme.caption.copyWith(
              color: Theme.of(context).primaryColor,
            ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        right: 8,
        left: 8,
      ),
      child: Text(
        product.title,
        style: Theme.of(context).textTheme.caption.copyWith(
              color: Colors.black,
            ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      alignment: Alignment.center,
      child: NuNetworkImage(
        product.image,
        height: 150,
        key: Key(product.id + product.image),
      ),
    );
  }
}

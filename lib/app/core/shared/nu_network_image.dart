import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nubank_clone/app/core/shared/nu_icons_icons.dart';

class NuNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final Key key;

  const NuNetworkImage(
    this.imageUrl, {
    this.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      alignment: Alignment.center,
      key: key,
      imageUrl: imageUrl,
      placeholder: (context, url) => Container(
        alignment: Alignment.center,
        child: SpinKitCircle(
          color: Theme.of(context).disabledColor,
          size: 25,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        child: Icon(NuIcons.ic_error),
        alignment: Alignment.center,
      ),
    );
  }
}

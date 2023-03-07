import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WidgetImage {
  /// assetImage
  static asset(String name,
      {double? width,
      double? height,
      BoxFit? fit,
      String package = 'api_repository'}) {
    return Image.asset(
      name,
      width: width,
      height: height,
      package: package,
      fit: fit,
    );
  }

  static getImage(
      {required String url,
      required double width,
      required double height,
      String errorPic = ''}) {
    return CachedNetworkImage(
      cacheKey: url,
      fit: BoxFit.fill,
      imageUrl: url,
      width: width,
      height: height,
      errorWidget: (context, url, error) =>
          errorPic == '' ? SizedBox() : WidgetImage.asset(errorPic),
    );
  }

  /// 圆角
  static getImageRect(
      {required String url,
      required double width,
      required double height,
      required BorderRadius borderRadius,
      String errorPic = ''}) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        cacheKey: url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        ),
        fit: BoxFit.fill,
        imageUrl: url,
        width: width,
        height: height,
        errorWidget: (context, url, error) =>
            errorPic == '' ? SizedBox() : WidgetImage.asset(errorPic),
      ),
    );
  }
}

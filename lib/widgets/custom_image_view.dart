import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension ImageTypeExtension on String {
  ImageType get imageType {
    if (this.startsWith('http') || this.startsWith('https')) {
      return ImageType.network;
    } else if (this.endsWith('svg')) {
      return ImageType.svg;
    } else if (this.startsWith('file://')) {
      return ImageType.file;
    } else if (this.endsWith('png')) {
      return ImageType.png;
    } else {
      return ImageType.unknown;
    }
  }
}

enum ImageType { svg, png, network, file, unknown }

class CustomImageView extends StatelessWidget {
  CustomImageView({
    Key? key,
    this.imagePath,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.placeHolder = 'assets/images/image_not_found.png',
  }) : super(key: key);

  final String? imagePath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final double? radius;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? border;
  final String placeHolder;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment!, child: _buildWidget())
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: _buildImage(),
      ),
    );
  }

  Widget _buildImage() {
    switch (imagePath!.imageType) {
      case ImageType.svg:
        return Container(
          height: height,
          width: width,
          child: SvgPicture.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
          ),
        );
      case ImageType.file:
        return Image.file(
          File(imagePath!),
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          color: color,
        );
      case ImageType.network:
        return CachedNetworkImage(
          imageUrl: imagePath!,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          color: color,
          placeholder: (context, url) => Container(
            height: 30,
            width: 30,
            child: LinearProgressIndicator(
              color: Colors.grey.shade200,
              backgroundColor: Colors.grey.shade100,
            ),
          ),
          errorWidget: (context, url, error) => Image.asset(
            placeHolder,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
          ),
        );
      case ImageType.png:
        return Image.asset(
          imagePath!,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          color: color,
        );
      case ImageType.unknown:
        return Image.asset(
          placeHolder,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
        );
    }
  }
}

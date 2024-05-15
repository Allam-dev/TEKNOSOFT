import 'package:flutter/material.dart';
import 'package:shopink/core/failures/logger.dart';
import 'package:shopink/core/ui/assets/assets.gen.dart';

class AppNetworkImage extends StatelessWidget {
  final String src;
  final AssetBundle? bundle;
  final ImageFrameBuilder? frameBuilder;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final double scale;
  final double? width;
  final double? height;
  final Color? color;
  final Animation<double>? opacity;
  final BlendMode? colorBlendMode;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final ImageRepeat repeat;
  final Rect? centerSlice;
  final bool matchTextDirection;
  final bool gaplessPlayback;
  final bool isAntiAlias;
  final String? package;
  final FilterQuality filterQuality;
  final int? cacheWidth;
  final int? cacheHeight;
  final Map<String, String>? headers;

  const AppNetworkImage({
    super.key,
    required this.src,
    this.bundle,
    this.frameBuilder,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.scale = 1,
    this.width,
    this.height,
    this.color,
    this.opacity,
    this.colorBlendMode,
    this.fit,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.centerSlice,
    this.matchTextDirection = false,
    this.gaplessPlayback = false,
    this.isAntiAlias = false,
    this.package,
    this.filterQuality = FilterQuality.low,
    this.cacheWidth,
    this.cacheHeight,
    this.headers,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      errorBuilder: (context, error, stackTrace) {
        Log.error("try to load image: $src \n${error.toString()}");
        return Assets.images.placeholder.image(
          width: width,
          height: height,
          color: color,
          colorBlendMode: colorBlendMode,
          fit: fit,
          package: package,
          filterQuality: filterQuality,
          cacheWidth: cacheWidth,
          cacheHeight: cacheHeight,
          semanticLabel: semanticLabel,
          opacity: opacity,
          alignment: alignment,
          repeat: repeat,
          excludeFromSemantics: excludeFromSemantics,
          centerSlice: centerSlice,
          isAntiAlias: isAntiAlias,
          matchTextDirection: matchTextDirection,
          gaplessPlayback: gaplessPlayback,
          frameBuilder: frameBuilder,
          bundle: bundle,
          scale: scale,
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      fit: fit,
      width: width,
      height: height,
      scale: scale,
      frameBuilder: frameBuilder,
      filterQuality: filterQuality,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      color: color,
      colorBlendMode: colorBlendMode,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
      opacity: opacity,
      headers: headers,
      centerSlice: centerSlice,
      isAntiAlias: isAntiAlias,
    );
  }
}

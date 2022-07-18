import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleCachedNetworkImageWidget extends StatelessWidget {
  const CircleCachedNetworkImageWidget({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String? imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      imageBuilder: (context, imageProvider) => SizedBox(
        width: width,
        height: height,
        child: CircleAvatar( 
          backgroundImage: imageProvider,
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

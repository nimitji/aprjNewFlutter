import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:ui_web' as ui;
import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:transparent_image/transparent_image.dart';

class WebImage extends StatelessWidget {
  final String imageUrl;
  const WebImage(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      ui.platformViewRegistry.registerViewFactory(
        imageUrl,
        (int viewId) => html.ImageElement()..src = imageUrl,
      );
      return HtmlElementView(viewType: imageUrl);
    }

    return Image.network(imageUrl);
  }
}

class WebNetworkImage extends StatelessWidget {
  final String imageUrl;
  const WebNetworkImage(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      ui.platformViewRegistry.registerViewFactory(
        imageUrl,
        (int viewId) => html.ImageElement()..src = imageUrl,
      );
      return HtmlElementView(viewType: imageUrl);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class WebFadeInImage extends StatelessWidget {
  final String imageUrl;
  const WebFadeInImage(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      ui.platformViewRegistry.registerViewFactory(
        imageUrl,
        (int viewId) => html.ImageElement()..src = imageUrl,
      );
      return HtmlElementView(viewType: imageUrl);
    }

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: FadeInImage.memoryNetwork(
        image: imageUrl,
        fit: BoxFit.cover,
        placeholder: kTransparentImage,
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset('image/na.jpg', fit: BoxFit.cover);
        },
      ),
    );
  }
}

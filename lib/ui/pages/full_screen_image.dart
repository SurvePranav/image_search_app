import 'package:flutter/material.dart';

class ImageFullScreen extends StatelessWidget {
  final String imageUrl;
  final String tag;
  const ImageFullScreen({
    super.key,
    required this.imageUrl,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Hero(
            tag: tag,
            child: Image.network(
              imageUrl,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Loading...'),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

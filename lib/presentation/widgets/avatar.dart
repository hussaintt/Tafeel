import 'package:flutter/material.dart';

class AvatarUI extends StatelessWidget {
  const AvatarUI({
    super.key,
    required this.size,
    required this.imageUrl,
  });

  final double size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipOval(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 1) Network image with loading/error handling
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: progress.expectedTotalBytes != null
                        ? progress.cumulativeBytesLoaded /
                            (progress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stack) {
                return const Center(
                  child: Icon(
                    Icons.error,
                    size: 24,
                    color: Colors.redAccent,
                  ),
                );
              },
            ),

            // 2) Optional overlay asset (e.g. a frame or badge)
          ],
        ),
      ),
    );
  }
}

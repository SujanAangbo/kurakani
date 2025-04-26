import 'package:flutter/material.dart';
import 'package:kurakani/common/widgets/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class ChatTileShimmer extends StatelessWidget {
  const ChatTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.black.withOpacity(0.5),
      child: ListTile(
        leading: Skeleton(
          height: 40,
          width: 40,
          isCircle: true,
        ),
        title: Skeleton(
          height: 30,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Skeleton(
            height: 20,
          ),
        ),
      ),
    );
  }
}

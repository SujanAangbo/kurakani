import 'package:flutter/material.dart';
import 'package:kurakani/common/widgets/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class ContactShimmer extends StatelessWidget {
  const ContactShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.black.withOpacity(0.5),
      child: ListView.builder(
        itemCount: 20,
          itemBuilder: (context, index) {
        return ListTile(
          leading: Skeleton(
            height: 40,
            width: 40,
            isCircle: true,
          ),
          title: Skeleton(
            height: 40,
          ),
        );
      }),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/extensions/formatted_time_from_now.dart';
import 'package:social_media_app/core/presentation/resources/values_manager.dart';
import 'package:social_media_app/features/posts/domain/entities/post.dart';

class PostItem extends StatelessWidget {
  const PostItem(this.post);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(
        top: Insets.s,
        right: Insets.s,
        left: Insets.s,
      ),
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: post.publisherImage,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  backgroundImage: imageProvider,
                  backgroundColor: Colors.transparent,
                ),
              ),
              const SizedBox(width: Sizes.s4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.publisherName,
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: Sizes.s1_5),
                  Text(
                    post.dateTime.formattedTimeFromNow,
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          if (post.text != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Insets.xxs),
              child: Text(
                post.text!,
                style: textTheme.bodyMedium,
              ),
            ),
          if (post.imageUrl != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Insets.xs),
              child: CachedNetworkImage(
                imageUrl: post.imageUrl!,
                height: MediaQuery.of(context).size.height * .2,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_app/features/posts/domain/entities/post.dart';

part 'posts_state.freezed.dart';

@freezed
class PostsState with _$PostsState {
  const factory PostsState.initial() = PostsInitial;

  const factory PostsState.loading() = PostsLoading;
  const factory PostsState.success() = PostsSuccess;
  const factory PostsState.error() = PostsError;

  const factory PostsState.getPostsLoading() = GetPostsLoading;
  const factory PostsState.getPostsSuccess(final List<Post> posts) =
      GetPostsSuccess;
  const factory PostsState.getPostsError() = GetPostsError;
}

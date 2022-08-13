import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_state.freezed.dart';

@freezed
class PostsState with _$PostsState {
  const factory PostsState.initial() = PostsInitial;
  const factory PostsState.loading() = PostsLoading;
  const factory PostsState.success() = PostsSuccess;
  const factory PostsState.error() = PostsError;
}

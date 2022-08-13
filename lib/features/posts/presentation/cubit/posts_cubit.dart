import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/domain/params/no_params.dart';
import 'package:social_media_app/features/posts/domain/entities/post.dart';
import 'package:social_media_app/features/posts/domain/usecases/add_post_usecase.dart';
import 'package:social_media_app/features/posts/domain/usecases/delete_post_usecase.dart';
import 'package:social_media_app/features/posts/domain/usecases/edit_post_usecase.dart';
import 'package:social_media_app/features/posts/domain/usecases/get_all_posts_usecase.dart';
import 'package:social_media_app/features/posts/presentation/cubit/posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(
    this._addPostUseCase,
    this._getAllPostsUseCase,
    this._editPostUseCase,
    this._deletePostUseCase,
  ) : super(const PostsInitial());

  final AddPostUseCase _addPostUseCase;
  final GetAllPostsUseCase _getAllPostsUseCase;
  final EditPostUseCase _editPostUseCase;
  final DeletePostUseCase _deletePostUseCase;

  Future<void> addPost(Post post) async {
    emit(const PostsLoading());
    final result = await _addPostUseCase(
      AddPostParams(post),
    );
    emit(
      result.fold(
        (failure) => const PostsError(),
        (_) => const PostsSuccess(),
      ),
    );
  }

  Future<void> getAllPosts() async {
    emit(const PostsLoading());
    final result = await _getAllPostsUseCase(const NoParams());
    emit(
      result.fold(
        (failure) => const PostsError(),
        (_) => const PostsSuccess(),
      ),
    );
  }

  Future<void> editPost(Post post) async {
    emit(const PostsLoading());
    final result = await _editPostUseCase(
      EditPostParams(post),
    );
    emit(
      result.fold(
        (failure) => const PostsError(),
        (_) => const PostsSuccess(),
      ),
    );
  }

  Future<void> deletePost(String postId) async {
    emit(const PostsLoading());
    final result = await _deletePostUseCase(DeletePostParams(postId));
    emit(
      result.fold(
        (failure) => const PostsError(),
        (_) => const PostsSuccess(),
      ),
    );
  }
}

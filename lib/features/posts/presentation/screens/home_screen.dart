import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/presentation/resources/routes_manager.dart';
import 'package:social_media_app/core/presentation/widgets/error_indicator.dart';
import 'package:social_media_app/core/presentation/widgets/loading_indicator.dart';
import 'package:social_media_app/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:social_media_app/features/posts/presentation/cubit/posts_state.dart';
import 'package:social_media_app/features/posts/presentation/widgets/home_drawer.dart';
import 'package:social_media_app/features/posts/presentation/widgets/post_item.dart';
import 'package:social_media_app/generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostsCubit>(context).getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.addPost),
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          return state.maybeWhen(
            getPostsLoading: () => const LoadingIndicator(),
            getPostsError: () => const ErrorIndicator(),
            getPostsSuccess: (posts) => ListView.builder(
              itemBuilder: (_, index) => PostItem(posts[index]),
              itemCount: posts.length,
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

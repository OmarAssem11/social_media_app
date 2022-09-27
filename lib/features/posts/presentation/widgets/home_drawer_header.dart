import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/presentation/resources/values_manager.dart';
import 'package:social_media_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:social_media_app/features/auth/presentation/cubit/auth_state.dart';

class HomeDrawerHeader extends StatefulWidget {
  const HomeDrawerHeader();

  @override
  State<HomeDrawerHeader> createState() => _HomeDrawerHeaderState();
}

class _HomeDrawerHeaderState extends State<HomeDrawerHeader> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthCubit>(context).getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + Insets.xl,
        bottom: Insets.xl,
      ),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(
            currentUser: (user) {
              return Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: user.imageUrl,
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      radius: Sizes.s40,
                      backgroundImage: imageProvider,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const SizedBox(height: Sizes.s16),
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

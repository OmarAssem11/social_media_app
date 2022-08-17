import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/presentation/resources/values_manager.dart';
import 'package:social_media_app/core/presentation/widgets/custom_elevated_button.dart';
import 'package:social_media_app/core/presentation/widgets/custom_text_form_field.dart';
import 'package:social_media_app/features/posts/domain/entities/post.dart';
import 'package:social_media_app/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:social_media_app/generated/l10n.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen();

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final bodyController = TextEditingController();
  final isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.addPost),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Insets.xxl),
        child: Column(
          children: [
            CustomTextFormField(
              controller: bodyController,
              hintText: S.current.whatIsOnYourMind,
              keyboardType: TextInputType.text,
              maxLines: 4,
            ),
            const SizedBox(height: Sizes.s16),
            CustomElevatedButton(
              label: S.current.submit,
              onPressed: () => BlocProvider.of<PostsCubit>(context).addPost(
                Post(
                  text: bodyController.text,
                  imageUrl: '',
                  dateTime: DateTime.now(),
                  publisherName: '',
                  publisherImage: '',
                ),
              ),
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}

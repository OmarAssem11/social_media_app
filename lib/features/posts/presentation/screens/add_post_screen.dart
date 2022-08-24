import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/core/presentation/resources/values_manager.dart';
import 'package:social_media_app/core/presentation/widgets/custom_elevated_button.dart';
import 'package:social_media_app/core/presentation/widgets/custom_text_form_field.dart';
import 'package:social_media_app/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:social_media_app/features/posts/presentation/cubit/posts_state.dart';
import 'package:social_media_app/generated/l10n.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen();

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final bodyController = TextEditingController();
  File? pickedImage;
  bool isLoading = false;

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
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: BlocConsumer<PostsCubit, PostsState>(
                    listener: (context, state) {
                      state.mapOrNull(
                        loading: (_) => isLoading = true,
                        success: (_) => Navigator.of(context).pop(),
                      );
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        label: S.current.submit,
                        onPressed: () =>
                            BlocProvider.of<PostsCubit>(context).addPost(
                          text: bodyController.text,
                          imageFile: pickedImage,
                        ),
                        isLoading: isLoading,
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    onPressed: () async => pickedImage = await _getImage(),
                    icon: const Icon(Icons.photo),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<File?> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  @override
  void dispose() {
    bodyController.dispose();
    super.dispose();
  }
}

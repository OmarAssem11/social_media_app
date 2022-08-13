import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/presentation/resources/routes_manager.dart';
import 'package:social_media_app/core/presentation/resources/values_manager.dart';
import 'package:social_media_app/core/presentation/util/show_error_toast.dart';
import 'package:social_media_app/core/presentation/validation/validators.dart';
import 'package:social_media_app/core/presentation/widgets/custom_elevated_button.dart';
import 'package:social_media_app/core/presentation/widgets/custom_text_form_field.dart';
import 'package:social_media_app/core/presentation/widgets/password_text_form_field.dart';
import 'package:social_media_app/features/auth/domain/entities/register_entity.dart';
import 'package:social_media_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:social_media_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:social_media_app/generated/l10n.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen();

  @override
  State<RegisterScreen> createState() => _ForgoPasswordScreenState();
}

class _ForgoPasswordScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late TextTheme textTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    textTheme = Theme.of(context).textTheme;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Insets.xxl),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Sizes.s20),
                    Text(
                      S.current.register,
                      style: textTheme.headline4,
                    ),
                    CustomTextFormField(
                      controller: nameController,
                      hintText: S.current.firstName,
                      prefixIcon: Icons.person_outline,
                      keyboardType: TextInputType.name,
                      validator: (name) => generalValidator(
                        value: name,
                        fieldName: S.current.firstName,
                      ),
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: S.current.emailAddress,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) => emailValidator(email),
                    ),
                    PasswordTextFormField(controller: passwordController),
                    const SizedBox(height: Sizes.s16),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        bool isLoading = false;
                        state.mapOrNull(
                          loading: (_) => isLoading = true,
                          error: (_) => showErrorToast(),
                          success: (_) =>
                              WidgetsBinding.instance.addPostFrameCallback(
                            (_) => Navigator.of(context).pushReplacementNamed(
                              AppRoutes.home,
                            ),
                          ),
                        );
                        return CustomElevatedButton(
                          label: S.current.register,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context).register(
                                RegisterEntity(
                                  firstName: nameController.text,
                                  lastName: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          },
                          isLoading: isLoading,
                        );
                      },
                    ),
                    const SizedBox(height: Sizes.s20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.current.alreadyHaveAnAccount,
                          style: textTheme.subtitle1,
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.login),
                          child: Text(S.current.login),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

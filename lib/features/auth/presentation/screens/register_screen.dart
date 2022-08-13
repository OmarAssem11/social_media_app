import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/presentation/resources/routes_manager.dart';
import 'package:social_media_app/core/presentation/resources/values_manager.dart';
import 'package:social_media_app/core/presentation/util/error_toast.dart';
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
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late TextTheme _textTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _textTheme = Theme.of(context).textTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.xxl),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.register,
                style: _textTheme.headline4,
              ),
              const SizedBox(height: Sizes.s8),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: _firstNameController,
                      hintText: S.current.firstName,
                      prefixIcon: Icons.person_outline,
                      keyboardType: TextInputType.name,
                      validator: (firstName) => generalValidator(
                        value: firstName,
                        fieldName: S.current.firstName,
                      ),
                    ),
                  ),
                  const SizedBox(width: Sizes.s8),
                  Expanded(
                    child: CustomTextFormField(
                      controller: _lastNameController,
                      hintText: S.current.lastName,
                      prefixIcon: Icons.person_outline,
                      keyboardType: TextInputType.name,
                      validator: (lastName) => generalValidator(
                        value: lastName,
                        fieldName: S.current.lastName,
                      ),
                    ),
                  ),
                ],
              ),
              CustomTextFormField(
                controller: _emailController,
                hintText: S.current.emailAddress,
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (email) => emailValidator(email),
              ),
              PasswordTextFormField(controller: _passwordController),
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
                            firstName: _firstNameController.text,
                            lastName: _firstNameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      }
                    },
                    isLoading: isLoading,
                  );
                },
              ),
              const SizedBox(height: Sizes.s8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.current.alreadyHaveAnAccount,
                    style: _textTheme.subtitle1,
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
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

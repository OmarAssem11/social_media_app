import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_app/core/domain/entities/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;

  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.success() = AuthSuccess;
  const factory AuthState.error() = AuthError;

  const factory AuthState.loggedIn() = IsLoggedIn;
  const factory AuthState.notLoggedIn() = NotLoggedIn;

  const factory AuthState.currentUser(final User user) = CurrentUser;
}

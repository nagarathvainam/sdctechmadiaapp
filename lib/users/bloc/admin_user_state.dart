import 'package:sdctechmedia/users/models/admin_user.dart';

abstract class AdminUserState {}

class AdminUserInitial extends AdminUserState {}

class AdminUserLoading extends AdminUserState {}

class AdminUserLoaded extends AdminUserState {
  final List<AdminUser> users;
  AdminUserLoaded(this.users);
}

class AdminUserError extends AdminUserState {
  final String message;
  AdminUserError(this.message);
}
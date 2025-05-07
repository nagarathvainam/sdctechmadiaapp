import 'package:sdctechmedia/users/models/admin_user.dart';

abstract class AdminUserEvent {}

class LoadUsers extends AdminUserEvent {}

class DeleteUser extends AdminUserEvent {
  final String id;
  DeleteUser(this.id);
}

class UpdateUser extends AdminUserEvent {
  final AdminUser user;
  UpdateUser(this.user);
}

class AddUser extends AdminUserEvent {
  final AdminUser user;
  AddUser(this.user);
}
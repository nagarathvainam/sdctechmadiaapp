import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/admin_user.dart';
import 'admin_user_event.dart';
import 'admin_user_state.dart';
import '../services/admin_user_api.dart';

class AdminUserBloc extends Bloc<AdminUserEvent, AdminUserState> {
  final AdminUserApi api;

  AdminUserBloc(this.api) : super(AdminUserInitial()) {
    on<LoadUsers>((event, emit) async {
      emit(AdminUserLoading());
      try {
        final users = await api.fetchAllUsers();
        emit(AdminUserLoaded(users));
      } catch (err) {
        print("Error:$err");
        emit(AdminUserError("Failed to load users"));
      }
    });

    on<DeleteUser>((event, emit) async {
      await api.deleteUser(event.id);
      add(LoadUsers());
    });

    on<UpdateUser>((event, emit) async {
      await api.updateUser(event.user);
      add(LoadUsers());
    });

    on<AddUser>((event, emit) async {
      await api.createUser(event.user);
      add(LoadUsers());
    });
  }
}
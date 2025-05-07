import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdctechmedia/pref_utils.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../repositories/auth_repository.dart';
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await authRepository.login(event.username, event.password);
        if (result['responseCode'] == '200') {
          PrefUtils().setuserid(result['data']['id']);
          PrefUtils().setname(result['data']['name']);
          emit(AuthAuthenticated(userData: result['data']));
        } else {
          emit(AuthError(message: result['message'] ?? 'Login failed'));
        }
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
    on<LogoutRequested>((event, emit) {
      emit(AuthInitial());
    });
  }
}

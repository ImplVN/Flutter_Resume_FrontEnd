import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/pages/register/bloc/register_events.dart';
import 'package:resume/pages/register/bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<EmailEvent>((event, emit) => emit(state.copyWith(email: event.email)));
    on<PasswordEvent>(
        (event, emit) => emit(state.copyWith(password: event.password)));
    on<RePasswordEvent>(
        (event, emit) => emit(state.copyWith(rePassword: event.rePassword)));
    on<UserNameEvent>(
        (event, emit) => emit(state.copyWith(userName: event.userName)));
  }
}

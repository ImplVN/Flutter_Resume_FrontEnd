import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/pages/sign_in/bloc/sign_in_events.dart';
import 'package:resume/pages/sign_in/bloc/sign_in_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>((event, emit) => emit(state.copyWith(email: event.email)));
    on<PasswordEvent>(
        (event, emit) => emit(state.copyWith(password: event.password)));
  }
}

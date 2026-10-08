
import 'package:e_commerce/domain/usecases/login_usecase.dart';
import 'package:e_commerce/feature/ui/auth/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<AuthState> {
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}) : super(AuthLoadingState());

}

// view -> view model
// view model -> use case
// use case -> auth repo
// auth repo -> auth remote data source
// remote data source -> api services
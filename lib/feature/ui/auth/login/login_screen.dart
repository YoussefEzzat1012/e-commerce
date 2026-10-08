import 'package:dio/dio.dart';
import 'package:e_commerce/domain/entities/request/login_request.dart';
import 'package:e_commerce/domain/entities/response/auth_response.dart';
import 'package:e_commerce/domain/usecases/login_usecase.dart';
import 'package:e_commerce/feature/ui/auth/auth_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/exceptions/app_exceptions.dart';

class LoginViewModel extends Cubit<AuthState> {
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}):super(AuthLoadingState());

  var  formKey = GlobalKey<FormState>();
  void login(String email, String password) async{
    try{
      if(formKey.currentState?.validate() == true){
        emit(AuthLoadingState());
        LoginRequest loginRequest = LoginRequest(
          email: email,
          password: password,
        );
        var authResponse = await loginUseCase.invoke(loginRequest);
        emit(AuthSuccessState(authResponse: authResponse));

      }
    } on AppException catch(err) {
      emit(AuthErrorState(errorMessage: err.message));
    } on DioException catch(err) {
      var message = (err.error is AppException)? (err.error as AppException).message: "Unexpected Error";
      emit(AuthErrorState(errorMessage: message));
    }



  }

}
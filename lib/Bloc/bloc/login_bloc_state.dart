part of 'login_bloc_bloc.dart';

sealed class LoginBlocState extends Equatable {
  const LoginBlocState();

  @override
  List<Object> get props => [];
}

//create states by creating a class
//with variables you want to tap into from the UI
final class LoginState extends LoginBlocState {
  //example
  final bool isUserLoggedIn;

  const LoginState({required this.isUserLoggedIn});


//we use this method ` List<Object> get props => [example var state,more...,...]; ` in order to make bloc know that the first variable is different from the next
//from my understanding. that is why you pass `isUserLoggedIn` into List<Object> get props => [isUserLoggedIn];

//And for the @override anotator, it is a must, it is used to override the empty `get props` from the main class we are extending.
  @override
    List<Object> get props => [isUserLoggedIn];
}

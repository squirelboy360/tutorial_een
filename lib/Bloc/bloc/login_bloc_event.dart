part of 'login_bloc_bloc.dart';

sealed class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();

  @override
  List<Object> get props => [];
}

class AccountLoggedIn extends LoginBlocEvent {
  //this event we would call from the UI, and because this Event requires a value,
  //we will have to pass in the required value when it is called from the UI or anywhere.

  //we create a variable of type our model
  final UserAccountModel useAccount;

  const AccountLoggedIn({required this.useAccount});
}

//in summary Events call functions/perform operations. They do not interract with the UI but the BLOC uses them via event handelers(something like methods that handel the events) to update the state which you then see on your UI
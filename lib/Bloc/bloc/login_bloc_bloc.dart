import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tutorial_een/model/user_account_model.dart';
import 'package:tutorial_een/services/fake_login_logic.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  //the false value assigned is the inital value;
  LoginBlocBloc() : super(const LoginState(isUserLoggedIn: false)) {
    //create instance of our login service
    FakeLoginLogic logic = FakeLoginLogic();
    //
    //This is an event handeler, Its is where logics are supposed to be opperated
    on<AccountLoggedIn>((event, emit) {
      //in this handeler, you have two parameters you would be utilising
      //`event` is what you tap into to get acces to the Event created earlier
      //emit is a kind of a function that is called to dispatch changes

      //so
      //here goes our logic
      //There is no much logic here,
      // we are just emitting a new state(which is LoginState) directly.
      //
      emit(LoginState(
          isUserLoggedIn: logic.login(
              event.useAccount.password,
              event.useAccount
                  .email))); //We are tapping into the values from the event. //In the UI we would call the event and will finally have to pass
      //the required params to the Event

      //you might be confused here: event.useAccount.password, event.useAccount.email)
      //we are only tapping into the login boolean method from the logic which is an instance of FakeLogic service and we are providing it the values which
      //will eventually be passed to the Event so it returns a boolean value to the isLoggedIn required parameter.
    });

    //   on<Another can be here>((event, emit) {

    // });
  }
}

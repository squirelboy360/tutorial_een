import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tutorial_een/Bloc/bloc/login_bloc_bloc.dart';
import 'package:tutorial_een/model/user_account_model.dart';
import 'package:tutorial_een/widgets/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    //Register our bloc
    //very important

    return BlocProvider(
      create: (context) => LoginBlocBloc(),
      child: const PlatformApp(
        home: FakeLoginScreen(),
      ),
    );
  }
}

class FakeLoginScreen extends StatelessWidget {
  const FakeLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    //
    return BlocBuilder<LoginBlocBloc, LoginBlocState>(
        builder: (context, state) {
      void checkIfLoggedIn() {
        if (state is LoginState && state.isUserLoggedIn) {
          Navigator.pushAndRemoveUntil(
              context,
              platformPageRoute(
                  context: context, builder: (context) => const Tutorial()),
              (route) => false);
          print(state.isUserLoggedIn);
        } else if (state is LoginState && state.isUserLoggedIn == false) {
          print(state.isUserLoggedIn);
          showPlatformDialog(
              context: context,
              builder: (context) {
                return PlatformAlertDialog(
                  title: const Text("Error"),
                  actions: [
                    PlatformTextButton(
                      child: const Text(
                        "Close",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              });
        }
      }

      final screenSize = MediaQuery.sizeOf(context);
      return PlatformScaffold(
        appBar: PlatformAppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: EdgeInsets.all(screenSize.width / 5.2),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PlatformTextField(
                    controller: emailController,
                    material: (context, platform) => MaterialTextFieldData(
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PlatformTextField(
                    controller: passwordController,
                    material: (context, platform) => MaterialTextFieldData(
                        decoration:
                            const InputDecoration(labelText: 'Username'),
                        obscureText: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PlatformElevatedButton(
                    onPressed: () {
                      //If you want to call the fuctions/ events from your bloc, we use:
                      BlocProvider.of<LoginBlocBloc>(context).add(AccountLoggedIn(
                          useAccount: UserAccountModel(
                              email: emailController.text,
                              password: passwordController
                                  .text))); //We only add emits, this is where we can then pass the value to our emit. Because use acount is of type
                      //our model, we need to give it a value of our model and now we can fill in the required params

                      checkIfLoggedIn();
                    },
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

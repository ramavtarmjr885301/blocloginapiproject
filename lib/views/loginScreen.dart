import 'package:blocloginapiproject/BLoC/auth_Bloc/auth_event.dart';
import 'package:blocloginapiproject/BLoC/auth_Bloc/auth_state.dart';
import 'package:blocloginapiproject/BLoC/auth_Bloc/auth_bloc.dart';
import 'package:blocloginapiproject/custom_aap_bar.dart';
import 'package:blocloginapiproject/utils/states.dart';
import 'package:blocloginapiproject/views/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  openMyPage() {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Login Screen',
        ),
        body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: const Color.fromARGB(255, 176, 200, 240),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .15,
                  ),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 32),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Form(
                      key: loginformKey,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Username"),
                            TextFormField(
                              controller: usernameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your username';
                                }
            
                                return null;
                              },
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                  ),
                                  hintText: "Enter Your username",
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const Text("Password"),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your password";
                                }
                                return null;
                              },
                              controller: passwordController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                  ),
                                  hintText: "Enter Your Password",
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<AuthBloc>().add(LoginReqEvent(
                                      userName: usernameController.text,
                                      password: passwordController.text,
                                      context: context,
                                      ));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amber),
                                child: BlocBuilder<AuthBloc, Authstate>(
                                  buildWhen: (previous, current) =>
                                      previous.loginStatus != current.loginStatus,
                                  builder: (context, state) {
                                    switch (state.loginStatus) {
                                      case ApiStatus.loadingState:
                                        return const Center(
                                            child: CircularProgressIndicator());
            
                                      default:
                                        return const Text(
                                          "Login",
                                          style: TextStyle(fontSize: 25),
                                        );
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Don't have an accound  ",
                          style:
                              const TextStyle(color: Colors.black, fontSize: 20),
                          children: [
                        TextSpan(
                            text: "Sign Up",
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()..onTap = () {})
                      ]))
                ],
              ),
            )));
  }
}

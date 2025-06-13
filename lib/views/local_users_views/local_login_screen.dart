import 'package:bloc_practice/BLoC/local_auth_bloc/local_auth_bloc.dart';
import 'package:bloc_practice/BLoC/local_auth_bloc/local_auth_event.dart';

import '../../barrel.dart';

class LocalLoginScreen extends StatefulWidget {
  const LocalLoginScreen({super.key});

  @override
  State<LocalLoginScreen> createState() => _LocalLoginScreenState();
}

class _LocalLoginScreenState extends State<LocalLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


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
                "Local Database Screen!",
                style: TextStyle(fontSize: 32),
              ),
              const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(
                height: 100,
              ),
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Email"),
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }

                            return null;
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_outlined,
                              ),
                              hintText: "Enter Your Email",
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text("Password"),
                        TextFormField(
                          validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                          controller: _passwordController,
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
                              if (_formKey.currentState!.validate()) {
                                context.read<LocalAuthBloc>().add(LocalLoginRequested(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      context: context,
                                     
                                    ));
                              }
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
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      children: [
                    TextSpan(
                        text: "Sign Up",
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.pushNamed(context, RoutesNames.localSignUpScreen);
                        })
                  ]))
            ],
          ),
        )));
  }
}

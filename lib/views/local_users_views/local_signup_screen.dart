import 'package:bloc_practice/BLoC/local_auth_bloc/local_auth_bloc.dart';
import 'package:bloc_practice/BLoC/local_auth_bloc/local_auth_event.dart';
import 'package:bloc_practice/BLoC/local_auth_bloc/local_auth_state.dart';
import 'package:flutter/material.dart';
import '../../barrel.dart';

class LocalSignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
   final mobileCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signup")),
      body: BlocConsumer<LocalAuthBloc, LocalAuthState>(
        listener: (context, state) {
          if (!state.isLoading && state.error == null) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  
                  children: [
                    if (state.error != null)
                      Text(
                        state.error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 100),
                    TextFormField(
                      controller: nameCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                     TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      
                      controller: mobileCtrl,
                      decoration: const InputDecoration(
                        prefix: Text("+91 "),
                        
                        labelText: 'Mobile Number',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Mobile Number';
                        }
                        if(value.length!=10){
                          return "Enter a valid mobile number";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: emailCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: passCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                     
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LocalAuthBloc>().add(
                                LocalSignUpRequested(
                                  nameCtrl.text,
                                  emailCtrl.text,
                                  passCtrl.text,
                                  mobileCtrl.text
                                ),
                              );
                        }
                      },
                      child: state.isLoading
                          ? const CircularProgressIndicator()
                          : const Text("Register"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
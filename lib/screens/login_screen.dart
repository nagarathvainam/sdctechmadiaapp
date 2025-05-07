import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdctechmedia/dashboard.dart';
import '../blocs/auth/auth_bloc.dart';
import '../blocs/auth/auth_event.dart';
import '../blocs/auth/auth_state.dart';
//import 'user_list_screen.dart'; // Navigate here on successful login

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthAuthenticated) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => dashboard(),
                  ),
                );
              } else if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Center(child: Image.asset("assets/logo.png")),
                    //Icon(Icons.lock, size: 50, color: Colors.orange),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _emailController,
                    //decoration: const InputDecoration(labelText: "Username"),

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Color(0xffBD1A8D)),
                      hintText: "User ID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),

                    validator: (value) =>
                    value!.isEmpty ? "Enter your username" : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(

                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Color(0xffBD1A8D)),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) =>
                    value!.isEmpty ? "Enter your password" : null,
                  ),
                  const SizedBox(height: 20),
                  state is AuthLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffBD1A8D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                          LoginRequested(
                            username: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      }
                    },
                    child: const Text("Login",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,

              letterSpacing: 1,
              ),),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'widget/input_field.dart';
import 'registration_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
        backgroundColor: const Color.fromARGB(255, 105, 8, 58),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 400,

            child: Card(
              color: const Color.fromARGB(255, 223, 149, 199),

              child: Padding(
                padding: EdgeInsets.all(20),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 25),

                    Form(
                      key: _formKey,

                      child: Column(
                        children: [
                          InputField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: "Enter Email",
                            labeltext: "Email",
                            prefixIcon: Icon(Icons.email),

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              } else if (!RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                              ).hasMatch(value)) {
                                return "Enter a valid email";
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 20),

                          InputField(
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            hintText: "Enter Password",
                            labeltext: "Password",
                            prefixIcon: Icon(Icons.lock),
                            obscureText: true,

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              } else if (!RegExp(
                                r'^(?=.*[A-Za-z])(?=.*\d).{8,}$',
                              ).hasMatch(value)) {
                                return "Minimum 8 characters, letter and number";
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 25),

                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Login Successful")),
                                );
                              }
                            },
                            child: Text("Login"),
                          ),

                          SizedBox(height: 15),

                          Text("Don't have an account?"),

                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationPage(),
                                ),
                              );
                            },
                            child: Text("Register Now"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

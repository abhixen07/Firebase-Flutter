import 'package:firebase_learning/ui/auth/login_screen.dart';
import 'package:firebase_learning/ui/utils/utils.dart';
import 'package:firebase_learning/widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ///for checking validation used form
  final _formField = GlobalKey<FormState>();
  bool loading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
  }

  void signUp() {
    setState(() {
      loading = true;
    });

    ///create user with auth
    ///registration of user process with firebase
    _auth
        .createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).

    ///handle exception with it  and success message
    then((value) {
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      ///showing exception on UI
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text('Sign Up',
            style: GoogleFonts.montserrat(
                color: Colors.white,fontWeight: FontWeight.w700
            )),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formField,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    helperText: 'enter email e.g @john@gmail.com'),

                ///for validation
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  decoration: const InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.password_outlined),
                      helperText: 'letter'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'password';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              RoundButton(
                title: 'Sign Up ',
                loading: loading,
                onPress: () {
                  if (_formField.currentState!.validate()) {
                    signUp();
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
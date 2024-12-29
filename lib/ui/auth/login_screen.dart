import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learning/ui/auth/sign_up_screen.dart';
import 'package:firebase_learning/ui/posts/post_screen.dart';
import 'package:firebase_learning/ui/utils/utils.dart';
import 'package:firebase_learning/widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ///for checking validation used form
  final _formField = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
  }

  void login() {
    setState(() {
      loading = true;
    });

    _auth
        .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text.toString())
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const PostScreen()));
      setState(() {
        loading = false;
      });

    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    ///for android bottom button like exit from app etc
    return WillPopScope(
      ///for exit app

      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Login',
              style: GoogleFonts.montserrat(
                  color: Colors.white, fontWeight: FontWeight.w700)),
          backgroundColor: Colors.black,
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
                  title: 'Login',
                  loading: loading,
                  onPress: () {
                    if (_formField.currentState!.validate()) {
                      login();
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dont have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text(
                        'Sign Up',
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
      ),
    );
  }
}

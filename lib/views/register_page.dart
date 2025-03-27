import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quotes_app/constants.dart';
import 'package:quotes_app/helper/show_snackBar.dart';
import 'package:quotes_app/views/quotes_view.dart';
import 'package:quotes_app/widgets/custom_button.dart';
import 'package:quotes_app/widgets/custom_text_form_field_email_password.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static String id = 'RegisterPage';
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // static makes the id belong to the class not the object
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(
        color: Colors.black,
      ),
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key:
                formKey, // Is a key for the Form widget enable me to access whatever inside the Form widgwt
            child: ListView(
              children: [
                const SizedBox(
                  height: 200,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    'Hello,',
                    style: TextStyle(fontSize: 20, fontFamily: 'Lato'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    'Welcome to Quote!',
                    style: TextStyle(fontSize: 24, fontFamily: 'Lato'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormFieldEmailPassword(
                  labelText: 'Enter your email',
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormFieldEmailPassword(
                  labelText: 'Enter your password',
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, QuotesView.id);
                  },
                  child: CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await registerUser();
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, QuotesView.id);
                        } on FirebaseAuthException catch (e) {
                          // ScaffoldMessenger => used to display a message that express the registeration result fail or success
                          if (e.code == 'weak-password') {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context, 'weak password');
                          } else if (e.code == 'email-already-in-use') {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context, 'email-already-in-use');
                          }
                        } catch (e) {
                          log(e.toString());
                          // ignore: use_build_context_synchronously
                          showSnackBar(context, 'there was an error');
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                    text: 'Register',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account ? ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
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

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}

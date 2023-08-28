import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignInPageViewMobile extends StatelessWidget {
  const SignInPageViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const Spacer(flex: 2),
            const Image(
              image: AssetImage('assets/images/icon.png'),
              width: 256,
            ),
            const Spacer(flex: 2),
            SignInButton(
              Buttons.google,
              onPressed: () async {
                try {
                  final TextEditingController inviteCodeTextController =
                      TextEditingController();
                  final bool? isCorrectCode = await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Invite Code'),
                        content: TextField(
                          controller: inviteCodeTextController,
                          decoration: const InputDecoration(hintText: 'code'),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Submit'),
                            onPressed: () {
                              Navigator.pop(
                                context,
                                inviteCodeTextController.text.trim() ==
                                    '23HOK24',
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                  if (isCorrectCode != true) {
                    if (context.mounted) {
                      const SnackBar snackBar = SnackBar(
                        content: Text('Please Check Invite Code'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    return;
                  }

                  final GoogleSignInAccount? googleUser =
                      await GoogleSignIn().signIn();
                  final GoogleSignInAuthentication? googleAuth =
                      await googleUser?.authentication;
                  final OAuthCredential credential =
                      GoogleAuthProvider.credential(
                    accessToken: googleAuth?.accessToken,
                    idToken: googleAuth?.idToken,
                  );
                  await FirebaseAuth.instance.signInWithCredential(credential);
                  if (FirebaseAuth.instance.currentUser != null) {
                    if (context.mounted) {
                      context.go('/');
                    }
                  }
                } on Exception catch (e) {
                  if (context.mounted) {
                    final SnackBar snackBar = SnackBar(
                      content: Text('Please Sign in with Google Account : $e'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    context.pop();
                  }
                }
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';

// options
import 'firebase_options.dart';

// pages
import 'home_page.dart';
import 'login_page.dart';
import 'my_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  print(googleUser);
  print(googleUser?.authentication);

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  print(googleAuth?.accessToken);
  print(googleAuth?.idToken);

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  final userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
  print(credential);

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  print(userCredential.user);
  users.add({
    'full_name': userCredential.user?.displayName,
    'email': userCredential.user?.email
  });
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track My Vol',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: buildPageView(),
    );
  }

  Widget buildPageView() {
    return PageView(
      children: [
        HomePage(),
        const LoginPage(),
        const MyPage(),
      ],
    );
  }
}

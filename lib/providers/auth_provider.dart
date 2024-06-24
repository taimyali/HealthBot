import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:healthbot/auth/auth.dart';
import 'package:healthbot/auth/login_or_register_page.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/utils/utils.dart';
import 'package:go_router/go_router.dart';

final authProvider =
    ChangeNotifierProvider<AuthProvider>((ref) => AuthProvider());

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  void signIn(context, emailController, passwordController) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: SpinKitFadingCube(
              color: themecolor,
              size: 20.0,
            ),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController, password: passwordController);
      Navigator.pop(context);
      FocusScope.of(context).unfocus();

      // GoRouter.of(context).pop();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      // GoRouter.of(context).pop();
      if (e.code == 'weak-password') {
        print('Password is too weak.');
        Utils.OneLineCustomSnackBar(context,
            text: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Utils.OneLineCustomSnackBar(context,
            text: 'Email already exist.', color: Colors.red);
      } else if (e.code == 'user-not-found') {
        Utils.OneLineCustomSnackBar(context,
            text: 'User not found.', color: Colors.red);
      } else if (e.code == 'user-not-found') {
        Utils.OneLineCustomSnackBar(context,
            text: 'User not found.', color: Colors.red);
      } else if (e.code == 'invalid-email') {
        Utils.OneLineCustomSnackBar(context,
            text: 'Invalid email', color: Colors.red);
      } else if (e.code == 'channel-error') {
        Utils.OneLineCustomSnackBar(context,
            text: 'Invalid credentials', color: Colors.red);
      } else {
        Utils.OneLineCustomSnackBar(context,
            text: 'Invalid credentials', color: Colors.red);
      }
    }
  }

  //Sign up
  void signUp(
    context,
    emailController,
    usernameController,
    passwordController,
    confirmPasswordController,
    usernameFocusNode,
    emailFocusNode,
    passwordFocusNode,
    confirmPasswordFocusNode,
  ) async {
    // if text field is not empty

    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: SpinKitFadingCube(
              color: themecolor,
              size: 20.0,
            ),
          );
        });

    // check if password matches
    if (passwordController != confirmPasswordController) {
      Navigator.pop(context);
      // GoRouter.of(context).pop();
      FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
      Utils.OneLineCustomSnackBar(context,
          text: 'Password do not Match', color: Colors.red, icon: Icons.error);

      return;
    }

    // check if username is not empty
    if (usernameController.isEmpty) {
      Navigator.pop(context);
      // GoRouter.of(context).pop();
      FocusScope.of(context).requestFocus(usernameFocusNode);
      Utils.OneLineCustomSnackBar(context,
          text: 'Please enter your username',
          color: Colors.red,
          icon: Icons.error);

      return;
    }

    // username should be less than 15 characters
    if (usernameController.length > 15) {
      Navigator.pop(context);
      // GoRouter.of(context).pop();
      FocusScope.of(context).requestFocus(usernameFocusNode);
      Utils.OneLineCustomSnackBar(context,
          text: 'Username should be less than 15 letters',
          color: Colors.red,
          icon: Icons.error);
      return;
    }

    // Check if username already exists
    QuerySnapshot usernameSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('username', isEqualTo: usernameController)
        .get();

    if (usernameSnapshot.docs.isNotEmpty) {
      Navigator.pop(context);

      Utils.OneLineCustomSnackBar(context,
          text: 'Username already exists',
          color: Colors.red,
          icon: Icons.error);
      return;
    }

    // try creating the user
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController, password: passwordController);

      // Send verification email
      Navigator.of(context).pop();

      // after user created , create a new document for the user in firestore
      log(usernameController);
      log(emailController);

      try {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(userCredential.user!.email)
            .set({
          'username': usernameController,
        });
      } catch (e) {
        log(e.toString());
      }
      //pop loading circle
      if (context.mounted) {
        Navigator.pop(context);
        // GoRouter.of(context).pop();
      }
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      // GoRouter.of(context).pop();
      Navigator.pop(context);

      Utils.OneLineCustomSnackBar(context,
          text: e.code, color: Colors.red, icon: Icons.error);
    }
  }

  // Sign out
  Future<void> signOut(context) async {
    // show loading circle

    // show confirmation dialog
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text(
                'Are you sure you want to log out?',
              ),

              // actions
              actions: [
                // cancel
                TextButton(
                    child:
                        const Text('NO', style: TextStyle(color: themecolor)),
                    onPressed: () => Navigator.of(context).pop()),

                // save
                TextButton(
                    child:
                        const Text('YES', style: TextStyle(color: themecolor)),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                              child: SpinKitFadingCube(
                                color: themecolor,
                                size: 20.0,
                              ),
                            );
                          });
                      try {
                        log('logging out...');

                        await FirebaseAuth.instance.signOut();
                        log('hhhhhh');
                        Navigator.pop(context);
                        Utils.OneLineCustomSnackBar(context,
                            text: 'Logged out successfully',
                            color: themecolor,
                            icon: Icons.done);

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthPage()),
                            (route) => false);
                        // Reset the current username

                        notifyListeners();
                      } catch (e) {
                        // GoRouter.of(context).pop();
                        Navigator.pop(context);

                        Utils.OneLineCustomSnackBar(context,
                            text: e.toString(),
                            color: Colors.red,
                            icon: Icons.error);
                      }
                    }),
              ]);
        });
  }

  // Fetch Current Username
  fetchUserName() async {
    final userData = await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .get();

    final username = userData.data()!['username'];

    return username;
  }

  Future<void> editField(String field, BuildContext context) async {
    final Users = FirebaseFirestore.instance.collection('Users');
    String newValue = '';
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                'Edit $field',
              ),
              content: TextField(
                  cursorColor: Colors.grey[500],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter new $field',
                    hintStyle: TextStyle(color: Colors.grey[300]),
                  ),
                  autofocus: true,
                  onChanged: (value) {
                    newValue = value;
                  }),
              // actions
              actions: [
                // cancel
                TextButton(
                    child: const Text('Cancel',
                        style: TextStyle(color: themecolor)),
                    onPressed: () => Navigator.of(context).pop()),

                // save
                TextButton(
                    child:
                        const Text('Save', style: TextStyle(color: themecolor)),
                    onPressed: () {
                      Navigator.of(context).pop(newValue);
                    }),
              ]);
        });

    // updating in the firestore

    if (newValue != '') {
      // show the circular progress
      showDialog(
          context: context,
          builder: (context) => const Center(
                child: SpinKitFadingCube(
                  color: themecolor,
                  size: 20.0,
                ),
              ));
      //updating in the userposts collection database also

      // Check if username already exists
      if (field == 'username') {
        QuerySnapshot usernameSnapshot =
            await Users.where('username', isEqualTo: newValue).get();

        if (usernameSnapshot.docs.isNotEmpty) {
          // Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red[600],
            dismissDirection: DismissDirection.horizontal,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            content: const Text(
              'Username already exists. Please choose a different one.',
              style: TextStyle(color: Colors.white),
            ),
          ));
          if (context.mounted) Navigator.pop(context);
          return;
        }

        // pop the loader
        if (context.mounted) Navigator.pop(context);

        // update in the Users collection when there is soemthing on the textfield
        await Users.doc(currentUser!.email).update({field: newValue});
        Utils.OneLineCustomSnackBar(context,
            text: 'Username updated successfully',
            color: Colors.green,
            icon: Icons.check);

        notifyListeners();
      }
    }
  }
}

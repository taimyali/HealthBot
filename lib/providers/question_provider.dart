import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthbot/api/api.dart';
import 'package:healthbot/models/question_model.dart';
import 'package:healthbot/pages/analyzing_screen.dart';
import 'package:healthbot/pages/result_page.dart';
import 'package:healthbot/utils/utils.dart';

final questionProvider =
    ChangeNotifierProvider<QuestionProvider>((ref) => QuestionProvider());

class QuestionProvider extends ChangeNotifier {
  int currentQuestionIndex = 0;
  List<int> responses = List.filled(questions.length, 0);

  void getPrediction(BuildContext context) async {
    log('predciting..');
    log(responses.toString());
    final apiService = ApiService();

    try {
      log('Predicting started');

      showDialog(
          context: context,
          builder: (context) {
            return const AnalyzingScreen(predictionResult: {});
          });

      final result = await apiService.getPrediction(responses);

      await saveResult(result['prediction']);

      if (context.mounted) {
        // context.pop();
        Navigator.pop(context);
      }

      // context.goNamed('result', extra: result['prediction']);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ResultScreen(predictionResult: result['prediction']);
      }));
      log('Predicting completed');
      log('Prediction result: ${result['prediction']}');

      // context.goNamed('analyze', extra: result['prediction']);
    } catch (e) {
      context.pop();
      log('Failed to get prediction: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red[400],
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
        content: const Text(
            'Failed to get prediction ! Check your connection or try again later'),
      ));
    }
  }

  void answerQuestion(bool answer, BuildContext context) {
    responses[currentQuestionIndex] = answer ? 1 : 0;
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
      log(currentQuestionIndex.toString());
      notifyListeners();
    } else {
      getPrediction(context);
      currentQuestionIndex = 0;
    }
  }

  void goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      currentQuestionIndex--;
      notifyListeners();
    }
  }

  Future<void> saveResult(Map<String, dynamic> result) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.email)
          .collection('Results')
          .add({
        'result': result,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }
}

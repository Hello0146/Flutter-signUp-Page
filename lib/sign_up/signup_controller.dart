import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

// Firebase 초기화
void initializeFirebase() async {
  await Firebase.initializeApp();
}

// 회원 가입 함수
void signUp() async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    // 회원 가입 성공
    User? user = userCredential.user;
    if (user != null) {
      // 회원 가입 성공한 후에 할 작업을 추가하세요.
      // 예를 들어, 회원 정보를 저장하거나 다른 화면으로 이동하는 등의 동작을 수행할 수 있습니다.
      print('회원 가입 성공: ${user.uid}');
    }
  } catch (e) {
    // 회원 가입 실패
    print('회원 가입 실패: $e');
  }
}

// Sign Up 버튼 클릭 시 호출되는 함수
void handleSignUpButton() {
  initializeFirebase(); // Firebase 초기화

  // 회원 가입 처리
  signUp();
}

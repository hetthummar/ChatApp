import 'package:chatapp/ui/screens/base/ViewState.dart';
import 'package:chatapp/ui/screens/base/base_view.dart';
import 'package:chatapp/ui/screens/main_screen/registration/googlelogin/GoogleLoginViewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class GoogleLoginView extends StatelessWidget {
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    return BaseView<GoogleLoginViewModel>(
      onModelReady: (model) {
        print("Google login");
      },
      builder: (BuildContext context, model, Widget? child) {
        screenWidth = MediaQuery.of(context).size.width;
        screenHeight = MediaQuery.of(context).size.height;

        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.08,
                        ),
                        Text(
                          "Welcome!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Sign in or sign up with Google",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              letterSpacing: 0.3),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              EasyLoading.show(status: 'Please wait...');
                              model.signInWithGoogle();
                            },
                            child: Container(
                                width: 70,
                                height: 70,
                                child:
                                    Image.asset('assets/images/google.png'))),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Connect with Google",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 17,
                              letterSpacing: 0.3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitjarus_test/base/base.dart';
import 'package:pitjarus_test/base/widgets/third_party/button.dart';
import 'package:pitjarus_test/modules/list_store/view/list_store_page.dart';
import 'package:pitjarus_test/modules/login/controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _textEditingControllerUsername =
      TextEditingController();
  final TextEditingController _textEditingControllerPassword =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final LoginController _loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Image.asset("assets/images/top_bg_login.png")),
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/images/bottom_bg_login.png")),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BaseTextField(
                    hintText: "Username",
                    controller: _textEditingControllerUsername,
                    textInputAction: TextInputAction.next,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: BaseColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BaseTextField.password(
                    usingPasswordValidator: false,
                    minLength: 0,
                    hintText: "Password",
                    controller: _textEditingControllerPassword,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: BaseColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 50,
                    child: PrimaryButton(
                      widthFactor: 1,
                      text: "Login",
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          final res = await _loginController.login(
                              username: _textEditingControllerUsername.text,
                              password: _textEditingControllerPassword.text);
                          if (res) {
                            Get.offAll(() => const ListStorePage());
                          }
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

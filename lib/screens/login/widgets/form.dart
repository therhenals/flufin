import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

import 'package:flufin/providers/providers.dart';
import 'package:flufin/services/services.dart';
import 'package:flufin/ui/input_decorations.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.globalInputDecoration(
              context: context,
              hintText: 'thr',
              labelText: 'Username',
              prefixIcon: Icons.person_rounded,
            ),
            onChanged: (value) => loginForm.username = value,
            validator: (value) {
              const String message = 'Please enter username';
              if (!isAlphanumeric(value ?? '')) {
                return message;
              } else if (value!.isEmpty) {
                return message;
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.globalInputDecoration(
              context: context,
              hintText: '******',
              labelText: 'Password',
              prefixIcon: Icons.lock_rounded,
            ),
            onChanged: (value) => loginForm.password = value,
            /* validator: (value) {
              const String message = 'Please enter password';
              if (!isAlphanumeric(value ?? '')) {
                return message;
              } else if (value!.isEmpty) {
                return message;
              } else {
                return null;
              }
            }, */
          ),
          const SizedBox(height: 30),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 15,
              ),
              child: Text(
                loginForm.isLoading ? 'Wait...' : 'Login',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    if (!loginForm.isValidForm()) return;
                    loginForm.isLoading = true;

                    final authService =
                        Provider.of<AuthService>(context, listen: false);
                    try {
                      await authService.login(
                          loginForm.username, loginForm.password);
                      Navigator.pushReplacementNamed(context, 'splash');
                    } catch (e) {
                      MessengerService.showSnakbar('Connection error');
                      loginForm.isLoading = false;
                    }
                  },
          )
        ],
      ),
    );
  }
}

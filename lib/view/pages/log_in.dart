import 'package:dealsdrayinterview/controller/auth/event/auth_event.dart';
import 'package:dealsdrayinterview/controller/auth/state/auth_state.dart';
import 'package:dealsdrayinterview/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final isValidated = ValueNotifier(false);
  final regExpresstion =
      RegExp(r'^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[6789]\d{9}$');
  final phoneNumberControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: BlocConsumer<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Glad to See you!',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Please provide your phone number',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 40),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: phoneNumberControler,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value?.isEmpty ?? true
                            ? "Please Enter Phone Number"
                            : regExpresstion.hasMatch(value ?? '')
                            ? null
                            : "Mobile Number Format is Not Valid",
                        onChanged: (value) {
                          isValidated.value =
                              regExpresstion.hasMatch(value ?? '');
                          isValidated.notifyListeners();
                        },
                        decoration: const InputDecoration(hintText: "Phone"),
                      ),
                    ),
                    SizedBox(
                      // width: 350,
                      height: 54,
                      child: ValueListenableBuilder<bool>(
                          valueListenable: isValidated,
                          builder: (context, value, _) {
                            return MaterialButton(
                              onPressed: !(value)
                                  ? null
                                  : () {
                                BlocProvider.of<AuthBloc>(context).add(
                                  LoginEvent(phoneNumberControler.text),
                                );
                              },
                              color: Colors.red,
                              disabledColor: Colors.red.shade200,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                                side: BorderSide(color: Colors.grey[700]!),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Continue with Phone',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              );
            },
            listener: (BuildContext context, AuthState state) {
              if (state is AuthSuccess) {
                Navigator.pushReplacementNamed(
                  context,
                  "/otp",
                );
              }

            },
          ),
        ),
      ),
    );
  }
}

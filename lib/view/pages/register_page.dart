import 'package:dealsdrayinterview/controller/auth/state/auth_state.dart';
import 'package:dealsdrayinterview/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final regExpresstion = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  final passWordregExpresstion = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
      if (state is AuthLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lets begin!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Please Enter your credentials to proceed',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 40),

                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                      value?.isEmpty ?? true
                          ? "Please Enter Email"
                          : regExpresstion.hasMatch(value ?? '')
                          ? null
                          : "Mobile Number Format is Not Valid",
                      // onChanged: (value) {
                      //   isValidated.value = regExpresstion.hasMatch(value??'');
                      //   isValidated.notifyListeners();
                      // },
                      decoration: const InputDecoration(
                          hintText: "Your Email"),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                      value?.isEmpty ?? true
                          ? "Please Enter Password"
                          : passWordregExpresstion.hasMatch(value ?? '')
                          ? null
                          : "Password Not Valid",
                      // onChanged: (value) {
                      //   isValidated.value = regExpresstion.hasMatch(value??'');
                      //   isValidated.notifyListeners();
                      // },
                      // maxLength: 8,
                      decoration: const InputDecoration(
                          hintText: "Create Password"),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (value)=>value?.isEmpty??true?"Please Enter Phone Number":regExpresstion.hasMatch(value??'')?null:"Mobile Number Format is Not Valid",
                      // onChanged: (value) {
                      //   isValidated.value = regExpresstion.hasMatch(value??'');
                      //   isValidated.notifyListeners();
                      // },
                      decoration: const InputDecoration(
                          hintText: "Referral Code (Optional)"),),
                  ),
                  SizedBox(
                    // width: 350,
                    height: 54,
                    child: MaterialButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          Navigator.pushReplacementNamed(
                            context,
                            "/home",
                          );
                        }
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        }
      ),
    );
  }
}

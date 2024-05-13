import 'package:dealsdrayinterview/controller/auth/state/auth_state.dart';
import 'package:dealsdrayinterview/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCFCFC),
        automaticallyImplyLeading: false,
        title: const Text(
          'Back',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Color(0xFF20117A),
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OTP Verification',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      'We have sent an unique OTP to you mobile:',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.grey),
                    ),
                    Text(
                      '70029-58902',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.grey),
                    ),
                  ],
                ),
                PinCodeTextField(
                  autoDisposeControllers: false,
                  appContext: context,
                  length: 4,
                  // textStyle: FlutterFlowTheme.of(context).bodyLarge,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  enableActiveFill: false,
                  autoFocus: true,
                  enablePinAutofill: false,
                  errorTextSpace: 16,
                  showCursor: true,

                  obscureText: false,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    fieldHeight: 44,
                    fieldWidth: 44,
                    borderWidth: 2,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    inactiveColor: const Color(0xFFD3D0D0),
                    inactiveFillColor: const Color(0xFFD3D0D0),
                  ),

                  onCompleted: (value) {
                    Navigator.pushReplacementNamed(
                      context,
                      "/register",
                    );
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1:57',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.grey),
                      ),
                      Text(
                        ' Send again',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

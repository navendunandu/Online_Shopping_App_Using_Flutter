// import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screen/dashboard.dart';
import 'package:flutter_firebase/screen/registrationscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _useremailController = TextEditingController();
  final _userpassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void>_login(BuildContext context) async {
    if(_formKey.currentState!.validate()){
      try{
        final FirebaseAuth auth = FirebaseAuth.instance;
        final UserCredential userCredential = 
        await auth.signInWithEmailAndPassword(email: _useremailController.text.trim(), password: _userpassController.text.trim());

        if(userCredential.user!=null){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()),
          );
        }
      }
      catch (e){
        Fluttertoast.showToast(msg: 'Login Failed: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Center(
              child: Text('Sign In',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
              const SizedBox( 
                height: 30,
              ),
              TextFormField(
                controller: _useremailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Email";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _userpassController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Password";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login(context);
                  } else {
                    print('Validation False');
                  }
                },
                icon: const Icon(Icons.login),
                label: const Text('Login'),
                style: ButtonStyle(
                  // Customize the button's background color
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),

                  // Customize the button's elevation (shadow)
                  elevation: MaterialStateProperty.all<double>(5.0),

                  // Customize the icon's color
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),

                  // Customize the icon's size
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ScreenReg(),));
                },
                icon: const Icon(Icons.create),
                label: const Text('Create Account'),
                style: ButtonStyle(
                  // Customize the button's background color
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),

                  // Customize the button's elevation (shadow)
                  elevation: MaterialStateProperty.all<double>(5.0),

                  // Customize the icon's color
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),

                  // Customize the icon's size
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  ),
                ),
              )
            ],
          ),
        )),
      )),
    );
  }
}

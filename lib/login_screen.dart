import 'package:flutter/material.dart';
import 'package:gdsclogintask/register_screen.dart';
import 'package:gdsclogintask/text_form_field_custom.dart';

import 'custom_clip_path.dart';
import 'items.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    GlobalKey<FormState>key=GlobalKey();
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: key,
          child: InkWell(
            onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  // عملت container عشان اعمل اللون purple حوالين التيكست
                  child: Container(
                    height: height * 0.5,
                    // حددت لون الكونتينر و اديته width
                    color: Colors.purple,
                    width: double.infinity,
                    //عملت wrap للتيكست ب center عشان تبقا ف نص الكونتينر
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InputText(hintText: 'Enter your Email', labelText: 'Email', prefixIcon: Icons.email, padding: 8, keyboardType: TextInputType.emailAddress, validator: (value){
                  if (value!.isEmpty) {
                    return 'Please enter valid email';
                  }
                  else if(emailController.text.contains('@')==false||emailController.text.contains('.')){
                    return 'Please enter valid email';
                  }
                }, color: Colors.purple, controller: emailController,
                    border: InputBorder.none),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffF4F4F4),
                              blurRadius: 2,
                              offset: Offset(10, 10))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordController,
                        validator: (String? value) {
                          RegExp reg = RegExp(
                              r'''(?=(.*[0-9]))(?=.*[\!@#$%^&*()\\[\]{}\-_+=~`|:;"'<>,./?])(?=.*[a-z])(?=(.*[A-Z]))(?=(.*)).{8,}''');
                          if (!reg.hasMatch(value!)) {
                            return 'Enter Validate Password';
                          }
                          return null;
                        },
                        obscureText: isPassword,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.purple,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPassword = !isPassword;
                                });
                              },
                              icon: isPassword
                                  ? const Icon(
                                Icons.visibility_off,
                                color: Colors.purple,
                              )
                                  : const Icon(
                                Icons.visibility,
                                color: Colors.purple,
                              )),
                          hintText: 'Enter your password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 157,
                        height: 57,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.purple),
                        child: MaterialButton(
                            minWidth: 15,
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                print('Enter valid info');
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Items()));

                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 157,
                        height: 57,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black12),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0xffF4F4F4),
                                  blurRadius: 2,
                                  offset: Offset(10, 10))
                            ]),
                        child: MaterialButton(
                            minWidth: 15,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RegisterScreen()));
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 20,
                              ),
                            )),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

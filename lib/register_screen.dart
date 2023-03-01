import 'package:flutter/material.dart';
import 'package:gdsclogintask/items.dart';
import 'package:gdsclogintask/login_screen.dart';
import 'package:gdsclogintask/text_form_field_custom.dart';

import 'custom_clip_path.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPassword = true;
  bool isConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
    GlobalKey<FormState> key = GlobalKey();
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        // عملت wrap لل column ب Form عشان يبقا معايا تحكم الفورم كلها
        child: Form(
          key: key,
          child: Column(
            children: [
              // عملت wrap للcontainer ب Clip path عشان اعمل الكيرف
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
                      'Register',
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
              //User name field
              InputText(hintText: 'Enter Full Name', labelText: 'User Name', prefixIcon: Icons.person, padding: 8, keyboardType: TextInputType.text, validator: (value){
                if (value!.isEmpty) {
                  return 'Please enter valid name';
                }
              }, color: Colors.purple, controller: userNameController,border: InputBorder.none),
              // Phone Field
              InputText(hintText: 'Phone Number', labelText: 'Phone Number', prefixIcon: Icons.phone, padding: 8, keyboardType: TextInputType.phone, validator: (value){
                if (value!.isEmpty) {
                  return 'Please enter valid number';
                }
              }, color: Colors.purple, controller: phoneController,border: InputBorder.none),
              //Email Field
              InputText(hintText: 'Enter your Email', labelText: 'Email', prefixIcon: Icons.email, padding: 8, keyboardType: TextInputType.emailAddress, validator: (value){
                if (value!.isEmpty) {
                  return 'Please enter valid email';
                }
                else if(emailController.text.contains('@')==false||emailController.text.contains('.')){
                  return 'Please enter valid email';
                }
              }, color: Colors.purple, controller: emailController,
              border: InputBorder.none),
              //Password Field
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
              //Confirm Password Field
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
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                      },
                      obscureText: isConfirmPassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.purple,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isConfirmPassword = !isConfirmPassword;
                              });
                            },
                            icon: isConfirmPassword
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.purple,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: Colors.purple,
                                  )),
                        hintText: 'Confirm your password',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              //Register Button
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));

                            }
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              // Login Button
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
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            'Login',
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
    );
  }
}



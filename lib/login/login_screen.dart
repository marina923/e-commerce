import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/layout/categories_screen.dart';
import 'package:e_commerce/login/cubit/cubit.dart';
import 'package:e_commerce/login/cubit/states.dart';
import 'package:e_commerce/register/register_screen.dart';
import 'package:e_commerce/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopLoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 35.0, right: 35.0, top: 190.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.0),
                      ),
                      SizedBox(
                        height: height * 0.15,
                      ),
                      Text(
                        'Login now to browse our hot offers',
                      ),
                      SizedBox(
                        height: height * 0.15,
                      ),
                      defaultTextFormField(
                          controller: emailController,
                          label: 'Enter your e-mail',
                          prefix: Icons.email_outlined,
                          type: TextInputType.emailAddress,
                          validate: (var value) {
                            if (value!.isEmpty) {
                              return 'Please Enter your e-mail address!';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultTextFormField(
                          controller: passwordController,
                          label: 'Enter your password',
                          isPassword: cubit.isPassword,
                          prefix: Icons.lock_outline,
                          sufix: cubit.isPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          type: TextInputType.visiblePassword,
                          suffixPressed: () {
                            cubit.changePasswordIcon();
                          },
                          validate: (var value) {
                            if (value!.isEmpty) {
                              return 'Please Enter your password!';
                            }
                            return null;
                          }),
                      ConditionalBuilder(
                        condition: state is! ShopLoginLoadingState,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: defaultButton(
                            text: 'LOGIN',
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ShopLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Categories(),
                                    ));
                              }
                            },
                          ),
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: height * 15.0,
                      ),
                      Row(
                        children: [
                          Text('Don\'t have an account?'),
                          Spacer(),
                          defaultTextButton(
                              pressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ));
                              },
                              title: 'Register Now'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

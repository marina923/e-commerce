import 'package:e_commerce/layout/on_boarding.dart';
import 'package:flutter/material.dart';

import 'onboarding.dart';

Widget buildBoardingItem(OnBoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${model.image}'),
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        Text(
          '${model.title}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
        SizedBox(
          height: 14.0,
        ),
        Text(
          '${model.body}',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUppercase = true,
  double radius = 0.0,
  required String text,
  required String? Function(String?)? function()?,
}) =>
    Container(
      height: 40.0,
      width: width,
      child: MaterialButton(
        child: Text(isUppercase ? text.toUpperCase() : text),
        textColor: Colors.white,
        onPressed: function,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
Widget defaultTextFormField({
  required TextEditingController controller,
  required String label,
  required IconData prefix,
  Function(String)? onSubmit,
  Function(String)? onChange,
  required TextInputType type,
  bool isPassword = false,
  required String? Function(String?)? validate,
  IconData? sufix,
  Function()? suffixPressed,
  Function()? tap,
  bool? isClickable,
}) =>
    TextFormField(
      enabled: isClickable,
      onTap: tap,
      onChanged: onChange,
      controller: controller,
      onFieldSubmitted: onSubmit,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: sufix != null
            ? IconButton(
                icon: Icon(sufix),
                onPressed: suffixPressed,
              )
            : null,
        border: OutlineInputBorder(),
      ),
      validator: validate,
    );
Widget defaultTextButton(
        {required String title, required Function()? pressed}) =>
    TextButton(
        onPressed: pressed,
        child: Text(
          title.toUpperCase(),
          style: TextStyle(color: Colors.black54),
        ));

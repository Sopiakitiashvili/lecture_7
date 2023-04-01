import 'package:flutter/material.dart';


class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordHidden = true;

  final formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      height: 400,
      margin: const EdgeInsets.symmetric(
          horizontal: 16
      ),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.all(Radius.circular(20)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 15,
            offset: Offset(15, 15),
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if(value != null || value!.isEmpty){
                    return "field must be filled";
                  }
                  return null;
                },
                controller: usernameController,
                decoration:  InputDecoration(
                  prefixIcon:  Icon(Icons.person),
                  suffixIcon: IconButton(onPressed: () {
                    usernameController.clear();
                  }, icon:  Icon(Icons.clear)),
                ),
              ),
               SizedBox(height: 24,),
              TextFormField(
                obscureText: passwordHidden,
                controller: passwordController,
                decoration:  InputDecoration(
                    prefixIcon:  Icon(Icons.key),
                    suffixIcon: IconButton(onPressed: () {
                      setState(() {
                        passwordHidden = !passwordHidden;
                      });
                    },icon:  Icon(Icons.remove_red_eye))
                ),
              ),
              const SizedBox(height: 24,),
              ElevatedButton(onPressed: () {
                formKey.currentState!.validate();
              }, child:  Text("Login"))
            ],
          ),
        ),
      ),
    ),
    );
  }
}


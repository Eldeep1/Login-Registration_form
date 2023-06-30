
import 'package:flutter/material.dart';
import 'package:login_form/modules/home/home_screen.dart';
import 'package:login_form/modules/register/register_screen.dart';
import 'package:login_form/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  String? password;
      String? email;
  String? firstName;

   LoginScreen({super.key,
     this.password,
    this.email,
    this.firstName,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState(password: password,email: email,name: firstName);
}

class _LoginScreenState extends State<LoginScreen> {
  String? password;
      String? name;
  String? email;
  _LoginScreenState({
    this.password,
    this.name,
   this.email,
});
  TextEditingController emailController = TextEditingController();
  bool obscure=true;
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool wrongData=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                defaultFormField(
                  keyBoardType:TextInputType.emailAddress,
                  suffixClick: (){},
                  validation: true,
                  alertText: 'please enter an email',
                  controller: emailController,
                  prefixIcon: Icons.email,
                  labelText: 'Email',
                ),

                const SizedBox(height: 30,),

                defaultFormField(
                    keyBoardType:TextInputType.visiblePassword,
                    alertText: 'please enter password',
                  validation: true,
                    controller: passwordController,
                    prefixIcon: Icons.email,
                  obscureText: obscure,
                    labelText: 'Password',
                  suffixIcon: !obscure?Icons.visibility:Icons.visibility_off,
                  suffixClick: (){
                    setState(() {

                      if(obscure){
                        obscure=false;
                      }
                      else
                      {
                        obscure=true;
                      }
                    });

                  }
                ),

                const SizedBox(height: 30,),
                if (wrongData) textbutton(text: "", coloredText: 'Incorrect Email or Password', function: (){},coloredTextColor: Colors.red) ,
                materialbutton(
                    text: 'Login', buttonColor: Colors.blue, function: (){
                  if(formKey.currentState!.validate()){
                    if(passwordController.text==password&&emailController.text.trimRight()==email!.trimRight()){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(name: name)));
                      setState(() {
                        wrongData=false;
                      });
                    }
                    else {
                      setState(() {
                        wrongData = true;
                      });
                    }
                  }
                }),

                textbutton(
                    text: 'Don\'t have an account?',
                    coloredText: 'Register Now',
                    function: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

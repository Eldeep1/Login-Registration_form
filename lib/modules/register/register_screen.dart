import 'package:flutter/material.dart';
import 'package:login_form/modules/login/login_screen.dart';
import 'package:login_form/shared/components/components.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  String? errorText;
  bool obscure=true;
  bool obscureSecondField=true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [

                  const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text(
                        'Register',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      defaultFormField(controller: firstNameController, prefixIcon: null, labelText: 'First Name', validation: true,width: 150,keyBoardType:TextInputType.name),
                      const SizedBox(width: 44.0,),
                      defaultFormField(controller: lastNameController, prefixIcon: null, labelText: 'Last Name', validation: true, width: 150,keyBoardType:TextInputType.name),
                    ],
                  ),
                  const SizedBox(height: 30,),

                  defaultFormField(
                      suffixClick: (){},
                    validation: true,
                      controller: emailController,
                      prefixIcon: Icons.email_outlined,
                      labelText: 'Email',
                    keyBoardType:TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 30,),

                  defaultFormField(
                      obscureText: obscure,
                      validation: true,
                      controller: passwordController,

                      prefixIcon: Icons.lock,
                      labelText: 'Password',
                    keyBoardType:TextInputType.visiblePassword,
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

                  defaultFormField(
                      validation: true,
                      errorText: errorText,
                      onChanged: (noThingShouldBePutHere){
                        setState(() {
                          if(passwordController.text!=rePasswordController.text){
                            errorText='the passwords don\'t match';
                        }
                          else
                            {
                              setState(() {
                              });
                              errorText=null;
                            }
                        });
                      },
                      obscureText: obscureSecondField,
                    controller: rePasswordController,
                    prefixIcon: Icons.lock,
                    labelText: 'Confirm Password',
                    keyBoardType:TextInputType.visiblePassword,
                      suffixIcon: !obscureSecondField?Icons.visibility:Icons.visibility_off,
                      suffixClick: (){
                        setState(() {

                          if(obscureSecondField){
                            obscureSecondField=false;
                          }
                          else
                          {
                            obscureSecondField=true;
                          }
                        });

                      }
                  ),

                  const SizedBox(height: 30,),

                  materialbutton(text: 'Register Now', buttonColor: Colors.blue, function: (){
                    if(formKey.currentState!.validate()){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen(
                        email: emailController.text,password: passwordController.text,firstName: '${firstNameController.text} ${lastNameController.text}',
                      ),));
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

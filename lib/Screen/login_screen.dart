import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsk/Repository/repository.dart';
import 'package:tsk/Screen/register_screen.dart';
import 'package:tsk/bloc/Login_bloc/login_bloc.dart';
import 'package:tsk/bloc/Login_bloc/login_event.dart';
import 'package:tsk/bloc/Login_bloc/login_state.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginSState();
}
class _LoginSState extends State<LoginScreen>  {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  bool isVisible = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(LoginRepository())..add(CheckLoginStatus()), // Check login status on load
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacementNamed(context, '/home');
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Padding(
                  padding:  const EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/Mashariq00.png',
                      ),
                      Text('تسجيل الدخول',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize:20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: 'اسم المستخدم',
                          labelText: 'اسم المستخدم',
                          prefixIcon: Icon(Icons.person_pin,color: Colors.orangeAccent,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        controller: passwordController,
                        obscureText:isVisible ,
                        decoration: InputDecoration(
                          hintText: 'كلمه المرور',
                          labelText: 'يرجا ادخال',
                          prefixIcon: Icon(Icons.lock_outline_rounded,color: Colors.orangeAccent,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: IconButton(
                            icon: isVisible? Icon(Icons.visibility_off): Icon(Icons.visibility) ,
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                
                            },
                          ),                      ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (newValue) {
                              setState(() {
                                isChecked = newValue!;
                              });
                            },
                            activeColor: Colors.orangeAccent, // Customize the checkbox color when checked
                          ),
                          Text('تذكرنى',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 350.0,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            final username = usernameController.text;
                            final password = passwordController.text;
                
                            context.read<LoginBloc>().add(LoginSubmitted(username, password));
                          },
                          icon: Icon(Icons.check_circle), // Icon data for the button
                          label: Text('تسسجيل دخول'),
                          style: ElevatedButton.styleFrom(foregroundColor:  Colors.white, backgroundColor: Colors.orangeAccent,)
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 350.0,
                        height: 50,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context)=> RegisterScreen(),
                              ));
                              },
                            icon: Icon(Icons.person_outline_sharp), // Icon data for the button
                            label: Text('انشى حساب جديد'),
                            style: ElevatedButton.styleFrom(foregroundColor:  Colors.white, backgroundColor: Colors.black87,)
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Flexible(child: Icon(Icons.lock_outline_rounded,color: Colors.black54,)),
                          SizedBox(width: 10,),
                          Flexible(
                            child: Text('نسيت كلمه المرور',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

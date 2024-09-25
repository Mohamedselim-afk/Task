import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsk/Repository/repository.dart';
import 'package:tsk/Screen/login_screen.dart';
import 'package:tsk/bloc/Register_Bloc/register_bloc.dart';
import 'package:tsk/bloc/Register_Bloc/register_event.dart';
import 'package:tsk/bloc/Register_Bloc/register_state.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}
List<String> Gender = ['ذكر','انثي'];

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  String currentGender = Gender[0];
  bool isVisible = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
          toolbarHeight: 100,
          title:  Text("تسجيل حساب جديد"),
          actions: <Widget>[
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            tooltip: 'الرجوع للخلف',
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(
                builder: (context)=> LoginScreen(),
              ));
            }
          )),
      body: BlocProvider(
        create: (context) => RegisterBloc(LoginRepository()),
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              Navigator.pushReplacementNamed(context, '/home');
            } else if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'الاسم الاول',
                      labelText:  'الاسم الاول',
                      prefixIcon: Icon(Icons.account_box_outlined,color: Colors.orangeAccent,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'الاسم الثانى',
                      labelText:  'الاسم الثانى',
                      prefixIcon: Icon(Icons.account_box_outlined,color: Colors.orangeAccent,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'اسم الجد',
                      labelText:  'اسم الجد',
                      prefixIcon: Icon(Icons.account_box_outlined,color: Colors.orangeAccent,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'اسم العائله',
                      labelText:  'اسم العائله',
                      prefixIcon: Icon(Icons.account_box_outlined,color: Colors.orangeAccent,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'تاريخ الميلاد',
                  prefixIcon: Icon(Icons.calendar_today,color: Colors.orangeAccent,),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                readOnly: true,
                onTap: (){
                  _selectDate();
                },
              ),
                  SizedBox(height: 10,),
                  TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'رقم الجوال',
                  labelText: 'رقم الجوال',
                  prefixIcon: Icon(Icons.phone_outlined,color: Colors.orangeAccent,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
                  SizedBox(height: 10,),
                  TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'تاريخ انتهاء السجل',
                  prefixIcon: Icon(Icons.calendar_today,color: Colors.orangeAccent,),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                readOnly: true,
                onTap: (){_selectDate();},
              ),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'البريد الالكترونى',
                      labelText: 'البريد الالكترونى',
                      prefixIcon: Icon(Icons.lock_outline_rounded,color: Colors.orangeAccent,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Flexible(
                        child: ListTile(
                          title: Text('ذكر'),
                          leading: Radio(
                            value: Gender[0],
                            groupValue: currentGender,
                            onChanged: (value){
                              setState(() {
                                currentGender = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          title: Text('انثى'),
                          leading: Radio(
                            value: Gender[1],
                            groupValue: currentGender,
                            onChanged: (value){
                              setState(() {
                                currentGender = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: usernameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'اسم المستخدم',
                      labelText: 'اسم المستخدم',
                      prefixIcon: Icon(Icons.person_pin,color: Colors.orangeAccent,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isVisible,
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
                      ),),
                  ),
                  SizedBox(height: 10),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      if (state is RegisterLoading) {
                        return CircularProgressIndicator();
                      }
                      return Container(
                        width: 350.0,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            final username = usernameController.text;
                            final password = passwordController.text;
            
                            context.read<RegisterBloc>().add(RegisterSubmitted(username, password));
                          },
                            icon: Icon(Icons.check_circle), // Icon data for the button
                            label: Text('تسسجيل دخول'),
                            style: ElevatedButton.styleFrom(foregroundColor:  Colors.white, backgroundColor: Colors.orangeAccent,)
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _selectDate() async{
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if(_picked != null){
      setState(() {
        _dateController.text = _picked.toString().split('')[0];
      });
    }
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_shift/core/colors.dart';
import 'package:tech_shift/core/constants.dart';
import 'package:tech_shift/view/screens/sign_up_screen/sign_up_screen.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 400,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login_bg.png'),
                    fit: BoxFit.fill)),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 30,
                  width: 80,
                  height: 200,
                  child: FadeInDown(
                      duration: const Duration(seconds: 1),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/light-1.png'))),
                      )),
                ),
                Positioned(
                  left: 140,
                  width: 80,
                  height: 150,
                  child: FadeInDown(
                      duration: const Duration(milliseconds: 1200),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/light-2.png'))),
                      )),
                ),
                Positioned(
                  right: 40,
                  top: 40,
                  width: 80,
                  height: 150,
                  child: FadeInDown(
                      duration: const Duration(milliseconds: 1300),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/clock.png'))),
                      )),
                ),
                Positioned(
                    right: 20,
                    bottom: 0,
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 1600),
                      child: SizedBox(
                          width: 180,
                          height: 180,
                          child: Image.asset('assets/images/login_pc.png',
                              fit: BoxFit.cover)),
                    )),
                Positioned(
                  top: 110,
                  right: 50,
                  left: 50,
                  child: FadeIn(
                      duration: const Duration(milliseconds: 1600),
                      child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                FadeInUp(
                    duration: const Duration(milliseconds: 1800),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: appThemePurple800),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Form(
                        // key: viewModel.formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: appThemePurple800))),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                // controller: viewModel.emailOrphone,
                                //  validator: (value) =>
                                //     viewModel.validateEmail(value.toString()),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email or Phone number",
                                    hintStyle: TextStyle(color: black)),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                //  controller: viewModel.password1,
                                obscureText: true,
                                // validator: (value) => viewModel
                                //     .validatePassword(value.toString()),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color: black,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeInUp(
                        duration: const Duration(milliseconds: 2000),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (ctx) => ScreenSignUp()));
                          },
                          child: Text("Forgot Password?",
                              style: TextStyle(color: appThemePurple800)),
                        )),
                  ],
                ),
                h10,
                FadeInUp(
                    duration: const Duration(milliseconds: 1900),
                    child: GestureDetector(
                      // onTap: () => viewModel.signIn(context),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              const Color.fromRGBO(143, 148, 251, 1),
                              appThemePurple800,
                            ])),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
                h50,
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (ctx) => const ScreenSignUp())),
                  child: FadeInUp(
                      duration: const Duration(milliseconds: 2000),
                      child: Text(
                        "Don't have an account? SignUp",
                        style: TextStyle(
                            color: appThemePurple800,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

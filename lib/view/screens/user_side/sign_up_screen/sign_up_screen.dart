import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tech_shift/core/colors.dart';
import 'package:tech_shift/core/constants.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: false,

      extendBody: true,
      body: ListView(
              children: [
      // SizedBox(
      //   height: 400,
      //   child: Stack(
      //     children: <Widget>[
      //       Positioned(
      //         top: -40,
      //         height: 400,
      //         width: width,
      //         child: FadeInUp(
      //             duration: const Duration(seconds: 1),
      //             child: Container(
      //               decoration: const BoxDecoration(
      //                   image: DecorationImage(
      //                       image:
      //                           AssetImage('assets/images/signup_bg1.png'),
      //                       fit: BoxFit.fill)),
      //             )),
      //       ),
      //       Positioned(
      //         height: 400,
      //         width: width + 20,
      //         child: FadeInUp(
      //             duration: const Duration(milliseconds: 1000),
      //             child: Container(
      //               decoration: const BoxDecoration(
      //                   image: DecorationImage(
      //                       image:
      //                           AssetImage('assets/images/signup_bg2.png'),
      //                       fit: BoxFit.fill)),
      //             )),
      //       )
      //     ],
      //   ),
      // ),
      Container(
    
        height: 200,
        color: Colors.amber,
        child: Stack(
          children: [
            Image.asset('assets/images/logo.png', fit: BoxFit.contain,),
            Text(('Tech Shift'))
          ],
          
        )),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )),
            const SizedBox(
              height: 30,
            ),
            FadeInUp(
                duration: const Duration(milliseconds: 1700),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      border: Border.all(
                          color: const Color.fromRGBO(196, 135, 198, .3)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(196, 135, 198, .3),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        )
                      ]),
                  child: Form(
                    // key: viewModel.formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(
                                          196, 135, 198, .3)))),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            // controller: viewModel.emailOrphone,
                            // validator: (value) =>
                            //     viewModel.validateEmail(value.toString()),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email address",
                                hintStyle: TextStyle(color: black)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(
                                          196, 135, 198, .3)))),
                          child: TextFormField(
                            // controller: viewModel.password1,
                            // obscureText: viewModel.obscureText,
                            // validator: (value) =>
                            //     viewModel.validatePassword(value.toString()),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: black,
                                )),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            // controller: viewModel.password2,
                            // obscureText: viewModel.obscureText2,
                            // validator: (value) =>
                            //     viewModel.validatePassword(value.toString()),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            h30,
            FadeInUp(
                duration: const Duration(milliseconds: 1900),
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.purple,
                  splashColor: Colors.white70,
                  highlightColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 50,
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: const TextStyle(color: white),
                    ),
                  ),
                )),
            h30,
            FadeInUp(
                duration: const Duration(milliseconds: 2000),
                child: Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Already have an Account? Login",
                          style: TextStyle(color: Colors.purple),
                        )))),
            h40,
          ],
        ),
      )
              ],
            ),
    );
  }
}

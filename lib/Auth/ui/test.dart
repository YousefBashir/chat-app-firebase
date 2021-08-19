// class LoginPage extends StatelessWidget {
//   static final routeName='login';
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AuthProvider>(builder: (context, provider, x) {
//       return Scaffold(
//         body: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 colors: [
//                   Colors.blue.shade900,
//                   Colors.blue.shade600,
//                   Colors.blue.shade400,
//                 ],
//               )),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 80,
//               ),
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Login',
//                       style: TextStyle(color: Colors.white, fontSize: 40),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       'Welcome back',
//                       style: TextStyle(color: Colors.white, fontSize: 20),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(60),
//                             topRight: Radius.circular(60))),
//                     child: Padding(
//                       padding: EdgeInsets.all(20),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             const SizedBox(
//                               height: 40,
//                             ),
//                             Container(
//                               padding: EdgeInsets.all(20),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.shade600.withOpacity(0.2),
//                                     blurRadius: 20,
//                                     offset: Offset(0, 10),
//                                   ),
//                                 ],
//                               ),
//                               child: Column(
//                                 children: [
//                                   CustomTextField(
//                                       provider.emailEditingController, 'Email'),
//                                   CustomTextField(
//                                       provider.passwordEditingController,
//                                       'Password')
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             GestureDetector(
//                               onTap: (){
//                                 RoutHelper.routHelper.gotToPage(ResetPasswordPage.routeName);
//                               },
//                               child: Container(
//                                   alignment: Alignment.topRight,
//                                   child: Text(
//                                     'Forget Password',
//                                     textAlign: TextAlign.end,
//                                     style: TextStyle(
//                                         color: Colors.blue,
//                                         fontWeight: FontWeight.bold),
//                                   )),
//                             ),
//                             const SizedBox(
//                               height: 30,
//                             ),
//                             Container(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Do not have account?'),
//                                     const SizedBox(
//                                       width: 10,
//                                     ),
//                                     InkWell(
//                                       child: Text(
//                                         "SignUp",
//                                         style: TextStyle(
//                                             color: Colors.blue.shade600,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       onTap: () {
//                                         RoutHelper.routHelper.gotToPage(RegisterPage.routeName);
//
//                                       },
//                                     ),
//                                   ],
//                                 )),
//                             SizedBox(
//                               height: 40,
//                             ),
//                             CustomButton('SignIn', provider.login),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }

// import 'package:local_auth/local_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'manage_account.dart';
//
//
// class RegisterBiometric extends StatefulWidget {
//
//   RegisterBiometric({Key key}) : super(key: key);
//
//
//   @override
//   _RegisterBiometricState createState() => _RegisterBiometricState();
// }
//
// class _RegisterBiometricState extends State<RegisterBiometric> {
//   final LocalAuthentication _localAuthentication = LocalAuthentication();
//   Future<bool> _isBiometricAvailable() async {
//     bool isAvailable = false;
//     try {
//       isAvailable = await _localAuthentication.canCheckBiometrics;
//     } on PlatformException catch (e) {
//       print(e);
//     }
//     if (!mounted) return isAvailable;
//     isAvailable
//         ? print('Biometric is available!')
//         : print('Biometric is unavailable.');
//
//     return isAvailable;
//   }
//
//   Future<void> _getListOfBiometricTypes() async {
//     List<BiometricType> listOfBiometrics;
//     try {
//       listOfBiometrics = await _localAuthentication.getAvailableBiometrics();
//     } on PlatformException catch (e) {
//       print(e);
//     }
//
//     if (!mounted) return;
//
//     print(listOfBiometrics);
//   }
//   Future<void> _authenticateUser() async {
//     bool isAuthenticated = false;
//     try {
//       isAuthenticated = await _localAuthentication.authenticateWithBiometrics(
//         localizedReason:
//         "Please authenticate to view info",
//         useErrorDialogs: true,
//         stickyAuth: true,
//       );
//     } on PlatformException catch (e) {
//       print(e);
//     }
//
//     if (!mounted) return;
//
//     isAuthenticated
//         ? print('User is authenticated!')
//         : print('User is not authenticated.');
//
//     if (isAuthenticated) {
//
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (BuildContext context){
//             return MainScreen(user:);
//           },
//         ),
//       );
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Register Biometric')),
//       body: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//
//               RaisedButton(
//                 child: Text('Authorize',style: TextStyle(color: Colors.white,fontSize: 20),),
//                 color: Colors.pink,
//                 onPressed: () async {
//                   if (await _isBiometricAvailable()) {
//                     await _getListOfBiometricTypes();
//                     await _authenticateUser();
//                   }
//                 },
//               )
//             ],
//           )),
//     );
//   }
// }
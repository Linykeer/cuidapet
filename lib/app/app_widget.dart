import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppWidget extends StatelessWidget {

  const AppWidget({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    Modular.setObservers([
     Asuka.asukaHeroController,
    ]);
       return ScreenUtilInit(
        designSize: const Size(390, 844),
          minTextAdapt: true,
      splitScreenMode: true,
         builder: (_, __) => MaterialApp.router(
          title: 'Cuidapet',
          builder:Asuka.builder ,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.red),
          routeInformationParser: Modular.routeInformationParser,
         routerDelegate: Modular.routerDelegate,
         ),
       );
  }
}

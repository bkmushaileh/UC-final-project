//Hold and check our state

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/cubit/app_cubit.dart';
import 'package:flutter_application_1/cubit/app_cubit_state.dart';
import 'package:flutter_application_1/pages/welcome_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: ((context, state) {
          //Check on the state
          if (state is WelcomeState) {
            return WelcomePage();
          } else
            return Container();
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_flutter/features/profile_features/screen/profile_screen.dart';
import 'package:healthcare_flutter/features/public_features/logic/token_check/token_check_cubit.dart';

class CheckProfile extends StatefulWidget {
  const CheckProfile({super.key});

  @override
  State<CheckProfile> createState() => _CheckProfileState();
}

class _CheckProfileState extends State<CheckProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TokenCheckCubit, TokenCheckState>(
      builder: (context, state) {
        if(state is TokenLoggedState){
          return ProfileScreen();
        } else{
          return Center(child: Text('No login'));
        }
      },
    );
  }
}

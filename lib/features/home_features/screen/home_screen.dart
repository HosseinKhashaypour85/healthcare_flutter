import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healthcare_flutter/features/home_features/logic/home_bloc.dart';
import 'package:healthcare_flutter/features/home_features/services/home_api_repository.dart';
import 'package:healthcare_flutter/features/home_features/widget/home_content.dart';
import 'package:healthcare_flutter/features/home_features/widget/home_shimmer_loading_widget.dart';
import 'package:healthcare_flutter/features/public_features/widget/error_screen_widget.dart';

import '../../chat_features/screen/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String screenId = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(HomeApiRepository())..add(CallHomeEvent()),
      child: Scaffold(
        floatingActionButton: _floatingActionButtonFunc(),
        backgroundColor: Colors.grey[50],
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoadingState) {
                      return HomeShimmerLoadingWidget();
                    }
                    if (state is HomeCompletedState) {
                      return Column(
                        children: [HomeContent(homeModel: state.homeModel)],
                      );
                    }
                    if (state is HomeErrorState) {
                      return Center(
                        child: ErrorScreenWidget(
                          errorMsg: state.error.errorMsg!,
                          function: () {
                            BlocProvider.of<HomeBloc>(context).add(CallHomeEvent());
                          },
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _floatingActionButtonFunc() {
    return FloatingActionButton(
      backgroundColor: Colors.blue, // Replace with linkColor
      onPressed: () {
        context.push('/chat');
      },
      child: Icon(Icons.chat, color: Colors.white),
    );
  }
}

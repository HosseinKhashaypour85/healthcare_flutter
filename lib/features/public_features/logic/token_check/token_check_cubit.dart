import 'package:bloc/bloc.dart';
import 'package:healthcare_flutter/features/public_features/functions/secure_storage/secure_storage.dart';
import 'package:meta/meta.dart';

part 'token_check_state.dart';

class TokenCheckCubit extends Cubit<TokenCheckState> {
  TokenCheckCubit() : super(TokenCheckInitial());

  tokenChecker()async{
    final status = await SecureStorage().getUserToken();
    if(status != null){
      emit(TokenLoggedState());
    } else{
      emit(TokenNotLoggedState());
    }
  }
}

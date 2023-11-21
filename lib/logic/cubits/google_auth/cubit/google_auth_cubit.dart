import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app/services/login_service.dart';

// import 'package:my_app/data/models/user_model.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitialState());
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;

  Future<dynamic> login() async {
    emit(GoogleAuthLoadingState());
    try {
      //select google account
      final userAccount = await _googleSignIn.signIn();

      //user dismissed the account dialog

      //get authemdication object from account
      final GoogleSignInAuthentication googleAuth =
          await userAccount!.authentication;

      //create OAuthCredentials from auth object
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      //login to firebase using the credentials
      final userCredential = await _auth.signInWithCredential(credential);
      emit(GoogleAuthSuccessState(userCredential.user!));

      String idToken = googleAuth.idToken.toString();
      String clientId = "65337539478-c9ngcg9nickv14dv6ed0krvsmnkv4lsk.apps.googleusercontent.com";
      String clientSecret = "";

      return await LoginService.loginWithGoogle(idToken, clientId, clientSecret);
    } catch (e) {
      emit(GoogleAuthFailedState(e.toString()));
      return e.toString();
    }
  }
}

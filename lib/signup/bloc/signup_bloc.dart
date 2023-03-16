import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is RegisterAccount) {
         try {
        final auth = FirebaseAuth.instance;
        final CollectionReference users =
            FirebaseFirestore.instance.collection('user_details');

       
          await auth.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          await users.doc(auth.currentUser!.uid).set({
            'userid': auth.currentUser!.uid,
            'firstname': event.firstname,
            'lastname': event.lastname,
            'email': event.email,
            'password': event.password,
            'phonenumber': event.phonenumber
          });

          emit(SignupSuccess());
        } on FirebaseAuthException catch (e) {
          print(e.code);
          emit(SignupFailed(errorMessage: e.code));
        }
      }
    });
  }
}

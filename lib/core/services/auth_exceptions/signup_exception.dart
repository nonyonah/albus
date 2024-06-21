class SignUpException {
  final String message;
  
  const SignUpException([this.message = 'An unknown error occured']);

factory SignUpException.code(String code) {
  switch (code) {
    case 'email-already-in-use':
      return const SignUpException('The account already exists for that email.');
    case 'weak-password':
      return const SignUpException('Password is too weak.');
    case 'invalid-email':
      return const SignUpException('Email is not valid.');
    default:
      return const SignUpException();
  }
}
}

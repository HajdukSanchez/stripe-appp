class StripeCustomResponse {
  final bool isSuccess;
  final String message;

  StripeCustomResponse({required this.isSuccess, this.message = ""});
}

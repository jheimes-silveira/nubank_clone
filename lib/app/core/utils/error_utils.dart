class ErrorUtils {
  static String messageGeneral =
      "Ops.. aconteceu algum erro, verifique a conexão da sua rede e tente novamente";
  static getMessage(onError) {
    String message;

    try {
      message = onError.error;
      if (message != null) return message;
    } catch (e) {
      message = messageGeneral;
    }

    try {
      message = onError.message;
      if (message != null) return message;
    } catch (e) {
      message = messageGeneral;
    }

    try {
      message = onError;
      if (message != null) return message;
    } catch (e) {
      message = messageGeneral;
    }

    if (message == null || message.trim().isEmpty) {
      message = messageGeneral;
    }

    return message;
  }
}

class Utils{
  //static String server_path = 'https://hbrsoftware.com.br/fibatrial';
  static String server_path = 'https://fibrilacaoatrial.hbrsoftware.com.br/fibatrial';
  static double font_textos = 20;
  static String dataToString(DateTime data){
    return '${data.day}/${data.month}/${data.year}';
  }

  static String horaToString(DateTime data){
    return '${data.hour}:${data.minute}:${data.second}';
  }
  static String epochToString(int epoch){
    int multiplicador =  epoch > 4110791043 ? 1 : 1000;
    DateTime data =  DateTime.fromMillisecondsSinceEpoch(epoch*multiplicador);
    return '${data.day}/${data.month}/${data.year}';
  }

  static String epochToBigString(int epoch){
    int multiplicador =  epoch > 4110791043 ? 1 : 1000;
    DateTime data =  DateTime.fromMillisecondsSinceEpoch(epoch*multiplicador);
    return '${data.hour}:${data.minute}:${data.second}  ${data.day}/${data.month}/${data.year}';
  }

  static String epochToDiaMes(int epoch){
    int multiplicador =  epoch > 4110791043 ? 1 : 1000;
    DateTime data =  DateTime.fromMillisecondsSinceEpoch(epoch*multiplicador);
    return '${data.day}/${data.month}';
  }

  static int idadeFromEpoch(int epoch){
    DateTime data =  DateTime.fromMillisecondsSinceEpoch(epoch*1000);
    int anos = (DateTime.now().difference(data).inDays/365).round();
    return (anos);
  }

  static int valorExameAlto = 200;
  static int valorExameBaixo = -1;


  static DateTime? parseCompactDate(String? inputString) {
    if (inputString == null) {
      return null;
    }

    // Assumes US mm/dd/yyyy format
    final List<String> inputParts = inputString.split('/');
    if (inputParts.length != 3) {
      return null;
    }

    final int? year = int.tryParse(inputParts[2], radix: 10);
    if (year == null || year < 1) {
      return null;
    }

    final int? month = int.tryParse(inputParts[1], radix: 10);
    if (month == null || month < 1 || month > 12) {
      return null;
    }

    final int? day = int.tryParse(inputParts[0], radix: 10);
    if (day == null || day < 1) {
      return null;
    }

    try {
      return DateTime(year, month, day);
    } on ArgumentError {
      return null;
    }
  }
}
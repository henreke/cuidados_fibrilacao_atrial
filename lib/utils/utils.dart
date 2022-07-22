class Utils{
  static String server_path = 'https://hbrsoftware.com.br/fibatrial';

  static String dataToString(DateTime data){
    return '${data.day}/${data.month}/${data.year}';
  }
  static String epochToString(int epoch){
    int multiplicador =  epoch > 4110791043 ? 1 : 1000;
    DateTime data =  DateTime.fromMillisecondsSinceEpoch(epoch*multiplicador);
    return '${data.day}/${data.month}/${data.year}';
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

}
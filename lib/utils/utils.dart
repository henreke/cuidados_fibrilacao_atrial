class Utils{
  static String server_path = 'https://hbrsoftware.com.br/fibatrial';

  static String dataToString(DateTime data){
    return '${data.day}/${data.month}/${data.year}';
  }
  static String epochToString(int epoch){
    DateTime data =  DateTime.fromMillisecondsSinceEpoch(epoch*1000);
    return '${data.day}/${data.month}/${data.year}';
  }
}
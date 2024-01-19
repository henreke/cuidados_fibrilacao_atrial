const int $nbsp = 0x00A0;

extension StringExtension on String {
  String get nonBreaking => replaceAll(' ', String.fromCharCode($nbsp));
}
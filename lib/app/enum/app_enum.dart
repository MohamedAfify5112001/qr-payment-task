enum QuestionName {
  guestType(name: 'Guest Type'),
  typeYourQr(name: 'Type Your QR');

  final String name;

  const QuestionName({required this.name});
}

enum TypeQrDetails {
  single,
  multiple,
}

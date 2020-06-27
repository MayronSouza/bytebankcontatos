class Contact {
  final String fullName;
  final int accountNumber;

  Contact(this.fullName, this.accountNumber);

  @override
  String toString() => 'Contact(fullName: $fullName, accountNumber: $accountNumber)';
}

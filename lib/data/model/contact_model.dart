class ContactModel {
  final String id;
  final String name;
  final String phone;

  const ContactModel({this.id, this.name, this.phone});

  factory ContactModel.fromJson(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
    );
  }
}

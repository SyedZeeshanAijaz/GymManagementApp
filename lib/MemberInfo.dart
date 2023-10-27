class memberInfo {
  int id;
  String name;
  String contact;
  String gender;
  String package;
  String Email;
  memberInfo(
      this.id, this.name, this.contact, this.gender, this.package, this.Email);
  factory memberInfo.fromMap(Map<String, dynamic> map) {
    return memberInfo(
      map['id'],
      map['Name'],
      map['Contact'],
      map['Gender'],
      map['Package'],
      map['Email'],
    );
  }
}

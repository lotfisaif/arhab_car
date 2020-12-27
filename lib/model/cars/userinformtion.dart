class UserInformation {
  final String pId;
  final String nameUser;
  final String emailUser;
  final String passwordUser;

  final List<dynamic> imageUrlUser;

  UserInformation({
    this.nameUser,
    this.passwordUser,
    this.pId,
    this.emailUser,
    this.imageUrlUser,
  });
}

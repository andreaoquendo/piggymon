class Category{
  final int accountId;
  final int id;
  final String name;

  const Category({
    required this.accountId,
    this.id = 0,
    required this.name
  });
}
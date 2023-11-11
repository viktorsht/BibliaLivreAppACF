class SearchBookModel{
  String _book;

  String get book => _book;
  void setBook(String value) => _book = value;

  SearchBookModel({
      required String book
    }) : _book = book;

  factory SearchBookModel.empty(){
    return SearchBookModel(book: '');
  }

}
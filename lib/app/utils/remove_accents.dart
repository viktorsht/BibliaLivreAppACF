String removeAccents(String text) {
  return text.replaceAll(RegExp('[áàâãäÁÀÂÃÄ]'), 'a')
              .replaceAll(RegExp('[éèêëÉÈÊË]'), 'e')
              .replaceAll(RegExp('[íìîïÍÌÎÏ]'), 'i')
              .replaceAll(RegExp('[óòôõöÓÒÔÕÖ]'), 'o')
              .replaceAll(RegExp('[úùûüÚÙÛÜ]'), 'u')
              .replaceAll(RegExp('[çÇ]'), 'c')
              .replaceAll(RegExp('[ñÑ]'), 'n');
}
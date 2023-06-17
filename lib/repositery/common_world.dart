String commonWorld(String chaine1, String chaine2) {
  String resultat = '';
  int longueurMax = 0;
  
  for (int i = 0; i < chaine1.length; i++) {
    for (int j = i + 1; j <= chaine1.length; j++) {
      String sousMot = chaine1.substring(i, j);
      if (chaine2.contains(sousMot) && sousMot.length > longueurMax) {
        longueurMax = sousMot.length;
        resultat = sousMot;
      }
    }
  }
  
  return resultat;
}

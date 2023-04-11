class Solution {
  String restoreString(String s, List<int> indices) {
    final letters = List.generate(indices.length, (_) => '');
    for (var i = 0; i < s.length; i++) {
      letters[i] = s[indices.indexOf(i)];
    }

    return letters.join();
  }
}

# ➤ Exercise: StringsAndBinaries-2
# Write an anagram?(word1, word2) that returns true if its parameters are anagrams.

defmodule MyWord do
  def anagram?(word1, word1), do: true
  def anagram?(word1, word2), do: anagram?(word1, word2, [])

  def anagram?(word1, [head | tail], list) do
    downcased_word1 = List.to_string(word1) |> String.downcase() |> String.trim()
    downcased_head = List.to_string([head]) |> String.downcase() |> String.trim()

    anagram?(word1, tail, [String.contains?(downcased_word1, downcased_head)] ++ list)
  end

  def anagram?(_, [], list), do: Enum.all?(list)
end

IO.inspect("#{MyWord.anagram?('abc', 'cba')} -> true")
IO.inspect("#{MyWord.anagram?('Jim Morrison', 'Mr Mojo Risin')} -> true")
IO.inspect("#{MyWord.anagram?('abc', 'cbd')} -> false")

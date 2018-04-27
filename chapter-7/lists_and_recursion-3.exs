# ➤ Exercise: ListsAndRecursion-3
# An Elixir single-quoted string is actually a list of individual character
# codes. Write a caesar(list, n) function that adds n to each list element,
# wrapping if the addition results in a character greater than z.
# iex> MyList.caesar('ryvkve', 13) ?????? :)

# Credits to
# https://stackoverflow.com/questions/46386066/convert-list-of-codepoints-or-binary-to-string?answertab=active#tab-top
defmodule MyList do
  @alphabet_size 26
  @alphabet_range ?a..?z
  @first_character ?a

  def caesar(list, n) do
    list |> Enum.map(&add(&1, n)) |> List.to_string
  end

  defp add(character, n) when character in @alphabet_range do
    rem((character - @first_character + n), @alphabet_size) + @first_character
  end

  defp add(character, _), do: character
end

IO.inspect MyList.caesar('ryvkve', 13)

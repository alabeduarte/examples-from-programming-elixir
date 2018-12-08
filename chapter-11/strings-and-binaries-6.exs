# ➤ Exercise: StringsAndBinaries-6
# Write a function to capitalize the sentences in a string. Each sentence is
# terminated by a period and a space. Right now, the case of the characters in
# the string is random.
# iex> capitalize_sentences("oh. a DOG. woof. ") "Oh. A dog. Woof. "

defmodule Sentence do
  def capitalize_sentences(str) do
    String.split(str, ". ")
    |> Enum.map(&(String.capitalize(&1)))
    |> Enum.join(". ")
    |> to_string
  end
end

IO.inspect("#{Sentence.capitalize_sentences("oh. a DOG. woof. ")} == Oh. A dog. Woof. ")

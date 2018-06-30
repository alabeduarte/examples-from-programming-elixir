# ➤ Exercise: ModulesAndFunctions-7
# Find the library functions to do the following, and then use each in iex.
# (If the word Elixir or Erlang appears at the end of the challenge, then
# you’ll find the answer in that set of libraries.)

# – Convert a float to a string with two decimal digits. (Erlang)
IO.inspect Float.to_string(123.456, decimals: 2)

# – Get the value of an operating-system environment variable. (Elixir)
IO.inspect System.get_env("LANG")

# – Return the extension component of a file name (so return .exs if given
# "dave/test.exs"). (Elixir)
IO.inspect Path.extname("./modules_and_functions-7.exs")

# – Return the process’s current working directory. (Elixir)
IO.inspect System.cwd()

# – Convert a string containing JSON into Elixir data structures.
# (Just find; don’t install.)
# https://github.com/devinus/poison ?

# – Execute a command in your operating system’s shell.
IO.inspect System.cmd("echo", ["Hello World"])

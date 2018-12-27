defmodule Issues.TableFormatter do
  import Issues.TableRow, only: [printable: 1]
  import Enum, only: [each: 2, map: 2, map_join: 3, max: 1]

  def print_table_for_columns(rows, headers) do
    with data_by_columns = split_into_columns(rows, headers),
         column_widths = widths_of(data_by_columns),
         format = format_for(column_widths) do
      :io.format(format, headers)

      column_widths
      |> separator()
      |> IO.puts()

      data_by_columns
      |> to_columns()
      |> each(&:io.format(format, &1))
    end
  end

  def split_into_columns(rows, headers) do
    for header <- headers do
      for row <- rows, do: printable(row[header])
    end
  end

  def widths_of(columns) do
    for column <- columns, do: column |> map(&String.length/1) |> max
  end

  def format_for(column_widths) do
    "| " <> map_join(column_widths, " | ", fn width -> "~-#{width}s" end) <> " |~n"
  end

  defp separator(column_widths) do
    "|-" <> map_join(column_widths, "-+-", fn width -> List.duplicate("-", width) end) <> "-|"
  end

  defp to_columns(data_by_columns) do
    data_by_columns
    |> List.zip()
    |> map(&Tuple.to_list/1)
  end
end

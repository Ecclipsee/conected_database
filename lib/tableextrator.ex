defmodule conected_database.TableExtrator do
  def extract_tables_with_column(column_name) do
    {:ok, conn} = conected_database.Database.start_link()
    query = "SELECT table_name FROM information_schema.columns WHERE column_name = ?"
    params = [nome_culona]
    {:ok, result} = Mariaex.query(conn, query, params)
    Mariaex.stop(conn)
    result |> extract_table_names
  end

  defp extract_table_names(%Mariaex.Result{rows: rows}) do
    table_names = Enum.map(rows, fn %{table_name: name} -> name end)
    write_to_file(table_names)
  end

  defp write_to_file(table_names) do
    file = File.open("table_names.txt", [:write, :utf8])
    Enum.each(table_names, fn name -> IO.puts(file, name) end)
    File.close(file)
  end
end

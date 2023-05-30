defmodule conected_database.Database do
  require Mariaex

  def start_link do
    host = "endereco_do_servidor"
    port = 3306
    username = "nome_de_usuario"
    password = "senha"
    database = "nome_do_banco_de_dados"

    {:ok, conn} = Mariaex.start_link(hostname: host, port: port, username: username, password: password, database: database)
    conn
  end
end

defmodule BlogWeb.CommentsChannel do
  use BlogWeb, :channel

  def join(name, payload, socket), do: {:ok, %{nome: "Deu certo"}, socket}

  def handle_in() do
  end
end

defmodule PhoenixCms.Repo.Fake do
  @moduledoc false

  alias PhoenixCms.{Article, Content, Repo}

  @behaviour Repo

  @impl Repo
  def all(Content) do
    {:ok,
     [
       %PhoenixCms.Content{
         id: "contents-1"
         # ...
       },
       %PhoenixCms.Content{
         id: "contents-2"
         # ...
       }
     ]}
  end

  def all(Article) do
    {:ok,
     [
       %Article{
         id: "article-1"
         # ..
       },
       %Article{
         id: "article-2"
         # ..
       }
     ]}
  end

  def all(_), do: {:error, :not_found}

  @impl Repo
  def get(entity, id) when entity in [Article, Content] do
    with {:ok, items} <- all(entity),
         {:ok, nil} <- {:ok, Enum.find(items, &(&1.id == id))} do
      {:error, :not_found}
    end
  end

  def get(_, _), do: {:error, :not_found}
end

defmodule PhoenixCms.Repo do
  alias PhoenixCms.{Article, Content}

  @type entity_types :: Article.t() | Content.t()

  @callback all(Article | Content) :: {:ok, [entity_types()]} | {:error, term}
  @callback get(Article | Content, String.t()) :: {:ok, entity_types()} | {:error, term}

  @adapter Application.get_env(:phoenix_cms, __MODULE__)[:adapter]

  def articles, do: @adapter.all(Article)
  def contents, do: @adapter.all(Content)
  def get_article(id), do: @adapter.get(Article, id)
end

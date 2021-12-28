defmodule PhoenixCms.Content do
  alias __MODULE__

  @type t :: %Content{
          id: String.t(),
          position: non_neg_integer,
          type: String.t(),
          title: String.t(),
          content: String.t(),
          image: String.t(),
          styles: String.t()
        }

  defstruct [:id, :position, :type, :title, :content, :image, :styles]
end

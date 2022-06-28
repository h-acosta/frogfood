defmodule Frogfood.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :image, :string
    field :name, :string
    field :price, :decimal
    field :description, :string

    timestamps()
  end
  def changeset(%__MODULE__{} = product, attrs) do
    product
    |> cast(attrs, [:name, :price, :description, :image])
    |> validate_required([:name, :price, :description, :image])
    |> validate_format(:image, ~r/[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%.\+~#=]{2,256}\.[a-z]{2,6}/)
    |> unique_constraint(:name)
  end

end

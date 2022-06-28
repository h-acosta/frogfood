defmodule Frogfood.Catalog.CRM do
  alias Frogfood.Catalog.Product
  alias Frogfood.Repo

  def build_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
  end

  def create_product(attrs) do
    attrs
    |> build_product
    |> Repo.insert
  end

  def delet_product(attrs) do
    attrs
    |> build_product
    |> Repo.delete
  end

  def update_product(attrs) do
    attrs
    |> build_product
    |> Repo.update
  end

end

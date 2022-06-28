defmodule Frogfood.Catalog do

  alias Frogfood.Catalog.Product
  alias Frogfood.Repo

  def list_products do
    Product
    |> Repo.all
  end

  def list_seasonal_products do
    list_products()
  end
end

defmodule FrogfoodWeb.PageController do
  use FrogfoodWeb, :controller
  alias Frogfood.Catalog

  def index(conn, _params) do
    list_products = Catalog.list_seasonal_products

    new_conn = assign(conn, :list_products, list_products)
    render new_conn, "index.html"

  end

end

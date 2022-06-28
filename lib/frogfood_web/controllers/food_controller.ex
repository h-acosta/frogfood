defmodule FrogfoodWeb.FoodsController do
  use FrogfoodWeb, :controller
  alias Frogfood.Catalog.CRM
  alias Frogfood.Catalog

  def index(conn, _params) do
    list_products = Catalog.list_seasonal_products

    new_conn = assign(conn, :list_products, list_products)
    render new_conn, "index.html"

  end

  def new(conn, _) do
    changeset = CRM.build_product()
    render(conn, "new.html", changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
		product = Frogfood.Repo.get!(Frogfood.Catalog.Product, id)
    changeset = Frogfood.Catalog.Product.changeset(%Frogfood.Catalog.Product{}, Map.from_struct(product))
		render conn, "edit.html", changeset: changeset, product: product
	end

  def create(conn, %{"foods" => foods_params}) do
    case CRM.create_product(foods_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Registration successful")
        |> redirect(to: Routes.foods_path(conn, :index))
      {:error, changeset} ->
        conn
        |> render(:new, changeset: changeset)
    end
  end

  def delete(conn, params) do
    product = Frogfood.Repo.get!(Frogfood.Catalog.Product, params["id"])
     case Frogfood.Repo.delete product do
       {:ok, struct}->
        conn
        |> put_flash(:info, "Delete successful")
        |> redirect(to: Routes.foods_path(conn, :index))
       {:error, changeset} ->
        conn
        |> put_flash(:info, "Delete Error")
        |> redirect(to: Routes.foods_path(conn, :index))
     end
  end

  def update(conn, params) do
    product = Frogfood.Repo.get!(Frogfood.Catalog.Product, params["id"])
    changeset = Frogfood.Catalog.Product.changeset(product, params["foods"])
     case Frogfood.Repo.update changeset do
       {:ok, struct}->
        conn
        |> put_flash(:info, "Update successful")
        |> redirect(to: Routes.foods_path(conn, :index))
       {:error, changeset} ->
        conn
        |> put_flash(:info, "Update Error")
        |> redirect(to: Routes.foods_path(conn, :index))
     end
  end

end

defmodule Frogfood.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext"
    create table(:products) do
      add :name, :citext
      add :price, :decimal
      add :description, :string
      add :image, :string

      timestamps()
    end

    create unique_index(:products, [:name])
  end
end

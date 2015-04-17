class AddAdministratorReferenceToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :administrator, index: true, foreign_key: true
  end
end

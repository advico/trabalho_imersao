class CreateChamados < ActiveRecord::Migration[8.0]
  def change
    create_table :chamados do |t|
      t.string :tipo
      t.string :categoria
      t.string :titulo
      t.text :descricao
      t.string :status
      t.text :resposta
      t.text :solucao
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

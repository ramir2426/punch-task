class CreateWebScrapes < ActiveRecord::Migration[5.1]
  def change
    create_table :web_scrapes do |t|
      t.string :url
      t.string :title
      t.string :avatar

      t.timestamps
    end
  end
end

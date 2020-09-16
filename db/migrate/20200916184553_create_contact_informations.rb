class CreateContactInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_informations do |t|

      t.timestamps
    end
  end
end

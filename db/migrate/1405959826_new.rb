class New < ActiveRecord::Migration
  def up
    create_table :messages do |t|
      t.string :name
      t.string :msg
    end

    def down
      drop_table :messages
    end
  end
end
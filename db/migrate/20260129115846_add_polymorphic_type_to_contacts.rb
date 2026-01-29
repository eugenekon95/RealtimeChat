class AddPolymorphicTypeToContacts < ActiveRecord::Migration[8.0]
  def up
    remove_column :contacts, :contact_id, :bigint

    add_reference :contacts, :contactable,
                  polymorphic: true,
                  index: true

    add_index :contacts,
              [:user_id, :contactable_type, :contactable_id],
              unique: true,
              name: "index_contacts_on_user_and_contactable"
  end

  def down
    remove_index :contacts, name: "index_contacts_on_user_and_contactable"

    remove_reference :contacts,
                     :contactable,
                     polymorphic: true

    add_column :contacts, :contact_id, :bigint
  end
end


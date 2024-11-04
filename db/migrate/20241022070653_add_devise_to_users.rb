class AddDeviseToUsers < ActiveRecord::Migration[7.2]
  def self.up
    change_table :users do |t|
      unless column_exists?(:users, :email)
        t.string :email, null: false, default: ""
        add_index :users, :email, unique: true
      end

      unless column_exists?(:users, :encrypted_password)
        t.string :encrypted_password, null: false, default: ""
      end

      unless column_exists?(:users, :reset_password_token)
        t.string :reset_password_token
        add_index :users, :reset_password_token, unique: true
      end

      unless column_exists?(:users, :reset_password_sent_at)
        t.datetime :reset_password_sent_at
      end

      unless column_exists?(:users, :remember_created_at)
        t.datetime :remember_created_at
      end

      # Uncomment these if you want to add more Devise features
      # unless column_exists?(:users, :sign_in_count)
      #   t.integer :sign_in_count, default: 0, null: false
      # end
      # unless column_exists?(:users, :current_sign_in_at)
      #   t.datetime :current_sign_in_at
      # end
      # unless column_exists?(:users, :last_sign_in_at)
      #   t.datetime :last_sign_in_at
      # end
      # unless column_exists?(:users, :current_sign_in_ip)
      #   t.string :current_sign_in_ip
      # end
      # unless column_exists?(:users, :last_sign_in_ip)
      #   t.string :last_sign_in_ip
      # end
    end
  end

  def self.down
    # It's best practice to drop only what was created in the up method.
    change_table :users do |t|
      t.remove :email
      t.remove :encrypted_password
      t.remove :reset_password_token
      t.remove :reset_password_sent_at
      t.remove :remember_created_at
      # t.remove :sign_in_count
      # t.remove :current_sign_in_at
      # t.remove :last_sign_in_at
      # t.remove :current_sign_in_ip
      # t.remove :last_sign_in_ip
    end
  end
end

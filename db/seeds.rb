# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

def self.reset_pk_sequence(table_name)
    case ActiveRecord::Base.connection.adapter_name
    when 'SQlite'
        ActiveRecord::Base.connection.execute("delete from sqlite_sequence whire name='#{table_name}'")
    end
end

#RoomCategory
RoomCategory.delete_all
reset_pk_sequence("category_name")

CSV.foreach("db/room_categories.csv", headers: true) do |row|
    RoomCategory.create(
        category_name: row["category_name"]
    )
end

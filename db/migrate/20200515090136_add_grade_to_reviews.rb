class AddGradeToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :grade, :integer
  end
end

class AiResponseToRoast < ActiveRecord::Migration[7.0]
  def change
    rename_table :ai_responses, :roasts
  end
end

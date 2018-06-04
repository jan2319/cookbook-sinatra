class Recipe
  attr_accessor :name, :description, :prep_time, :difficulty, :status
  def initialize(name, description, prep_time, difficulty, status)
    @name = name
    @description = description
    @prep_time = prep_time
    @difficulty = difficulty
    @status = status
  end

  def done?
    @status == true
  end

  def mark_as_done!
    @status = true
  end
end

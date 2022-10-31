class Magazine
  attr_accessor :name, :category
  @@all = []


  def initialize(name, category)
    if (name.is_a?(String) && category.is_a?(String))
    @name = name
    @category = category
    @@all << self
    else
      raise InitializeError
    end

  end

  def self.all
    @@all
  end

  def contributors
    Article.all.select do |article|
      article.magazine.name == @name
    end
  end

  def self.find_by_name(name)
    Magazine.all.find do |magazine|
      magazine.name == name
    end
  end

  def article_titles
    contributors.map do |article|
      article.title
    end
  end

  def contributing_authors
    contributors.map do |article|
      article.author
    end
  end

  class InitializeError < ArgumentError
    def message
      "Expected a String for name and category"
    end
  end


end

class Author
  attr_reader :name


  def initialize(name)
    if (name.is_a?(String))
    @name = name
    else
      raise InitializeError
    end
  
  end

  def articles
    Article.all.select do |article|
      article.author == @name
    end
  end

  def magazines
    articles.map do |article|
      article.magazine.uniq
    end
  end

  def add_article(title, magazine)
    Article.new(self, magazine, title)
  end

  def topic_areas
    magazines.map do |magazine|
      magazine.category.uniq
    end
  end

  class InitializeError < ArgumentError
    def message
      "Expected a String for name"
    end
  end


end

# Please copy/paste all three classes into this file to submit your solution!

# Class Article

class Article

    attr_reader :magazine, :title
    @@all = []

    def initialize(author, magazine, title)
        if (author.is_a?(Author) && magazine.is_a?(Magazine) && title.is_a?(String))
        @author = author
        @magazine = magazine
        @title = title
        @@all << self
     else
       raise InitializeError
     end
    end

    def self.all
        @@all
    end

    def author
        @author.name
    end

    class InitializeError < ArgumentError
      def message
        "Expected an Author, Magazine, and String"
       end
    end
end



# Class Author

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

  
#   class Magazine

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
  
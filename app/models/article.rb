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

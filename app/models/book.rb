class Book < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true

  def self.get_book_url(title, author)
    url = "https://www.googleapis.com/books/v1/volumes?q='#{title}'+inauthor:'#{author}'"
    puts url
    encoded_uri = URI.encode(url)
    begin
      JSON.parse(open(encoded_uri).read)
    rescue
      puts "\n\n #{encoded_uri} \n\n"
    end
  end

  def self.get_book_info(title, author)
    book_info = get_book_url(title, author)
    url = book_info['items'][0]['selfLink']
    puts url
    encoded_uri = URI.encode(url)
    begin
      JSON.parse(open(encoded_uri).read)
    rescue
      puts "\n\n #{encoded_uri} \n\n"
    end
  end
end

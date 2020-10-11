require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  
  def get_page
    doc = Nokogiri::HTML(open('http://learn-co-curriculum.github.io/site-for-scraping/courses'))
  end
  
  
  def get_courses
    self.get_page.css(".post").each do |post|
      course = Course.new
      Course.title = doc.css(".post").first.css("h2").text
      Course.schedule = doc.css(".post").first.css(".date").text
      Course.description = doc.css(".post").first.css("p").text
    end
  end
  
  def make_courses
    
  end
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end


Scraper.new.get_page

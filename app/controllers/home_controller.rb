class HomeController < ApplicationController
  def index
    @home = Home.find_or_create_by(id: 1) do |home|
      home.heading = 'Simple Goods'
      home.moto = 'Made with Love and Care'
      home.message_one = 'We offer a wide range of handmade products.'
      home.message_one_heading = 'Explore our products'
      home.message_two = 'Our items are crafted with care.'
      home.message_two_heading = 'Quality you can trust'
    end
  end
  def show
    @contact = Contact.first
  end
end

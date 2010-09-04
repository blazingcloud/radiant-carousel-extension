 # Radiant-carousel-extension
 # @license MIT License
 #
 module InfiniteCarouselTag
  include Radiant::Taggable
  
  desc "Contains the panels of the carousel, and other objects."
  tag 'infinite_carousel' do |tag|
    content = '<div id="infinite_carousel"><ul>'
    content << tag.expand
    content << '</ul></div>'
  end
  
  desc "Prints out the individual panels of the carousel."
  tag 'infinite_carousel_image' do |tag|
    %{ <li><a href="#{tag.attr['link']}">
      <img src=" #{tag.attr['src']}"/></a>
      <p>#{tag.attr['caption']}</p></li>
    }
    
  end  
    
  

end
 # Radiant-infinite-carousel-extension
 # @copyright (c) 2010 Blazing CLoud (http://www.blazingcloud.net)
 # @license MIT License
 #
class InfiniteCarouselExtension < Radiant::Extension
  version "2.0"
  description "A rotating banner based on Infinite Carousel"
  url "http://blazingcloud.net"
  
  
    
  def activate
    Page.send :include, InfiniteCarouselTag
    
  end
  
  def deactivate
  end
  
end

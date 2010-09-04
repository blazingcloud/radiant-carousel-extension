 # Radiant-carousel-extension
 # @version 2.0
 # @date September, 2010
 # @category Radiant Extension
 # @copyright (c) 2010 Blazing CLoud (http://www.blazingcloud.net)
 # @license MIT License
 #

namespace :radiant do
  namespace :extensions do
    namespace :infinite_carousel do
      
      desc "Runs the migration of the Carousel extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          InfiniteCarouselExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          InfiniteCarouselExtension.migrator.migrate
        end
      end
      
      desc "update radient extension from git."
      task :update => :environment do
        require 'git'

        g = Git.open (working_dir = '.')
        g.pull
         
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from InfiniteCarouselExtension.rb"
        Dir[InfiniteCarouselExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(InfiniteCarouselExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end
      
      desc "Copies images from a local directory to the public folder."
      task :copy_images => :environment do
        puts "All the files in the local directory will be copied to a publically "
        puts "viewable web directory."
        puts "Directory path should be specified like: /usr/name/myfiles/"
        puts "Please enter the directory:"

        dirpath = $stdin.gets.chomp
        target_dirpath = InfiniteCarouselExtension.root + '/public/images/'

        Dir.foreach(dirpath) do |entry|
          filepath = dirpath + entry
          if(File.file?(filepath))
             puts "Copying file: #{filepath}"
             cp filepath, target_dirpath, :verbose=>false
          end
        end
        puts "All files copied to public directory from #{dirpath}."
      end
      
    end
  end
end

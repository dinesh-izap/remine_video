Redmine::Plugin.register :redmine_video do
	name 'YouTube/Vimeo macro plugin for Wiki Redmine'
	author 'Tarun Jangra'
	description 'This plugin adds a macro to Wiki Redmine that allow the posting of YouTube videos'
	version '1.0.0'
	url 'http://github.com/tarunjangra/redmine_video'
	author_url 'http://tarunjangra.com'
	Redmine::WikiFormatting::Macros.register do
	  desc "This plugin adds a macro to Wiki Redmine that allow the posting of YouTube videos. Syntax: <pre>{{youtube( video_key, [width, height] )}}</pre>"
	  macro :youtube do |obj, args|
            if args.length < 1
	      return "Youtube video id is mandatory."
	    end
           id  = args[0]
	   w = 640
	   h = 480
	   if args.length == 3
	     w = args[1]
	     h = args[2]
           end
	    src = "https://www.youtube.com/embed/" + id
	    content_tag( :iframe, "",  :width=>w, :height=>h, :src=>src, :frameborder=>0, :allowfullscreen=>"true" )
	   end
        end
        Redmine::WikiFormatting::Macros.register do
	  desc "This plugin adds a macro to Wiki Redmine that allow the posting of YouTube videos. Syntax: <pre>{{vimeo( video_key, [width, height] )}}</pre>"
           macro :vimeo do |obj, args|
	    if args.length < 1
	      return "vimeo video id is mandatory."
	    end
           id  = args[0]
	   w = 640
	   h = 480
	   if args.length == 3
	     w = args[1]
	     h = args[2]
           end
	    src = "https://player.vimeo.com/video/" + id
	    content_tag( :iframe, "", :width=>w, :height=>h, :src=>src, :frameborder=>0, :allowfullscreen=>"true", :mozallowfullscreen=>"true", :webkitallowfullscreen=>"true" )
	   end
        end
end

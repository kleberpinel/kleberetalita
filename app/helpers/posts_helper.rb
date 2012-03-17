module PostsHelper
	def join_tags(post)
		post.tags.map { |t| t.name }.join(", ")
	end

	def join_tags_li(post)
		content_tag :li do 
			post.tags.map.each do | t | 
				concat( content_tag(:a, t.name) )
			end
		end
	end
end

module ApplicationHelper

	def flashes_helper
		results =[]
		flashes = [:alert, :warning, :info, :notice, :success]

		flashes.each do |name, msg|
			_type = name == :notice ? "success" : "danger"
			hidden = "hide" if flash[name].blank?
			results << content_tag(:div, content_tag(:p, flash[name]), class: "alert alert-#{_type} #{hidden} alert-block")
		end	
		results.join("").html_safe
	end

end

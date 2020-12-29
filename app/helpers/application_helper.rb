module ApplicationHelper

    include HtmlBuilder
	def document_title
		if @title.present?
			"#{@title} - Manager"
		else
			"Manager"
		end
	end
end

module ApplicationHelper
	def bootstrap_class_for flash_type
		{ success: "alert-success", error: "alert-danger", notice: "alert-warning"}[flash_type.to_sym]
	end

	def flash_messages(opts = {})
		flash.map do |msg_type, message|
			content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
				content_tag(:button, "x".html_safe, class: "close", data: {dismiss: "alert"}) + message
			end
		end.join.html_safe
	end

	def follow_button(follower_id, following_id)
		user_relationship = UserRelationship.where(follower_id: follower_id, following_id: following_id)
		if user_relationship.any?
			form_tag user_relationship_destroy_path, :method => :post do
				concat(
					hidden_field_tag(:relationship_id, user_relationship.first.id) +

					submit_tag(:Unfollow,  class: "btn btn-warning"))
			end
		else
			form_tag user_relationship_create_path, :method => :post do
				concat(
					hidden_field_tag(:follower_id, follower_id) +
				hidden_field_tag(:following_id,  following_id) +
				submit_tag(:Follow,  class: "btn btn-primary"))
			end
		end
	end
end

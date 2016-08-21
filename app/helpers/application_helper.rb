module ApplicationHelper
	def bootstrap_class_for flash_type
		{ success: 'alert-success', error: 'alert-danger', notice: 'alert-warning'}[flash_type.to_sym]
	end

	def flash_messages(opts = {})
		flash.map do |msg_type, message|
			content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
				content_tag(:button, 'x'.html_safe, class: 'close', data: {dismiss: 'alert'}) + message
			end
		end.join.html_safe
	end

	def follow_button(follower_id, following_id)
		form_tag user_relationship_create_path, :method => :post do
			hidden_field :follower_id, :value => follower_id
			hidden_field :following_id, :value => following_id

			if UserRelationship.where(follower_id: follower_id, following_id: following_id).any?
				content_tag(:button, 'followed'.html_safe, class: 'btn btn-secondary')
			else
				 submit_tag :Follow,  class: 'btn btn-primary'
			end
		end
		end
end

class UserMailer < ApplicationMailer

	def new_article_notification(article)

		@article = article

		@user = @article.user

		mail(to: @user.email, subject: 'New Article Created')
		
	end
end

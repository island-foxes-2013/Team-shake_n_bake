# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user_ids = []
User.all.each do |user|
	@user_ids << user.id 
end

def populate_users_table
	100.times do |user|
		User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: '1234', password_confirmation: '1234' )
	end
end
populate_users_table

def populate_questions
	user = User.all
	user.each do |user|
		10.times do |question|
			user.questions.create(title: Faker::Lorem.sentence(word_count = 4), body: Faker::Lorem.paragraphs(paragraph_count = 1).first)
		end
	end
end
populate_questions


def populate_answers
	questions = Question.all
	questions.each do |question|
		3.times do |answer|
			question.answers.create(body: Faker::Lorem.sentences(sentence_count = 3).first, user_id: @user_ids.sample)
		end
	end
end
populate_answers

def populate_votes
	questions = Question.all
	answers = Answer.all
	questions.each do |quest|
    n = rand(0..100)
	  n.times do |vote|
		question.votes.create(user_id: @user_ids.pop)
	end
	answers.each do |answ|
    n = rand(0..100)
	  n.times do |vote|
		answer.votes.create(user_id: @user_ids.pop)
	end
end

def populate_comments
	questions = Question.all
	questions.each do |question|
		n = rand(0..7)
		n.times do |comment|
			question.comments.create(content: Faker::Lorem.sentences(sentence_count = 1).first, user_id: @user_ids.sample)
		end
	end
	answers = Answer.all
	answers.each do |answer|
		n = rand(0..4)
		n.times do |comment|
			answer.comments.create(content: Faker::Lorem.sentences(sentence_count = 1).first, user_id: @user_ids.sample)
		end
	end
end
populate_comments
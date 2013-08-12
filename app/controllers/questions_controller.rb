class QuestionsController < ApplicationController
  def index
    @user = User.new
  	@questions = Question.search(params[:search]).paginate(page: params[:page]).order('id DESC')
    p "$" * 60
    p @questions
  end

  def new
 		if logged_in?
  		@question = Question.new
  	else
  		redirect_to sessions_path
  	end
  end

  def create
  	# user = User.find_by_id(session[:id])
    question = Question.new(params[:question])
    question.user_id = current_user.id
    # question.user_id = user.id
  	if question.save
  		redirect_to question_path(question)
  	else
  		redirect_to new_question_path
  	end
  end

  def show
    @user = User.new # if User wants to Sign-Up from questions#show
  	@question = Question.find(params[:id])
    @question.increment!('view')
    answers = @question.answers.each do |answer|
      answer.votes.build
    end
    @answers = answers.sort! { |a,b| a.votes.count <=> b.votes.count }.reverse
  end
end

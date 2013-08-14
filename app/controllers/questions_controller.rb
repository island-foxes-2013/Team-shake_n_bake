class QuestionsController < ApplicationController
  def index
    @user = User.new
  	@questions = Question.search(params[:search]).paginate(page: params[:page]).order('id DESC')
  end

  def new
 		if logged_in?
  		@question = Question.new
  	else
  		redirect_to new_session_path
  	end
  end

  def create
    @question = Question.new(params[:question])
    current_user.questions << @question
  	if @question.save
  		redirect_to question_path(@question)
  	else
      render :new
  		#redirect_to new_question_path
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

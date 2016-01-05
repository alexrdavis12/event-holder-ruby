class AnswersController < ApplicationController
	before_filter :authenticate_user, :only => [:create]
	
	def index
		eid = params[:eid]
		@eid = params[:eid]
		@answers = Answer.where(eid: eid)
		@answers.seteid(eid)
    	respond_to do |format|
      		format.html
      		format.csv { send_data @answers.to_csv }
    	end
	end

	def create
	  # show questions

	  if params[:eid] != nil
	  	@eid = params[:eid]
	  else
	  	# handle exceptions
	  end

	  @q = Question.where(:EID => @eid).all

		if params[:commit] != nil && params[:commit] == 'Submit'
			params.each do |key, value|
				if ("#{key}".index('Q') != nil)
                    strqid = "#{key}".delete "Q"
					qid = strqid.to_i
					@answer = Answer.new
					@answer.uid = session[:user_id]
					@answer.qid = qid
					@answer.qtitle = Question.where(eid: params[:q_eid], qid:qid).select(:qtitle).take[:qtitle]
	      	  		@answer.eid = params[:q_eid]
	          		@answer.answer = value[:answer]
	          		if @answer.valid?
	          			if @answer.save          			
	          			else
	          				@flash_notice += "DB Error"
	          				render 'create'
	          			end
	          		else   			
	          			@flash_notice += "Create Error"
	          			render 'create'
	          		end
	          	end
	        end
	          
	        redirect_to '/answershow'
	    	return
	    end

	  return
	end

	def show
      #@answer = Answer.all
    end

    def showquestion    
    	currentuid=session[:user_id]
    	if(Answer.where(uid: currentuid,eid: params[:eid]).all.length != 0)
    		flash[:notice] = "You have already registered for this event!"
    		redirect_to '/allevent'
    	end

    	 # show questions
	  if params[:eid] != nil
	  	@eid = params[:eid]
	  else
	  	# handle exceptions
	  end

	  @q = Question.where(:eid => @eid).all
	  return
    end
         	
end

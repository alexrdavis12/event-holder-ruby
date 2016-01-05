class QuestionsController < ApplicationController
	def create
		@flash_notice = ''
		@error_type = 0

		if params[:eid] != nil
			@eid = params[:eid]
		elsif params[:commit] == nil || params[:commit] != 'Create'
			@flash_notice = "Event ID is not specified!"
			@error_type = -1
			render 'create'
			return
		end

		qarray = []

		if params[:commit] != nil && params[:commit] == 'Create'
			params.each do |key, value|
				
				if ("#{key}".index('S') != nil)
					@question = Question.new
					prefix_str = "#{key}".delete "S"
					split_prefrix_str = prefix_str.split('_')
					parent_id = split_prefrix_str[0].to_i 
					parent_optid = split_prefrix_str[1].to_i
					subqcnt = split_prefrix_str[2].to_i * 1000

					qid = parent_id * 1000000 + parent_optid + subqcnt
					@question.qid = qid
					@question.eid = params[:q_eid]
					@question.parentopt = parent_optid

					if (@question.eid == nil)
	      	  			@flash_notice = "Illegal Arguments"
	      	  			render 'create', eid: @eid
	      	  			return
	      	  		end

	      	  		@question.qparentid = parent_id
	      	  		@question.eid = params[:q_eid]
	      	  		@question.qtitle = value[:title]
	          		if (@question.qtitle == nil or @question.qtitle == "")
	      	  			@flash_notice = "Empty title is not allowed"
	      	  			render 'create', eid: @eid
	      	  			return
	      	  		end

	          		@question.qtype = value[:type]
	          		if (@question.qtype == nil or @question.qtype == "" or !["1", "2", "3", "4", "5"].include?@question.qtype)
	      	  			@flash_notice = "Illegal Type"
	      	  			render 'create', eid: @eid
	      	  			return
	      	  		end

	          		option_str = ""
	          		value.each do |k, v|
	          			if ("#{k}".index('opt') != nil) 
	          				option_str += v + "|"
	          			end
	          		end

	          		@question.qoption = option_str[0...-1]

	          		if @question.valid?
	          			qarray << @question
	          		else
	          			@flash_notice = "Create Error"
	          			render 'create', eid: @eid
	          			return
	          		end
	      	  		
				end

				if ("#{key}".index('Q') != nil)
					@question = Question.new
					strqid = "#{key}".delete "Q"
					qid = strqid.to_i
					puts "qid=#{qid}"
					@question.qid = qid
	      	  		@question.eid = params[:q_eid]

	      	  		if (@question.eid == nil)
	      	  			@flash_notice = "Illegal Arguments no eid"
	      	  			render 'create', eid: @eid
	      	  			return
	      	  		end
	          		@question.qtitle = value[:title]
	          		if (@question.qtitle == nil or @question.qtitle == "")
	      	  			@flash_notice = "Empty title is not allowed"
	      	  			render 'create', eid: @eid
	      	  			return
	      	  		end
	          		@question.qtype = value[:type]
	          		if (@question.qtype == nil or @question.qtype == "" or !["1", "2", "3", "4", "5"].include?@question.qtype)
	      	  			@flash_notice = "Illegal Type"
	      	  			render 'create', eid: @eid
	      	  			return
	      	  		end

	          		option_str = ""
	          		value.each do |k, v|
	          			if ("#{k}".index('opt') != nil) 
	          				option_str += v + "|"
	          			end
	          		end
	          		@question.qoption = option_str[0...-1]

	          		if @question.valid?
	          			qarray << @question
	          		else
	          			@flash_notice = "Create Error"
	          			render 'create', eid: @eid
	          			return
	          		end
	          	end
	        end

	        qarray.each do |question|
	        	question.save
	        end
	          
	        cureid = params[:q_eid]
	        redirect_to "/questionshow?eid=#{cureid}"	    	
	        return
	    end

	end

	def show
        eid = params[:eid]
        @questions = Question.where(eid: eid )
	end
end
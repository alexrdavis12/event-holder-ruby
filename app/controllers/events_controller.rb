class EventsController < ApplicationController
	def create
		@event = Event.new
		@flash_notice = ""

		if params[:commit] != nil && params[:commit] == 'Create'
			    @event.etitle = params[:Title]
         	@event.elocation = params[:Location]
         	@event.estart = params[:Start_Date]
          	@event.eend = params[:End_Date]
          	@event.edescription = params[:Description]
          	if @event.valid?

          		if @event.save
          			session[:eid] = @event.id
          			flash[:notice] = "Event Created Successfully!"
                eid=@event.id
          			redirect_to "/eventshow?eid=#{eid}"
          		else
          			@flash_notice += "DB Error"
          			render 'create'
          		end

          	else
          		@flash_notice += "Create Error"
          		render 'Create'
          	end

        end
    end

    def show
      eid=params[:eid]
    	@event = Event.find(eid)
    end
    	
    def allevent
      id = session[:user_id]
      @curlevel = User.find(id).level
      if(@curlevel != 0)
      @event = Event.all
      else
        redirect_to '/admin'
      end
    end
 

end

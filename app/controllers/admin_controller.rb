class AdminController < ApplicationController
	def index
		id = session[:user_id]
    	@users = User.find(id)
    	if(@users.level!=0)
	    	flash[:notice]="You are not authorized to that page"
	    	flash[:color]="Invalid"
	    	redirect_to '/login'
    	end
		@events=Event.all
	end

	def show
		eid = params[:eid]
		@eid = params[:eid]
		@eligibleQuestions=Question.where({qtype: ["2","3","4"], eid: eid})
		@UIDs = Array.new
		Answer.where(eid: eid).select(:uid).distinct.each do |x|
			@UIDs.push(x[:uid])
		end
		@Users = Array.new
		@collegeStation = 0
		@houston = 0
		@austin = 0
		@dallasOrFortWorth = 0
		@sanAntonio = 0
		@otherAreaInTexas = 0
		@outOfTexas = 0
		@UIDs.each do |u|
			@Users.push(User.where(id: u).select(:email).take[:email])
			@Users.push(User.where(id: u).select(:firstname).take[:firstname])
			@Users.push(User.where(id: u).select(:lastname).take[:lastname])
			zipcode=User.where(id: u).select(:zipcode).take[:zipcode]
			latitude=(90-ZIP_CODE.find(zipcode)["latitude"].to_f)/180*Math::PI
			longitude=ZIP_CODE.find(zipcode)["longitude"].to_f/180*Math::PI		
			c= Math.sin(latitude)*Math.cos(30.6014/180*Math::PI)*Math.cos(longitude+96.3144/180*Math::PI)+Math.cos(latitude)*Math.sin(30.6014/180*Math::PI)
			d= Math.sin(latitude)*Math.cos(29.7604/180*Math::PI)*Math.cos(longitude+95.3698/180*Math::PI)+Math.cos(latitude)*Math.sin(29.7604/180*Math::PI)
			e= Math.sin(latitude)*Math.cos(30.2500/180*Math::PI)*Math.cos(longitude+97.7500/180*Math::PI)+Math.cos(latitude)*Math.sin(30.2500/180*Math::PI)
			f= Math.sin(latitude)*Math.cos(29.4167/180*Math::PI)*Math.cos(longitude+98.5000/180*Math::PI)+Math.cos(latitude)*Math.sin(29.4167/180*Math::PI)
			g= Math.sin(latitude)*Math.cos(32.8969/180*Math::PI)*Math.cos(longitude+97.0381/180*Math::PI)+Math.cos(latitude)*Math.sin(32.8969/180*Math::PI)
			
			if ZIP_CODE.find(zipcode)["state"] != "TX"
				@Users.push("Out of Texas")
				@outOfTexas += 1
			elsif 6371.004 * Math.acos(c) * 0.6213 < 10
				@Users.push("College Station")
				@collegeStation += 1
			elsif 6371.004 * Math.acos(d) * 0.6213 < 40	
				@Users.push("Houston")
				@houston += 1
			elsif 6371.004 * Math.acos(e) * 0.6213 < 30
				@Users.push("Austin")
				@austin += 1			
			elsif 6371.004 * Math.acos(f) * 0.6213 < 30
				@Users.push("San Antonio")
				@sanAntonio += 1
			elsif 6371.004 * Math.acos(g) * 0.6213 < 30
				@Users.push("Dallas/Fort Worth")
				@dallasOrFortWorth += 1
			else 
				@Users.push("Other Area in Texas")
				@otherAreaInTexas += 1
			end
		end
	end

	def graphshow
		qid=params[:qid]
		eid=params[:eid]
		#@localQuestion=Question.where(qid: qid)
		#@localAnswers=Answer.where(qid: qid, eid: eid)
		#@localquestion=Question.where(qid: qid, eid:eid)
		#len=@localquestion.select(:qoption).take[:qoption].split("|").length
		#@Answernums=@localAnswers.count
		#@size=Array.new(len){|i| 0}
		#@localAnswers.select(:answer).each do |a|	
		#@size[a[:answer].to_i - 1] = @size[a[:answer].to_i - 1] + 1
		#end
	end

	def delete
		eid = params[:eid]
		Event.find(eid).destroy
		Answer.where(eid: eid).destroy_all
		Question.where(eid: eid).destroy_all
		redirect_to '/admin'
	end

end

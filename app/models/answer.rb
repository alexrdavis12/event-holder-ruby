class Answer < ActiveRecord::Base
	def self.seteid(eid)
		@eid = eid
	end
	
	def self.to_csv
	    CSV.generate do |csv|
	      column_names_for_event = ["etitle", "elocation", "estart", "eend", "edescription"]
  	      column_titles_for_event = ["Event Title", "Location", "Start Time", "End Time", "Description"]
		  eventinfo = Event.find(@eid)
		  csv << ["Event Information"]
		  csv << column_titles_for_event
		  csv << eventinfo.attributes.values_at(*column_names_for_event)
		  csv << [""]
		  csv << ["Event Data"]
	      #print "Event id: #{@eid}"
	      questions = Question.where(eid: @eid).all
	      
	      csvtitle = ["User Email"]
	      qoptionlist = []
	      questions.each do |q|
	      	qoptionlist << q.qoption
	      	optionstr = ""
	      	if q.qoption != ""
	      		optionstr = "(#{q.qoption})"
	      	end
	      	csvtitle << q.qtitle + optionstr
	      end
	      print qoptionlist
	      csv << csvtitle

	      idlist = []
	      ids = Answer.select(:uid).distinct
	      ids.each do |uid|
	      	idlist << uid.uid
	      end
	      
		
	      # output records order by user ID
	      idlist.each do |uid|
	      	user_email = User.where(:id => uid).select(:email).take[:email]
	      	answer = Answer.where(:uid => uid)
	      	answerlist = ["#{user_email}"]
	      	qindex = 0
	      	answer.each do |ans|
	      		if qoptionlist[qindex] != ""
	      			qoptlist = 	qoptionlist[qindex].split("|")
	      			answerlist << qoptlist[ans.answer.to_i - 1]
	      			
	      		else
	      			answerlist << ans.answer
	      		end
	      		qindex += 1
	      	end
	      	
	      	csv << answerlist

	      end
	      
	      
	    #   column_title = ["Record ID", "Event ID", "Email", "Question ID", "Answer", "Created at", "Updated at", "Question Title"]
	    #   csv << column_title
	    #   all = Answer.all
	    #   all.each do |answer|
	    #   	record = answer.attributes.values_at(*column_names)
	    #   	usr_id = record[2]
	    #   	user_email = User.where(:id => usr_id).select(:email).take[:email]
	    #   	record[2] = user_email
	    #     csv << record
	    # end
	    end
  end
end
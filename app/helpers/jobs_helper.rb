module JobsHelper
	def job_title(job)
		title = raw("#{h(job.title)} - #{h(job.company.name)}")

		if job.premium
			title + content_tag(:strong, " (Premium)") 
		else
			title
		end
	end
end
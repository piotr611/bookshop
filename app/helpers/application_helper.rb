module ApplicationHelper
  def my_time_now
  	@time = Time.now
  	@time.strftime("%b %-d,%Y")
  end
end

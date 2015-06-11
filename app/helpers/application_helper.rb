module ApplicationHelper
  def my_time_now
  	@time = Time.now
  	@time.strftime("%b %-d,%Y")
  end

  def hidden_div_if(condition, attributes = {}, &block) 
  	if condition 
  		attributes["style"] = "display: none"
  	end
  	content_tag("div", attributes, &block)
  end

end

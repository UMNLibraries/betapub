module ApplicationHelper
  def pubdate_formatter(date, format)
    Time.parse(date).strftime(format)
  end
end

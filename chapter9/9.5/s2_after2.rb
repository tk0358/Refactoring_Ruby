def check_security(people)
  found = found_miscreant(people)
  some_later_code(found)
end

def found_miscreant(people) #miscreant:悪党
  found = ""
  people.each do |person|
    if found == ""
      if person == "Don"
        send_alert
        return "Don"
      end
      if person == "John"
        send_alert
        return "John"
      end
    end
  end
  found
end
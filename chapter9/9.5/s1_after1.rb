def check_security(people)
  found = false
  people.each do |person|
    unless found
      if person == "Don"
        send_alert
        break
      end
      if person == "John"
        send_alert
        break
      end
    end
  end
end
Given(/^the following movies exist:$/) do |movies_table|
    movies_table.hashes.each do |movie|
        Movie.create!(movie)
    end
    
end

Then(/^the director of "(.*)" should be "(.*)"/) do |title, director|
    expect(Movie.find_by_title(title).director).to eq director
end

Then(/^I should see "(.*)" before "(.*)"/) do |e1, e2|
  first_position = page.body.index(e1)
  second_position = page.body.index(e2)
  first_position.should < second_position
end

When(/^I (un)?check the following ratings: (.*)/) do |uncheck, rating_list|
  rating_list.delete!("\"")
  if uncheck.nil?
    rating_list.split(',').each do |field|
      check("ratings["+field.strip+"]")
    end
  else
    rating_list.split(',').each do |field|
      uncheck("ratings["+field.strip+"]")
    end
  end
end
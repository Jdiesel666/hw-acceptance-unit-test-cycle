Given(/^the following movies exist:$/) do |movies_table|
    movies_table.hashes.each do |movie|
        Movie.create!(movie)
    end
end

Then(/^the director of "(.*)" should be "(.*)"/) do |title, director|
    expect(Movie.find_by_title(title).director).to eq director
end

Then(/^ should see "(.*)" before "(.*)"/) do |e1, e2|
  first_position = page.body.index(e1)
  second_position = page.body.index(e2)
  first_position.should < second_position
end
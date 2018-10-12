require 'rails_helper'


RSpec.describe "Astronauts Index" do
  before(:each) do
    @astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    @astronaut_2 = Astronaut.create(name: "John Doe", age: 32, job: "Commander")
    @astronaut_3 = Astronaut.create(name: "Jane Doe", age: 33, job: "Commander")

    @mission_1 = Mission.create(title:"Apollo 13", time_in_space: 269)
    @mission_2 = Mission.create(title:"Capricorn 4", time_in_space: 300)
    @mission_3 = Mission.create(title:"Gemini 7", time_in_space: 345)

    @astronaut_mission_1 = AstronautMission.create(astronaut: @astronaut_1, mission:@mission_1)
    @astronaut_mission_2 = AstronautMission.create(astronaut: @astronaut_2, mission:@mission_2)
    @astronaut_mission_3 = AstronautMission.create(astronaut: @astronaut_3, mission:@mission_3)
  end

  it 'shows a list of astronaut attributes' do
    visit "/astronauts"

    expect(page).to have_content(@astronaut_1.name)
    expect(page).to have_content(@astronaut_1.age)
    expect(page).to have_content(@astronaut_1.job)
  end

  it 'shows average age of all astronauts' do
    visit "/astronauts"

    expect(page).to have_content("Average Age:34")
  end

  it 'shows a list of space missions' do
    visit "/astronauts"

    expect(page).to have_content(@mission_1.title)
    expect(page).to have_content(@mission_2.title)
    expect(page).to have_content(@mission_3.title)
  end

  it 'shows total time in space for each astronaut' do
    visit "/astronauts"

    expect(page).to have_content("Neil Armstrong spent 269 days in space.")
    expect(page).to have_content("John Doe spent 300 days in space.")
    expect(page).to have_content("Jane Doe spent 345 days in space.")
  end
end

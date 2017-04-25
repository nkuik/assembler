require 'faker'
require 'ffaker'

TeamMember.destroy_all
Skill.destroy_all
Project.destroy_all
ProjectRequirement.destroy_all

def choose_skill(title)
  case title
  when "Dev"
    "web development"
  when "Designer"
    "design"
  when "Creative"
    "creative development"
  when "Business Person"
    "business development"
  else
    "not applicable"
  end
end


30.times do

  member = TeamMember.create!({name: Faker::Name.name,
                               position: ["Dev", "Designer", "Creative", "Business Person" ].sample,
                             })
  Skill.create({team_member: member,
                years_experience: rand(4),
                education: Faker::University.name,
                education_type: ["traditional", "non-traditional"].sample,
                skill_category: choose_skill(member.position),
                skills: ["#{member.possible_skills.sample}"],
                techs: ["#{member.possible_techs.sample}"],
                tech_categories: ["#{member.possible_tech_categories.sample}"],
                characteristics: ["#{Characteristic.new.options.sample}"]
              })
end

50.times do
  project = Project.create!({name: FFaker::Product.product,
                             client: FFaker::Company.name,
                             deadline: Date.today + rand(300)})

  ProjectRequirement.create!({project: project,
                              size: %w(small medium large).sample,
                              variety: ProjectRequirement.possible_varieties.sample,
                              length: %w(short medium long).sample,
                              client_type: ProjectRequirement.possible_client_types.sample,
                              characteristics: Characteristic.new.options.sample
                             })
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "🌱 Seeding jobs..."

# Seed your database here
Admin = User.create(name: "Admin", password: "friggincoldilicious")

Job.create(title: "Junior Data Scientist", image: "https://pezesha.com/static/phone-cde0d09869a40df0d5134abc0414884f.webp", recruiter: "Pezesha", details: "python, ruby", location: "https://pezesha.com/careers/junior-data-scientist", user_id: Admin.id)
Job.create(title: "Web Engineer", recruiter: "Nala Money", image: "https://x7d4c5z5.stackpathcdn.com/wp-content/uploads/tc/2022/12/NALA-team-photo-e1671005081868-1536x864.jpg", details: "vanilla js, node.js", location: "https://nalateam.notion.site/Web-Engineer-Remote-3-Positions-d3e95236ea594c4e8a49611c55f0d255", user_id: Admin.id)
Job.create(title: "QA Engineer (Web)", recruiter: "Nala Money", image: "https://x7d4c5z5.stackpathcdn.com/wp-content/uploads/tc/2022/12/NALA-team-photo-e1671005081868-1536x864.jpg", details: "vanilla js, node.js", location: "https://nalateam.notion.site/Web-Engineer-Remote-3-Positions-d3e95236ea594c4e8a49611c55f0d255", details: "vanilla js, node.js", location: "https://nalateam.notion.site/QA-Engineer-Web-2-positions-a779bb080a3a42779b1e79ab3c994c7c", user_id: Admin.id)


puts "✅ Done seeding!"
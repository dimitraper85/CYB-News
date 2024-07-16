# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Article.destroy_all
Comment.destroy_all
Bookmark.destroy_all

u1 = User.create!(email: "dimitra@email.com", password: "123456", username: "Dimitra")
u2 = User.create!(email: "heena@email.com", password: "123456", username: "Heena")
u3 = User.create!(email: "judith@email.com", password: "123456", username: "Judith")
u4 = User.create!(email: "max@email.com", password: "123456", username: "Max")
u5 = User.create!(email: "test@email.com", password: "123456", username: "ProTester")

a1 = Article.create!(
  article_url: "https://www.washingtonpost.com/politics/2024/07/15/trump-rnc-appearance-rally-shooting/",
  title: "Trump, after assassination attempt and a string of wins, makes his entrance",
  description: "Trump’s emotional entrance to the Republican National Convention was a fitting culmination to a nearly three-week stretch during which he survived an attempt on his life — and scored crucial victories.",
  content: "MILWAUKEE — A somber Donald Trump — his right ear covered by a small white bandage — strode into the Republican National Convention on Monday evening, lightly pumping his right fist and gently waving the same hand.
    The crowd was primed for the former president. They cheered as the announcer introduced Lee Greenwood, who sings Trump’s walk-on music, “God Bless the USA,” and some stood on chairs as they craned to capture video of Trump as he entered Milwaukee’s Fiserv Forum.
    But Trump himself was uncharacteristically subdued and visibly emotional, acknowledging the crowd with waves and fist pumps and occasional thumbs up as he repeatedly mouthed “Thank you” and slowly climbed the stairs to the suite where his family and several friends stood waiting.
    There, he first shook hands with former Fox News host Tucker Carlson and Rep. Byron Donalds (R-Fla.), before clasping hands with his eldest son, Donald Trump Jr., and pointing at another son, Eric. He turned to his left to greet Sen. J.D. Vance (R-Ohio), his newly minted running mate, and House Speaker Mike Johnson (R-La.).
    Then, Trump sat, and seemed to take in the moment, glancing about the cavernous hall.
    Trump appeared before the convention crowd almost exactly 48 hours after a gunman attempted to assassinate him Saturday night at his rally in Pennsylvania, a tragedy that killed one attendee, injured two others, and left Trump safe but injured.
    Still, Trump’s emotional and highly anticipated entrance was a fitting culmination to a two-and-a-half-week stretch — starting with the first presidential debate June 27 — during which the former president scored multiple crucial victories.
    At their first debate stage faceoff, President Biden delivered a halting and politically devastating performance — shuffling onto the stage, whispering and trailing off, losing his train of thought and generally prompting a Democratic Party existential crisis over whether the occupant of the Oval Office should remain their nominee.
    Four days later, the Supreme Court ruled that presidents have “absolute” immunity for clearly official acts, a decision along ideological lines that sent Trump’s indictment for allegedly trying to subvert the 2020 election back to a lower court, postponing any decision until after November’s election.
    And on Monday, only hours before the Republican National Convention officially opened in Milwaukee, U.S. District Judge Aileen M. Cannon dismissed the classified documents case against Trump, which legal experts and many Democratic and Republican strategists had viewed as the strongest and most clear cut of the indictments Trump is facing.
    Even Trump was surprised by the case being dismissed, according to two people close to him, who, like others interviewed for this report, spoke on the condition of anonymity to describe their conversations with the nominee. Trump’s team had expected the legal fight to continue for months.",
  image_url: "https://www.washingtonpost.com/wp-apps/imrs.php?src=https%3A%2F%2Farc-anglerfish-washpost-prod-washpost.s3.amazonaws.com%2Fpublic%2F65XTR6IDLKDMXYIR7U7X65OJMA.JPG",
  pub_date: Date.new(2024,7,16),
  source_name: "Washington Post",
  category: "USA politics",
  fake_news_validation: "true"
)
a2 = Article.create!(
  article_url: "https://www.independent.co.uk/news/world/americas/us-politics/biden-interview-nbc-news-trump-b2580333.html",
  title: "Elections 2024 live: ‘Combative’ Biden refuses to debate Trump again before DNC as Pelosi ‘plots to oust him’",
  description: "President tells NBC’s Lester Holt he should not have used the word ‘bullseye’ on call to supporters about focusing on Republican rival’s policies in weeks prior to his attempted assassination in Pennsylvania",
  content: "Joe Biden struck a combative tone in his latest campaign reset interview with NBC’s Lester Holt on Monday night following his disastrous debate performance against Donald Trump last month, which led panicked Democrats to call on the president to drop out of the 2024 race.
    Biden rejected the idea he should debate Trump again before the Democratic National Convention in August but admitted it had been a “mistake” to use the word “bullseye” during a campaign call with supporters urging them to focus on Trump’s agenda just prior to the attempted assassination of the former president on Saturday.
    “It was a mistake to use the word,” Biden told Holt.
    “I didn’t say ‘crosshairs’. I said ‘bullseye.’ Focus on what he’s doing. Focus on his policies. Focus on the number of lies he told in the debate.”
    During a rally in Butler, Pennsylvania, over the weekend, the newly-confirmed Republican presidential nominee was clipped in the right ear by gunman Thomas Matthew Crooks, whose motive remains a mystery.
    Former House speaker Nancy Pelosi is meanwhile reportedly “convinced Biden will lose” in November and “working the phones” behind the scenes to plot his removal for the Democratic ticket.",
  image_url: "https://static.independent.co.uk/2024/07/15/23/Screenshot-2024-07-15-at-6.19.11%E2%80%AFPM.jpg",
  pub_date: Date.new(2024,7,16),
  source_name: "The independent",
  category: "USA politics",
  fake_news_validation: "true"
)
a3 = Article.create!(
  article_url: "https://www.independent.co.uk/news/uk/politics/starmer-labour-cabinet-kings-speech-tory-reform-latest-news-b2580355.html",
  title: "Welsh First Minister Vaughan Gething resigns after pressure from Labour ministers",
  description: "Welsh First Minister Vaughan Gething resigns after pressure from Labour ministers",
  content: "Vaughan Gething has dramatically resigned as the first minister of Wales following mounting pressure to stand down after four of his ministers quit his government in protest.
    In a statement announcing his resignation, Gething said he recognised that “rebuilding and renewal” was “not possible” under his leadership, but said allegations of wrongdoing on his part were “pernicious, politically motivated and patently untrue”.
    He came under sustained criticism in recent months for his decision to sack former minister Hannah Blythyn.
    Trump’s running mate JD Vance has sparked cross-party outrage among politicians after describing the UK as an “Islamist country” with nuclear weapons during a speech at a right-wing conference last week.
    Angela Rayner has claimed the deputy US president wannabe was wrong about the UK but she “looked forward” to meeting him and Donald Trump if he gets elected in November.
    The shocking comments have also caused anger among prominent Muslim political figures, with baroness Sayeeda Warsi accusing JD Vance of “Islamophobia” and “anti-Muslim racism”.",
  image_url: "https://static.independent.co.uk/2024/07/16/11/GettyImages-2153762573.jpg",
  pub_date: Date.new(2024,7,16),
  source_name: "The independent",
  category: "UK politics",
  fake_news_validation: "true"
)
a4 = Article.create!(
  article_url: "https://www.independent.co.uk/news/world/europe/russia-ukraine-war-putin-drones-crimea-latest-news-b2580371.html",
  title: "Ukraine-Russia war – live: Trump’s vice president pick JP Vance spells disaster for Kyiv, EU official says",
  description: "The 39-year-old Ohio senator has backed attempts for the US to end support for Ukraine",
  content: "Donald Trump’s choice for his running mate is a “disaster” for Ukraine, a senior EU official has said.
    Speaking to Politico under the condition of anonymity, the official’s comments reflected the bleak future in store for US-Ukraine support with JP Vance as the new candidate for vice president.
    The 39-year-old Ohio senator has backed attempts by the US Republican Party to end support for Ukraine in the war against Russia since the invasion began.
    In a speech at the National Conservatism conference, he criticised the decision to send Ukraine “hundreds of billions of dollars of weaponry with no obvious end in sight and no obvious conclusion or even objective that we are close to getting accomplished”.
    On the war front, Ukraine said Vladimir Putin has withdrawn the last Russian naval patrol ship from its base in Crimea- a victory for Kyiv’s sustained campaign against Moscow’s naval infrastructure on the occupied peninsula.
    “The last patrol ship of the Black Sea Fleet of the Russian Federation is bolting from our Crimea just now. Remember this day,” Navy spokesman Dmytro Pletenchuk said.",
  image_url: "https://static.independent.co.uk/2024/07/01/07/SEI211131734.jpg",
  pub_date: Date.new(2024,7,16),
  source_name: "The independent",
  category: "Europe",
  fake_news_validation: "true"
)
a5 = Article.create!(
  article_url: "https://www.independent.co.uk/news/world/europe/european-parliament-president-election-live-b2580444.html",
  title: "Watch live: New European Parliament president elected",
  description: "It comes as the new Parliament is set to vote in a secret ballot whether to approve Ursula von der Leyen as the European Council's chosen candidate for President of the European Commission.",
  content: "Watch live as the European Parliament meets to elect its president and vice-presidents at a plenary session in Strasbourg on Tuesday, 16 July.
  The current president is Maltese MEP Roberta Metsola, who has been predicted to secure a second term unchallenged.
  Though Spain's Irene Montero is also standing, her bid for election is symbolic and unlikely to disrupt Ms Metsola's re-election.
  Ms Metsola is the youngest person to have been elected to the position at 43 years old; she took over in 2022 after former president David Sassoli died.
  She is the first Maltese person and the first woman in two decades to take on the role.",
  image_url: "https://static.independent.co.uk/2023/04/18/13/France_EU_38740.jpg",
  pub_date: Date.new(2024,7,16),
  source_name: "The independent",
  category: "Europe",
  fake_news_validation: "true"
)

Comment.create!(user_id: u1.id, article_id: a1.id, content: "I am really surprised that this is not a fake news ! Good to know.")
Comment.create!(user_id: u1.id, article_id: a2.id, content: "It is a disaster how this has been handled. I hope solution will be found")
Comment.create!(user_id: u2.id, article_id: a1.id, content: "All these shootings ! I couldn't believe first. I straight went here to fact check !")

Bookmark.create!(user_id: u3.id, article_id: a4.id)
Bookmark.create!(user_id: u3.id, article_id: a3.id)
Bookmark.create!(user_id: u1.id, article_id: a2.id)

puts "seeding successful"

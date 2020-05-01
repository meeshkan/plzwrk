{-# LANGUAGE OverloadedStrings #-}
module Nouns(abstract, concrete) where

import Data.Text

abstract =
  [ "Aberration"
  , "Ability"
  , "Absurdity"
  , "Achievement"
  , "Action"
  , "Adoration"
  , "Adventure"
  , "Advice"
  , "Agitation"
  , "Agony"
  , "Alacrity"
  , "Amazement"
  , "Anger"
  , "Anguish"
  , "Annoyance"
  , "Anonymity"
  , "Anxiety"
  , "Apathy"
  , "Appearance"
  , "Appetite"
  , "Apprehension"
  , "Apprenticeship"
  , "Argument"
  , "Arrogance"
  , "Artistry"
  , "Attributes"
  , "Audacity"
  , "Awareness"
  , "Awe"
  , "Beauty"
  , "Behavior"
  , "Being"
  , "Boredom"
  , "Bravery"
  , "Breadth"
  , "Brilliance"
  , "Brittleness"
  , "Brotherhood"
  , "Brutality"
  , "Buoyancy"
  , "Calm"
  , "Candor"
  , "Care"
  , "Chaos"
  , "Charisma"
  , "Charity"
  , "Charm"
  , "Childhood"
  , "Clarity"
  , "Cleverness"
  , "Cohesion"
  , "Coldness"
  , "Comfort"
  , "Communication"
  , "Company"
  , "Compassion"
  , "Complexity"
  , "Conceit"
  , "Concept"
  , "Confidence"
  , "Conflict"
  , "Conformity"
  , "Confusion"
  , "Consciousness"
  , "Consideration"
  , "Contentment"
  , "Control"
  , "Courage"
  , "Cowardice"
  , "Crime"
  , "Criticism"
  , "Crudeness"
  , "Culmination"
  , "Culture"
  , "Cupidity"
  , "Curiosity"
  , "Customer"
  , "Dawn"
  , "Day"
  , "Death"
  , "Decade"
  , "Deceit"
  , "Deception"
  , "Dedication"
  , "Deed"
  , "Defeat"
  , "Defiance"
  , "Delay"
  , "Delight"
  , "Demarcation"
  , "Demeanor"
  , "Democracy"
  , "Depth"
  , "Desolation"
  , "Despair"
  , "Determination"
  , "Detriment"
  , "Deviousness"
  , "Dexterity"
  , "Dichotomy"
  , "Dictatorship"
  , "Difference"
  , "Difficulty"
  , "Disappointment"
  , "Disbelief"
  , "Discord"
  , "Discordance"
  , "Discouragement"
  , "Dishonesty"
  , "Disposition"
  , "Disquiet"
  , "Disregard"
  , "Dissension"
  , "Disturbance"
  , "Divorce"
  , "Dream"
  , "Dreams"
  , "Drudge"
  , "Durability"
  , "Eccentricity"
  , "Education"
  , "Effrontery"
  , "Ego"
  , "Egotism"
  , "Elation"
  , "Eleganceemotions"
  , "Employment"
  , "Energy"
  , "Enhancement"
  , "Ennui"
  , "Enthusiasm"
  , "Envy"
  , "Era"
  , "Euphoria"
  , "Evening"
  , "Event"
  , "Evil"
  , "Excitement"
  , "Exhilaration"
  , "Exuberance"
  , "Fact"
  , "Failure"
  , "Faith"
  , "Faithfulness"
  , "Faithless"
  , "Fallacy"
  , "Fascination"
  , "Fashion"
  , "Fastidiousness"
  , "Favoritism"
  , "Fear"
  , "Feelings"
  , "Fiction"
  , "Forgiveness"
  , "Fortitude"
  , "Fragile"
  , "Fragility"
  , "Frailty"
  , "Freedom"
  , "Friendships"
  , "Frugality"
  , "Future"
  , "Gain"
  , "Gall"
  , "Generation"
  , "Generosity"
  , "Genius"
  , "Goal"
  , "Goodness"
  , "Gossip"
  , "Grace"
  , "Gracious"
  , "Graciousness"
  , "Greatness"
  , "Grief"
  , "Growth"
  , "Gullibility"
  , "Happiness"
  , "Hate"
  , "Hatred"
  , "Health"
  , "Hearsay"
  , "Help"
  , "Helpful"
  , "Helpfulness"
  , "Helplessness"
  , "Holiday"
  , "Homelessness"
  , "Honesty"
  , "Honor"
  , "Honour"
  , "Hope"
  , "Horror"
  , "Hospitality"
  , "Hostility"
  , "Hubris"
  , "Humility"
  , "Humor"
  , "Hunger"
  , "Hurt"
  , "Hypothesis"
  , "Idea"
  , "Idealsideas"
  , "Idiosyncrasy"
  , "Imagination"
  , "Impertinence"
  , "Impression"
  , "Improvement"
  , "Impudence"
  , "Inaccuracy"
  , "Indifference"
  , "Infancy"
  , "Infatuation"
  , "Inflation"
  , "Information"
  , "Insanity"
  , "Insensitivity"
  , "Integrity"
  , "Intelligence"
  , "Interest"
  , "Intrepidity"
  , "Invalidity"
  , "Investment"
  , "Invincibility"
  , "Invitation"
  , "Irritation"
  , "Jealousy"
  , "Joy"
  , "Jubilation"
  , "Judgement"
  , "Justice"
  , "Justification"
  , "Kindness"
  , "Kingship"
  , "Knack"
  , "Knell"
  , "Knowledge"
  , "Laughter"
  , "Lavishness"
  , "Law"
  , "Leadership"
  , "Leer"
  , "Legitimacy"
  , "Leisure"
  , "Length"
  , "Liberty"
  , "Lie"
  , "Life"
  , "Listlessness"
  , "Loneliness"
  , "Loss"
  , "Love"
  , "Loyalty"
  , "Luck"
  , "Luxury"
  , "Malice"
  , "Maliciousness"
  , "Malignity"
  , "Manhood"
  , "Marriage"
  , "Martyrdom"
  , "Maturity"
  , "Meekness"
  , "Membership"
  , "Memory"
  , "Mercy"
  , "Meticulousness"
  , "Mien"
  , "Minute"
  , "Misery"
  , "Modesty"
  , "Modicum"
  , "Moment"
  , "Monotony"
  , "Month"
  , "Morning"
  , "Mortification"
  , "Motivation"
  , "Movement"
  , "Movement"
  , "Music"
  , "Myriad"
  , "Nadir"
  , "Naivete"
  , "Nap"
  , "Narcissism"
  , "Nausea"
  , "Need"
  , "Negativity"
  , "Nervousness"
  , ""
  , "Newness"
  , "Nonconformity"
  , "Normalcy"
  , "Nouns"
  , "Nuance"
  , "Obnoxiousness"
  , "Occasion"
  , "Omen"
  , "Openness"
  , "Opinion"
  , "Opportunism"
  , "Opportunity"
  , "Optimism"
  , "Pain"
  , "Panacea"
  , "Parenthood"
  , "Parsimony"
  , "Particularity"
  , "Passiveness"
  , "Past"
  , "Patience"
  , "Patriotism"
  , "Peace"
  , "Peculiar"
  , "Peculiarity"
  , "Penchant"
  , "Permanence"
  , "Permission"
  , "Perseverance"
  , "Perusal"
  , "Pessimism"
  , "Philosophy"
  , "Placidity"
  , "Pleasure"
  , "Plethora"
  , "Positivity"
  , "Poverty"
  , "Power"
  , "Precision"
  , "Predilection"
  , "Preeminence"
  , "Pride"
  , "Principle"
  , "Progress"
  , "Prominence"
  , "Prosperity"
  , "Rage"
  , "Reality"
  , "Reason"
  , "Redemption"
  , "Refreshment"
  , "Refusal"
  , "Refutation"
  , "Relaxation"
  , "Relief"
  , "Religion"
  , "Reminiscence"
  , "Repercussion"
  , "Replacement"
  , "Repulsiveness"
  , "Resiliency"
  , "Restoration"
  , "Retirement"
  , "Rhythm"
  , "Riches"
  , "Right"
  , "Romance"
  , "Rumor"
  , "Rumour"
  , "Ruthlessness"
  , "Sacrifice"
  , "Sadness"
  , "Sale"
  , "Sanity"
  , "Satisfaction"
  , "Scholarship"
  , "Scrupulousness"
  , "Security"
  , "Self"
  , "Sensitivity"
  , "Serendipity"
  , "Serenity"
  , "Service"
  , "Shock"
  , "Silliness"
  , "Sincerity"
  , "Situation"
  , "Skill"
  , "Slave"
  , "Slavery"
  , "Sleep"
  , "Solace"
  , "Solitude"
  , "Sophistication"
  , "Sorrow"
  , "Sparkle"
  , "Speculation"
  , "Speech"
  , "Speed"
  , "Spitefulness"
  , "Squandering"
  , "Stance"
  , "Stardom"
  , "States"
  , "States"
  , "Stinginess"
  , "Strength"
  , "Stress"
  , "Strict"
  , "Strictness"
  , "Strife"
  , "Stupidity"
  , "Submission"
  , "Success"
  , "Suffering"
  , "Surprise"
  , "Susceptibleness"
  , "Sympathy"
  , "Talent"
  , "Tediousness"
  , "Tedium"
  , "Tender"
  , "Testimony"
  , "Thirst"
  , "Thoroughness"
  , "Thought"
  , "Thrill"
  , "Time"
  , "Timidness"
  , "Timing"
  , "Tired"
  , "Tiredness"
  , "Tolerance"
  , "Torment"
  , "Tranquility"
  , "Treachery"
  , "Treatment"
  , "Trend"
  , "Trouble"
  , "Trust"
  , "Truth"
  , "Turbulence"
  , "Turmoil"
  , "Ubiquity"
  , "Ugliness"
  , "Umbrage"
  , "Uncertainty"
  , "Uncouthness"
  , "Unease"
  , "Unemployment"
  , "Union"
  , "Uniqueness"
  , "Unreality"
  , "Utility"
  , "Vanity"
  , "Viciousness"
  , "Victory"
  , "Vulnerability"
  , "Wariness"
  , "Warmth"
  , "Wary"
  , "Weakness"
  , "Wealth"
  , "Weariness"
  , "Week"
  , "Width"
  , "Wisdom"
  , "Wit"
  ] :: [Text]

concrete =
  [ "whisker"
  , "paw"
  , "mammoth"
  , "spider"
  , "moth"
  , "bug"
  , "bat"
  , "vulture"
  , "owl"
  , "turtle"
  , "worm"
  , "earthworm"
  , "toad"
  , "porcupine"
  , "armadillo"
  , "rat"
  , "squirrel"
  , "hedgehog"
  , "chipmunk"
  , "gerbil"
  , "hamster"
  , "mouse"
  , "mole"
  , "anteater"
  , "platypus"
  , "cow"
  , "oxen"
  , "cattle"
  , "sheep"
  , "lamb"
  , "ram"
  , "goat"
  , "kid"
  , "pig"
  , "hog"
  , "shoat"
  , "sow"
  , "fox"
  , "vixen"
  , "lemur"
  , "raccoon"
  , "weasel monkey"
  , "ape"
  , "chimpanzee"
  , "orangutan"
  , "baboon"
  , "pony"
  , "pinto"
  , "mare"
  , "filly"
  , "gelding"
  , "bronco"
  , "colt"
  , "stallion"
  , "donkey"
  , "zebra"
  , "mule"
  , "camel"
  , "dromedary"
  , "gazelle"
  , "tom"
  , "bird"
  , "goose"
  , "duck"
  , "drake"
  , "gander"
  , "turkey"
  , "songbird"
  , "lark"
  , "nightingale"
  , "wren"
  , "eagle"
  , "hawk"
  , "kitten"
  , "chick"
  , "rooster"
  , "hen"
  , "crow"
  , "raven"
  , "cat"
  , "kitten"
  , "mutt"
  , "wolf"
  , "cub"
  , "tiger"
  , "lion"
  , "elephant"
  , "cheetah"
  , "puma"
  , "jackal"
  , "jaguar"
  , "ocelot"
  , "rhinoceros"
  , "alpaca"
  , "antelope"
  , "deer"
  , "doe"
  , "fawn"
  , "stag"
  , "kangaroo"
  , "joey"
  , "koala"
  , "sloth"
  , "wombat"
  , "bear"
  , "hyena"
  , "crocodile"
  , "snake"
  , "giraffe"
  , "whale"
  , "shark"
  , "dolphin"
  , "seal"
  , "bed"
  , "hammock"
  , "hassock"
  , "mirror"
  , "hutch"
  , "locker"
  , "painting"
  , "chalice"
  , "cage"
  , "urn"
  , "bow"
  , "sword"
  , "dart"
  , "dagger"
  , "hatchet"
  , "candle"
  , "mop"
  , "pail"
  , "pipe"
  , "brush"
  , "easel"
  , "gun"
  , "rope"
  , "balloon"
  , "vase"
  , "typewriter"
  , "stylus"
  , "pencil"
  , "desk"
  , "backpack"
  , "saddle"
  , "cash machine pot"
  , "plate"
  , "dish"
  , "fork"
  , "spoon"
  , "samovar"
  , "monsoon"
  , "hurricane"
  , "typhoon"
  , "rain"
  , "storm"
  , "hail"
  , "blizzard"
  , "breeze"
  , "whirlwind"
  , "maelstrom"
  , "dust storm"
  , "cloudburst"
  , "tornado"
  , "twister"
  , "cloud"
  , "flood"
  , "aftershock"
  , "tremor"
  , "earthquake"
  , "lightning avalanche"
  , "eclipse"
  , "meteor shower"
  , "thunderbolt"
  , "tsunami"
  ] :: [Text]

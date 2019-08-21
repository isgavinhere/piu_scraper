#PIUSCRAPER
#Script to scrape the EXP and TOTAL SCORE leaderboards on the pump it up website.
#Gavin Su
#me@gavin.su
#2019

#pull source from website
webpageExp = readLines("http://www.piugame.com/piu.xx/leaderboard/xx_exp_rank.php")
webpageScore = readLines("http://www.piugame.com/piu.xx/leaderboard/xx_total_rank.php")
#ignore the error about the incomplete final line, there's no newline at the end
#hence why it's giving that error

#some bad regex
#rankExpRegex = '*rank_out*'
countryRegex = '*chart_country*'
levelRegex = '*chart_lv m_lv"*'
nameRegex = '*chart_id*'
scoreRegex = '*chart_score*'

#grep dat
#rankExpRaw = grep(rankExpRegex, webpageExp, value=TRUE)
countryExpRaw = grep(countryRegex, webpageExp, value=TRUE)
levelExpRaw = grep(levelRegex, webpageExp, value=TRUE)
nameExpRaw = grep(nameRegex, webpageExp, value=TRUE)
scoreExpRaw = grep(scoreRegex, webpageExp, value=TRUE)

countryScoreRaw = grep(countryRegex, webpageScore, value=TRUE)
levelScoreRaw = grep(levelRegex, webpageScore, value=TRUE)
nameScoreRaw = grep(nameRegex, webpageScore, value=TRUE)
scoreScoreRaw = grep(scoreRegex, webpageScore, value=TRUE)


#clean up data with more regex
clearTags = "^[^>]*>|<.*"

#rankExp = gsub(clearTags, "", rankExpRaw)
countryExp = gsub("[^0-9]", "", countryExpRaw)
levelExp = gsub("[^0-9]", "", levelExpRaw)
nameExp = gsub(clearTags, "", nameExpRaw)
scoreExp = gsub("[^0-9]", "", scoreExpRaw)

countryScore = gsub("[^0-9]", "", countryScoreRaw)
levelScore = gsub("[^0-9]", "", levelScoreRaw)
nameScore = gsub(clearTags, "", nameScoreRaw)
scoreScore = gsub("[^0-9]", "", scoreScoreRaw)



piuExp1000.df = data.frame(countryExp,as.numeric(levelExp),nameExp,as.numeric(scoreExp), stringsAsFactors=FALSE)
colnames(piuExp1000.df) = c("country", "level", "name", "exp")

piuScore1000.df = data.frame(countryScore,as.numeric(levelScore),nameScore,as.numeric(scoreScore), stringsAsFactors=FALSE)
colnames(piuScore1000.df) = c("country", "level", "name", "total_score")


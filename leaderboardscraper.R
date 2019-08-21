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
countryExpRegex = '*chart_country*'
levelExpRegex = '*chart_lv m_lv"*'
nameExpRegex = '*chart_id*'
scoreExpRegex = '*chart_score exp*'

#grep dat
#rankExpRaw = grep(rankExpRegex, webpageExp, value=TRUE)
countryExpRaw = grep(countryExpRegex, webpageExp, value=TRUE)
levelExpRaw = grep(levelExpRegex, webpageExp, value=TRUE)
nameExpRaw = grep(nameExpRegex, webpageExp, value=TRUE)
scoreExpRaw = grep(scoreExpRegex, webpageExp, value=TRUE)

#clean up data with more regex
clearTags = "^[^>]*>|<.*"

#rankExp = gsub(clearTags, "", rankExpRaw)
countryExp = gsub("[^0-9]", "", countryExpRaw)
levelExp = gsub("[^0-9]", "", levelExpRaw)
nameExp = gsub(clearTags, "", nameExpRaw)
scoreExp = gsub("[^0-9]", "", scoreExpRaw)


piuExp1000.df = data.frame(countryExp,as.numeric(levelExp),nameExp,as.numeric(scoreExp), stringsAsFactors=FALSE)

colnames(piuExp1000.df) = c("country", "level", "name", "exp")



download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearD")
gapminder <- read.csv("gapminder-FiveYearData.csv")
head(gapminder)
colnames(gapminder)
str(gapminder)
nrow(gapminder)
ncol(gapminder)
dim(gapminder)
summary(gapminder)

##These are codes you typically always want to run to check out your data and makes sure you don't see anything "funky"
#head(gapminder)
#str(gapminder)
#colnames()
#summary()
#nrow()
#ncol
#View()
#gapminder[row,column]

#in 2007 what was the life expectancy of countries in Africa?


# African countries' life expectancies for 2007

# step 1: get 2007 data
is_2007 <- gapminder$year == "2007"

#step 2: get Africa data
is_Africa <- gapminder$continent == Africa

#step 3: pull 2007 & Africa from gapminder
africa_2007 <- gapminder[is_2007 & is_Africa,c("country","lifeExp")]

#step 4: look at the 2007 life expectancy data from Africs
africa_2007


#aes means asthetic, the look of the plot 
##creating a plot where percap is on the x axis and life expectancy is on the y axix
###geom_point() just means that the data will be plotted as a geometric shape (this will be a dot because it says "point")
ggplot(data=gapminder, aes(x= gdpPercap, y=lifeExp)) + geom_point()

#creating a plot where percap is on the x axis and life expectancy is on the y axix
##geom_point() just means that the data will be plotted as a geometric shape (like a dot)
###Here we added color to our code, each continent is a different color
ggplot(data=gapminder, aes(x= gdpPercap, y=lifeExp, color=continent)) + geom_point()




# creating a plot where percap is on the x axis and life expectancy is on the y axix
##geom_point() just means that the data will be plotted as a geometric shape (like a dot)
###geom_line() means the data will also be plotted as a line
###Here we added color to our code, each continent is a different color, lines are black, and the data are plotted as dots
ggplot(data=gapminder, aes(x= gdpPercap, y=lifeExp, color=continent)) + geom_line(color="black") + geom_point(aes(size=gdpPercap))

#life by gdp, color by continent, size by popylation size
ggplot(data=gapminder, aes(x= gdpPercap, y=lifeExp, color=continent)) + geom_point(aes(size=pop))

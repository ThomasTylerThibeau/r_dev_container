# nfl = read.csv(file.choose(), header = TRUE)
# Shipping = read.csv(file.choose(), header = TRUE)
# Person = read.csv(file.choose(), header = TRUE)
# Parent = read.csv(file.choose(), header = TRUE)
# Spouse = read.csv(file.choose(), header = TRUE)
# Large = read.csv(file.choose(), header = TRUE)
# Government = read.csv(file.choose(), header = TRUE)
# TicketToRide = read.csv(file.choose(), header = TRUE)

query ="
select city, team, w , l
FROM nfl
where w between 7 and 9
"

sqldf(query)

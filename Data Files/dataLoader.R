# nfl = read.csv(file.choose(), header = TRUE)
# Shipping = read.csv(file.choose(), header = TRUE)
# Person = read.csv(file.choose(), header = TRUE)
# Parent = read.csv(file.choose(), header = TRUE)
# Spouse = read.csv(file.choose(), header = TRUE)
# Large = read.csv(file.choose(), header = TRUE)
# Government = read.csv(file.c//hoose(), header = TRUE)
# TicketToRide = read.csv(file.choose(), header = TRUE)
#"Select Fname, Lname#From Shipping#Where Mname != ''#And#Weight In#(Select Weight#From Shipping#Where Weight > 100000)"
## surface area
#sa = "2 * Height * Width + 2 * Length * Width * 2 * Height * Length"
## volume
#v = "Height * Length * Width"
## density
#d = "Mass / Volume"

query =
"
SELECT Distinct Parent1.Parent, Parent2.Parent

From Parent as Parent1
Inner Join
Parent as Parent2
On (Parent1.Person = Parent2.Person)
Inner Join
Person as Person1
On
(Parent1.Parent = Person1.Person)
Inner Join Person as Person2
On
(Parent2.Parent = Person2.Person)

Where Parent1.Parent != Parent2.Parent
And
Person1.Sex = 'F'
And
Person2.Sex = 'M'
"

sqldf(query)

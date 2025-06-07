## confusing as fuck


query =
  "
SELECT Distinct Person1.Name, Person2.Name

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

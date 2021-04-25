#Comment
# single line use #
# multiline use '''
#1) string -
    # Include any charachter. Can be alpha...can be numberic....can be special character.
    # It's value should be in quotes. Quotes can be single ....can be double...depend upon you.
name = "NileshN"
emp_code = "C302"
symbol = "-->"
essay="This is very odd to write essay on programming, but its true that there are lot of idiots who do this."
print(name)
print(emp_code)
print(symbol)
print(essay)

#Type function to check what datatype is it.
print(type(essay))

#String format
print("He went crazy after seeing {} and tring to {} it at {} pm in {}.".format("smart car","buy",5,"showroom"))
print("He went crazy after seeing %s and tring to %s her at %i pm in %s." % ("beautiful girl","flirt",5,"in my office"))

#use of index
print(essay[0])
print(essay[1])
print(essay[0:2])    # start index number and stop index number, stop index number char will not print
print(essay[0:20:3]) # third number is step, those character (step number -1 ) will get skip, so if step number is 5 it will skip 4 char.
print(essay[::-1])  # this will write string in reverse format.

#use of upper and lower function
print(name.upper())
print(name.lower())

#use of find
print(name.find('z')) #if string not found it will print -1
print(name.find('n')) # note find function is case sensetive
print(name.find('N'))   #find will print index number
name_f="NileshN"
print(name_f.find('N'))   #find will print index number of first search only

#use of count
print(essay.count('i'))

#use of strip
statement="   This is a game   "
statstrip = statement.strip()    # strip by default remove spaces from begining and ending of the string
print(statement)
print(statstrip)
statstrip_new=statstrip.strip('This is')
print(statstrip_new)

#use of len function
print(len(essay))

#2) integer -
    # Include only complete numbers. like 2, 45, 103, 205 but not 3.14 or 789.23
    # It's value should not be in quotes.

age = 30
emp_cell_no = 7738003350
print(age)
print(emp_cell_no)

fname='nilesh'
sname='indore'
i=10
d=20
print(i+d)  #integer
print(fname+sname)  #string concanate
# Note - rest of mathamatical operation can not be done with string data type.
print(d-i)
print(i-d)
print(d/i)
print(int(d/i))
print(d%i)

#3) float -
    # Include incomplete number like 3.14, 456.34
    # it's value should not be in quotes.
height = 6.5
weight = 63.75
print(height)
print(weight)

#4) list -
    #As name indicate it is collection of multiple values.
    #It is just like ARRAY....
    #It contain any type of data....string...integer...float...any type...even list inside list....
    #It should be inside square bracket "[]"
list1 = ["Nilesh","Manisha","Mayura",3.14,2034]
list2 = ["Python","Java",list1,45.56,20010]
print(list1)
print(list2)

devops_modules = ['yml','json','python','ansible']
adv_module = ['jenkins','docker']
print(devops_modules)
print(adv_module)

#use append function
devops_modules.append("kubernetes")     #append can only take one argument.
print(devops_modules)

#use insert function
devops_modules.insert(5,"terraform")
print(devops_modules)

#use extend function
devops_modules.extend(adv_module)
print(devops_modules)

#use remove function
devops_modules.remove("kubernetes")
print(devops_modules)

#use of index positioning with list
print(devops_modules[2])
print(devops_modules[2:5])
print(devops_modules[1:5:2])    #remember last position doesn't consider, and it will skip 1 position.

#use of range function
print(list(range(10)))
print(list(range(3,10)))
print(list(range(2,10,2)))

#overwrite value
devops_modules[1]="bash"
print(devops_modules)

#5) tuple -
    #It is same as list, but in list you can change values if you want, in tuple once value defined can not be changed.
    #It is defined inside round bracket "()" but can be defined without round bracket also but need to be used comma "," between 2 values/items.
t1 = ("Nilesh","Mayura",34,67.12)
t2 = 'a','b','c','d','a'
print(t1)
print(t2)

#get index position of particualr item
print(t1.index("Mayura"))

#get total count of particular item
print(t2.count('a'))

print(t2[1])
#t2[1]='z'  #You can't change value in tuple.

#6) set -
    #It is also same as list, but it is unordered and unindexed. So everytime order of set is random.
    #once created, you can not change item but you can add items
    #It prints only unique values, if there is any duplicate value in set it will print only once.
    #It is define inside curly braces. "{}"
s1 = {"Nilesh","Mayura","Manisha","Nirmala",45,234.78,"Arnav","Nilesh"}
s2 = {"Ananya","Aish"}
print(s1)
print(s2)

#add item in set
s1.add("Santosh")
print(s1)

#update set
s1.update(s2)    
print(s1)

#pop fuction will remove any random number from set
s1.pop()
print(s1)

#remove function with set
s1.remove("Arnav")
print(s1)

#7) dictionary -
    #It is also same as list, but every item is pair of "key=value".
    #It is define inside curly braces. "{}"
    #Value can be any datatype.
    #Key should be in quotes, values also should be in quotes if it is string.
d1 = {'name':"Nilesh",'age':35,'add' : "Kalwa" , 'work': "Engg" }
print(d1)

#get value of particular key
print(d1.get("age"))


#overwrite value
print(d1['name'])
d1["name"] = "Arnav"
print(d1['name'])

#udpate funtion with dict
d2={'hobby' : 'Travel'}
d3={'add' : 'Thane'}
d1.update(d2)   #if key is new it will add in dict
print(d1)
d1.update(d3)   #if key is already exist it will udpate dict
print(d1)

#pop fucntion with dict
d1.pop('name')
print(d1)

#to check what items inside dict
print(d1.items())

#get all keys from dict
print(d1.keys())
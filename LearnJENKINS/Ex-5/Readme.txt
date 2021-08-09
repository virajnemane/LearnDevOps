#
#   This exercise will help you to give access to user on ROLE basis.
#

1) Create user named as "devuser" and "qauser"
    Go to Jenkins Dashboard --> Manage Jenkins --> Manage users --> Create user
2) Go to Jenkins Dashboard --> Manage Jenkins --> Manage Plugins --> Availabel --> search "role"
3) Select "Role-based Authorization Strategy" and click on "Install without restart"
4) Go to Jenkins Dashboard --> Manage Jenkins --> Configure Global Security --> in Authorization section select "Role-Based Strategy"
5) Go to Jenkins Dashboard --> Manage Jenkins --> Manage & Assign Roles --> Manage Roles
6) Roles to add --> type "DEV" in textbox --> click on Add
7) You will see DEV role get created.
8) Now type QA in textbox and click on Add to create QA role.
9) We will give below permission to DEV and QA role.
    #DEV role --> give full permission
    #QA role --> Overall=read, JOB=build,cancel,read,workspace, VIEW=read
10) 5) Go to Jenkins Dashboard --> Manage Jenkins --> Manage & Assign Roles --> Assign Roles
11) You need to add devuser and qauser with the help of "User/group to add" option.
12) And then assign DEV role to devuser and QA role to qauser.
13) Click on Apply and Save.
14) Logout and login with devuser, you will find devuser have all access.
15) Logout from devuser and login with qauser, you will find qauser have limited access.
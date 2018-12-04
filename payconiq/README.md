# Payconiq

##Getting Started :

    - Just open the project in Xcode 10.1 and hit play
    
##Modules :

    List Transaction Screen consists of 
    1) Transactions details like description, amount 
    2) It displays a snapshot of coordinates of the given coordinate using MKSnaphot. Since all the coordinate 
        points to somehwere in Indian Ocean, It just shows a snapshot of sea.
    3) We can filter transactions based on deposit or debit.
    4) You can tap on transaction to see transacted date and effective date.
    5) Expanded view also give a button to open map in Modal view, if the user wanted to know more about the location
    
    User Detail Screen consists of displaying user details in user tab.

##Unit Testing 

    1) Business logic for transation list has been written which includes
        - testing filter options 
        - service request for transation
        - test total balance calculated
    2)User details service request is unit tested. 

##UI Testing

    1)UI Testing for -
        - Testing segment tap changes the selected value
        - Taping on list, expands its view
        - Tapping on open map, open map
        - Tapping on user tab navigates to User tab
        
### Testing coverage of 80%

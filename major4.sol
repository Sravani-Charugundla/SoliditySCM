//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Major {

    struct Order { 
        string reqId;
        string itemName;
        string quantity;
        string unitID;
        string divisionID;
        string status;
        string timestamp;
    }
    
    struct DivisionToUnit {
        string reqId;
        string itemName;
        string quantity;
        string unitID;
        string divisionID;
        string status;
        string timestamp;
    }
    
    struct UnitAcceptance {
        string reqId;
        string itemName;
        string quantity;
        string unitID;
        string divisionID;
        string status;
        string timestamp;
    }
    
    struct OrderToASC {
        string reqId;
        string itemName;
        string quantity;
        string unitID;
        string divisionID;
        string status;
        string timestamp;
    }
    struct ASCToDivision{
        string reqId;
        string itemName;
        string quantity;
        string unitID;
        string divisionID;
        string status;
        string timestamp;
    }
    
    
    Order[] public orders;
    DivisionToUnit[] public divisionToUnit;
    UnitAcceptance[] public unitAcceptance;
    OrderToASC[] public orderToASC;
    ASCToDivision[] public ascToDivision;

    function save(string[][] memory order) public {
        for (uint i = 0; i < order.length; i++) { 
            require(order[i].length == 7, "Invalid pair length");
            orders.push(Order(order[i][0],
             order[i][1],
             order[i][2],
             order[i][3]
            ,order[i][4],
            order[i][5],
            order[i][6]));
        }
    }
    
    function display1DArray() public view returns (Order[] memory) {
        return orders;
    }

    function dtu(string[][] memory divisions) public {
        for (uint i = 0; i < divisions.length; i++) {
            require(divisions[i].length == 7, "Invalid division length");
            divisionToUnit.push(DivisionToUnit(
                 divisions[i][0],
                divisions[i][1],
                divisions[i][2],
                divisions[i][3],
                divisions[i][4],
                divisions[i][5],
                divisions[i][6]
            ));
        }
    }
    
    function d_tu() public view returns (DivisionToUnit[] memory) {
        return divisionToUnit;
    }
    
    function acptbyUnits(string[][] memory acceptance) public {
        for (uint i = 0; i < acceptance.length; i++) {
            require(acceptance[i].length == 7, "Invalid acceptance length");
            unitAcceptance.push(UnitAcceptance(acceptance[i][0], 
                                                acceptance[i][1],
                                                acceptance[i][2],
                                                acceptance[i][3],
                                                acceptance[i][4],
                                                acceptance[i][5],
                                                acceptance[i][6]));
        }
    }
    
    function showacceptedbyunits() public view returns (UnitAcceptance[] memory) {
        return unitAcceptance;
    }
    
    function  toAsc(string[][] memory ordersToASC) public {
        for (uint i = 0; i < ordersToASC.length; i++) {
            require(ordersToASC[i].length == 7, "Invalid order to ASC length");
            orderToASC.push(OrderToASC(ordersToASC[i][0], 
            ordersToASC[i][1], 
            ordersToASC[i][2],
            ordersToASC[i][3],
            ordersToASC[i][4],
            ordersToASC[i][5],
            ordersToASC[i][6]
            ));
        }
    }
    
    function showtoasc() public view returns (OrderToASC[] memory) {
        return orderToASC;
    }

    function AscToDiv(string[][] memory AtoD ) public{
        for(uint i = 0;i<AtoD.length;i++)
        {
            require(AtoD[i].length==7,"Invalid length");
            ascToDivision.push(ASCToDivision(
                AtoD[i][0],
                AtoD[i][1],
                AtoD[i][2],
                AtoD[i][3],
                AtoD[i][4],
                AtoD[i][5],
                AtoD[i][6]
            ));

        }
    }

    function AscToD() public view returns(ASCToDivision[] memory)
    {
        return ascToDivision;
    }
}

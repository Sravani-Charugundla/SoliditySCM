// SPDX-License-Identifier: GPL-3.0
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

    Order[] public orders;
    DivisionToUnit[] public divisionToUnit;

    function save(string[][] memory order) public {
        for (uint256 i = 0; i < order.length; i++) {
            require(order[i].length == 7, "Invalid pair length");
            orders.push(
                Order(
                    order[i][0],
                    order[i][1],
                    order[i][2],
                    order[i][3],
                    order[i][4],
                    order[i][5],
                    order[i][6]
                )
            );
        }
    }

    function display1DArray() public view returns (Order[] memory) {
        return orders;
    }

    function acptorders(string[][] memory acceptedOrders) public {
        for (uint256 i = 0; i < acceptedOrders.length; i++) {
            require(acceptedOrders[i].length == 7, "Invalid order length");
            removeAcceptedOrder(acceptedOrders[i][0]);
            orders.push(
                Order(
                    acceptedOrders[i][0],
                    acceptedOrders[i][1],
                    acceptedOrders[i][2],
                    acceptedOrders[i][3],
                    acceptedOrders[i][4],
                    acceptedOrders[i][5],
                    acceptedOrders[i][6]
                )
            );
        }
    }

    function acpt_displayord() public view returns (Order[] memory) {
        return orders;
    }

    function dtu(string[][] memory divisions) public {
        for (uint256 i = 0; i < divisions.length; i++) {
            require(divisions[i].length == 7, "Invalid division length");
            divisionToUnit.push(
                DivisionToUnit(
                    divisions[i][0],
                    divisions[i][1],
                    divisions[i][2],
                    divisions[i][3],
                    divisions[i][4],
                    divisions[i][5],
                    divisions[i][6]
                )
            );
        }
    }

    function d_tu() public view returns (DivisionToUnit[] memory) {
        return divisionToUnit;
    }

    function removeAcceptedOrder(string memory reqId) internal {
        for (uint256 i = 0; i < orders.length; i++) {
            if (compareStrings(orders[i].reqId, reqId)) {
                orders[i] = orders[orders.length - 1];
                orders.pop();
                break;
            }
        }

        for (uint256 i = 0; i < divisionToUnit.length; i++) {
            if (compareStrings(divisionToUnit[i].reqId, reqId)) {
                divisionToUnit[i] = divisionToUnit[divisionToUnit.length - 1];
                divisionToUnit.pop();
                break;
            }
        }
    }

    function compareStrings(string memory a, string memory b)
        internal
        pure
        returns (bool)
    {
        return (keccak256(bytes(a)) == keccak256(bytes(b)));
    }
}

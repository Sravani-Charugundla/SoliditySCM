//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract major{
    string[][] public key_val_pairs;
    string[][] public my1DArray;
    string[][]  public acptord;
    string[][] public cacptord;
    string[][] public divtoun;
    string[][] public adivtoun;
    string[][] public unitaccpt;
    string[][] public allunitaccpt;
    string[][] public stoasc;
    string [][] public stasc;


    function save(string[][] memory a) public{
        key_val_pairs=a;
        
        for (uint i = 0; i < key_val_pairs.length; i++) {
            
                my1DArray.push(key_val_pairs[i]); // Push the element into the 1D array
               
        }
    }
    function get_pairs() public view returns(string [][] memory){
        return key_val_pairs;
    }
     function display1DArray() public view returns (string[][] memory) {
        return my1DArray;
    }
    //this is used to send the requests to other ADST UNITS
    function acptorders(string[][] memory d) public{
    acptord = d;
    for (uint j = 0; j < acptord.length; j++) {
        cacptord.push(acptord[j]); // Push the element into the 1D array           
    }
  }
    function get_acpt_ord() public view returns (string[][] memory){
    
        return acptord;
    }
    function acpt_displayord() public view returns (string[][] memory) {
            return cacptord;
    }
    function dtu(string[][] memory du)public
    {
        divtoun = du;
        for(uint k = 0;k < divtoun.length; k++)
        {
            adivtoun.push(divtoun[k]);
        }
    }
    //sending one divison to another divison
    function d_tu() public view returns (string[][] memory)
    {
        return adivtoun;
    }
    function acptbyUnits(string[][] memory acptun)public
    {
        unitaccpt = acptun;
        for(uint k = 0;k < divtoun.length; k++)
        {
            allunitaccpt.push(unitaccpt[k]);
        }
    }
    //requests accepted by units
    function showacceptedbyunits() public view returns (string[][] memory)
    {
        return allunitaccpt;
    }
    //requests sent to ASC
    function toAsc(string [][] memory asc)public
    {
        stasc = asc;
        for(uint k = 0;k<stasc.length;k++)
        {
            stoasc.push(stasc[k]);
        }
    }
    function showtoasc()public view returns(string [][] memory)
    {
        return stoasc;
    }
    
    

} 

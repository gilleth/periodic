#!/bin/bash
# provide information about a given atomic_number
#get atomic number
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
    
    INPUT=$1
    CHECKA=false
    if  [[ -z $1 ]]
        then
        echo Please provide an element as an argument.
        CHECKA=true
    fi
    
    if [[ $INPUT -ge 1  ]]  && [[ $INPUT -le 9 ]] 
       then 
       NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $INPUT;")
       SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $INPUT;")
       TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties USING (type_id) WHERE atomic_number = $INPUT;")
       MASS=$($PSQL "SELECT atomic_mass FROM properties INNER JOIN elements USING (atomic_number) WHERE atomic_number = $INPUT;")
       MELTING=$($PSQL "SELECT melting_point_celsius FROM properties INNER JOIN elements USING (atomic_number) WHERE atomic_number = $INPUT;")
       BOILING=$($PSQL "SELECT boiling_point_celsius FROM properties INNER JOIN elements USING (atomic_number) WHERE atomic_number = $INPUT;")
       echo "The element with atomic number $INPUT is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
       CHECKB=true
       else
       CHECKB=false
    fi 
     
    if [[ $INPUT = 'Hydrogen' || $INPUT == 'Beryllium' || $INPUT == 'Boron' || $INPUT == 'Carbon' || $INPUT == 'Nitrogen' ||  $INPUT == 'Oxygen' || $INPUT == 'Fluorine' || $INPUT == 'Neon' || $INPUT == 'Helium' || $INPUT == 'Lithium' ]]
        then
        NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$INPUT';")
        SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name = '$INPUT';")
        TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties USING (type_id) WHERE atomic_number = $NUMBER;")
        MASS=$($PSQL "SELECT atomic_mass FROM properties INNER JOIN elements USING (atomic_number) WHERE name = '$INPUT';")
        MELTING=$($PSQL "SELECT melting_point_celsius FROM properties INNER JOIN elements USING (atomic_number) WHERE name = '$INPUT';")
        BOILING=$($PSQL "SELECT boiling_point_celsius FROM properties INNER JOIN elements USING (atomic_number) WHERE name = '$INPUT';")
        echo "The element with atomic number $NUMBER is $INPUT ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $INPUT has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
        CHECKC=true
        else
        CHECKC=false
    fi
    if [[ $INPUT = 'H' || $INPUT == 'Be' || $INPUT == 'B' || $INPUT == 'C' || $INPUT == 'N' ||  $INPUT == 'O' || $INPUT == 'F' || $INPUT == 'Ne' || $INPUT == 'He' || $INPUT == 'Li' ]]
        then
        NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$INPUT';")
        NAME=$($PSQL "SELECT name FROM elements WHERE symbol = '$INPUT';")
        TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties USING (type_id) WHERE atomic_number = $NUMBER;")
        MASS=$($PSQL "SELECT atomic_mass FROM properties INNER JOIN elements USING (atomic_number) WHERE symbol = '$INPUT';")
        MELTING=$($PSQL "SELECT melting_point_celsius FROM properties INNER JOIN elements USING (atomic_number) WHERE symbol = '$INPUT';")
        BOILING=$($PSQL "SELECT boiling_point_celsius FROM properties INNER JOIN elements USING (atomic_number) WHERE symbol = '$INPUT';")
        echo "The element with atomic number $NUMBER is $NAME ($INPUT). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
        CHECKD=true
        else
        CHECKD=false
    
        
        if [[ $CHECKA = false && $CHECKB = false && $CHECKC = false && $CHECKD == false ]] 
        then
            echo I could not find that element in the database.
        fi
        
  fi      
 

          

          
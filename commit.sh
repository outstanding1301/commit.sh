#!/bin/bash
# commit <subject>

function commit {
    return $1
}

if [ $# == 1 ]
    then
        echo "subject : $1"
    else
        echo "no subject"
fi
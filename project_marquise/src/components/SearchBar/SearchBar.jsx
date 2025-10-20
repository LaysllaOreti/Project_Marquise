import React from "react";
import { FiSearch } from "react-icons/fi";
import '../SearchBar/SearchBar.css';

export default function SearchBar(){
    return(
        <div className="searchContainer">
        <FiSearch className="searchIcon" />
        <input type="text" placeholder="Search movies..." />
        </div>
    )
}
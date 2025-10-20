import React from "react";
import { Link, NavLink } from "react-router-dom";
import '../Navbar/Navbar.css';
import SearchBar from "../SearchBar/SearchBar";

export default function Navbar() {
  return (
    <header className="navbar">
      {/* Logo */}
      <div className="navbarLeft">
        <Link to="/home">
          <span className="logo">Marquise</span>
        </Link>
      </div>

      {/* Menu central */}
      <nav className="navbarCenter">
        <NavLink to="/movies" className="navItem">
          <span className="spanNavbar">Filmes</span>
        </NavLink>
        <NavLink to="/add" className="navItem">
          <span className="spanNavbar">Adicionar Filmes</span>
        </NavLink>
        <NavLink to="/users" className="navItem">
          <span className="spanNavbar">Usuários</span>
        </NavLink>
      </nav>

      {/* Search fixo */}
      <div className="navbarRight">
        <SearchBar />
      </div>
    </header>
  );
}

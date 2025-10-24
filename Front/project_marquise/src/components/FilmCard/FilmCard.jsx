import React from "react";
import '../FilmCard/FilmCard.css';

export default function FilmCard({ filme }) {
    return (
        <div className="movieCard">
            <img src={filme.poster} alt={filme.title} className="moviePoster" />
            <div className="movieInfo">
                <h2>{filme.title}</h2>
                <p>{filme.genre} | {filme.year}</p>
                <button className="detailsBtn">View Details</button>
            </div>
        </div>
    );
}

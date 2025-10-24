import React from "react";
import '../styles/Home.css';
import Navbar from "../components/Navbar/Navbar";
import FilmCard from '../components/FilmCard/FilmCard';

// substituir pelo CRUD real
const movies = [
    {
        id: 1,
        title: "O Silêncio dos Inocentes",
        year: 1991,
        genre: "Terror",
        poster: "https://aventurasnahistoria.com.br/wp-content/uploads/hard_news/indndn.jpg"
    },
    {
        id: 2,
        title: "A Bela e a Fera",
        year: 2017,
        genre: "Fantasia",
        poster: "https://saopauloparacriancas.com.br/wp-content/uploads/2017/02/A-BELA-E-A-FERA-O-FILME-2.jpg"
    },
    {
        id: 3,
        title: "Interstellar",
        year: 2014,
        genre: "Ficção Científica",
        poster: "https://cdn.universoracionalista.org/wp-content/uploads/2020/06/interestelar-capa.jpeg"
    },
];

export default function Home() {
    return (
        <>
            <Navbar />
            <div className="homeContainer">
                <h1 className="homeTitle">Catálogo de Filmes</h1>
                <div className="movieGrid">
                    {movies.map(movie => (
                        <FilmCard key={movie.id} filme={movie} />
                    ))}
                </div>
            </div>
        </>
    );
}

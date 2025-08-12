import React from "react";
 
const Search = ({termSearch, setTermSearch}) => {
    return (
        <div className=/*"Search"*/"text-white text-3xl items-center flex gap-3 px-4 py-2 max-w-md mx-auto mb-8">
            <img src="busca.svg" alt="Search"/>
            <input className="text-white bg-transparent border-b-2 border-white focus:outline-none focus:border-indigo-600"
                type="text"
                placeholder="Busque em milhares de filmes"
                value={termSearch}
                onChange={(event) => setTermSearch(event.target.value)}
            />
        </div>
        //<div className="text-white text-3xl">Buscar</div>
    )
}
export default Search;
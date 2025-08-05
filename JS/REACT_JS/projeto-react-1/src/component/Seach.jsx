import React from "react";
 
const Seach = ({termSeach, setTermSeach}) => {
    return (
        <div className="text-white text-3xl items-center flex gap-3 px-4 py-2 max-w-md mx-auto mb-8">
            <img src="busca.svg" alt="Seach"/>
            <input className="text-white bg-transparent border-b-2 border-white focus:outline-none focus:border-indigo-600"
                type="text"
                placeholder="Busque em milhares de filmes"
                value={termSeach}
                onChange={(evento) => setTermSeach(evento.target.value)}
            />
        </div>
        //<div className="text-white text-3xl">Buscar</div>
    )
}
export default Seach;
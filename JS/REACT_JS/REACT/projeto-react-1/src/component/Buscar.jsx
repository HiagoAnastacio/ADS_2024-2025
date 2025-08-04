import React from "react";
 
const Buscar = ({termoBusca, setTermoBusca}) => {
    return (
        <div className="text-white text-3xl">
            <img src="busca.svg" alt="buscar"/>
            <input
                type="text"
                placeholder="Buscar em milhares de filmes"
                value={termoBusca}
                onChange={(evento) => setTermoBusca(evento.target.value)}
            />
        </div>
        //<div className="text-white text-3xl">Buscar</div>
    )
}
export default Buscar;
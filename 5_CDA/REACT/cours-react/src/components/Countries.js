import React, { useEffect, useState } from 'react';
import axios from "axios";
import Cards from './Cards';

const Countries = () => {
    const [data, setData] = useState([]);
    const [rangeValue, setRangeValue] = useState(36);
    // le useEffect se joue lorsque le composant est appelé
    useEffect(() => {
        axios //  remplace le fetch
            .get("https://restcountries.com/v3.1/all") // adresse de l'api
            .then((res) => setData(res.data));
    }, []);

    return (
        <div className="countries">
        <ul className="radio-container"></ul>
              <input 
                type="range" 
                min="1" 
                max="250" 
                defaultValue={rangeValue} 
                // onChange={(e) => console.log(e.target.value)}
                onChange={(e) => setRangeValue(e.target.value)}
              />
            <ul>
                {data
                .slice(0, rangeValue)
                .map((country, index) => (
                    <Cards key={index} country = {country} />
                ))}
            </ul>
        </div>
    );
};

export default Countries;
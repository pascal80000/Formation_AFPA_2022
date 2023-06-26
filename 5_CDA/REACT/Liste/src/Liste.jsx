import React, { useState, useEffect } from 'react'
import './Liste.css'

function Liste() {

  const [articles, setArticles] = useState([]);

  const addArticle = (event) => {
    event.preventDefault();
    const newArticle = event.target.article.value.trim();
    if (newArticle !== '') {
      setArticles([...articles, newArticle]);
      event.target.article.value = '';
    }
  };

  const delArticles = (event) => {
    event.preventDefault();
    setArticles('');
  }


  return (

      <div class="maListe">
            <fieldset>
            <div class="titre">
              <h2>Liste de courses</h2>
            </div>
            </fieldset>
            <fieldset>

              <div class="boutons">
                  <form onSubmit={addArticle}>

                    <div class="saisie">
                      <input type="text" name="article" placeholder='Entrer un article' />
                    </div>
                  <button class="ok ml-5 " type="submit">Ajouter</button>
                  </form>

                  <form onAbort={delArticles}>
                    <button class="ko" type="submit">Vider la liste</button>
                  </form>
              </div>
              </fieldset>


              <div class="items">
                <fieldset>
                  <legend>ARTICLES</legend>
                <ul>
                  {articles.map((articles, index) => (
                    <li key={index}>{articles}</li>
                  ))}
                </ul>

                </fieldset>
              </div>
      </div>

  );
  }


export default Liste;


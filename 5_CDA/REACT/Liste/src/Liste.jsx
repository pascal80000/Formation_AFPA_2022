import React, { useState } from 'react'
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
      <div class="titre">
        <h2>Liste de courses</h2>
      </div>

        <div class="boutons">
        <form onSubmit={addArticle}>
          <input type="text" name="article" placeholder='Entrer un article' />
          <button class="ok" type="submit">Ajouter</button>
        </form>

        <form onAbort={delArticles}>
          <button class="ko" type="submit">Vider la liste</button>
        </form>
        </div>

        <div class="items">
          <ul>
            {articles.map((articles, index) => (
              <li key={index}>{articles}</li>
            ))}
          </ul>
        </div>
    </div>
  );
  }




export default Liste;


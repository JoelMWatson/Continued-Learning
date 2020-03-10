import React from "react";
import unsplash from "../api/unplash";

import SearchBar from "./SearchBar";
import ImagesList from "./ImageList";

class App extends React.Component {
  state = { images: [] };

  onSearchSubmit = async term => {
    const response = await unsplash.get("/search/photos", {
      params: { query: term }
    });
    this.setState({ images: response.data.results });
  };

  render() {
    return (
      <div className="ui contianer" style={{ marginTop: "10px" }}>
        <SearchBar onSubmit={this.onSearchSubmit} />
        <ImagesList images={this.state.images} />
      </div>
    );
  }
}

export default App;

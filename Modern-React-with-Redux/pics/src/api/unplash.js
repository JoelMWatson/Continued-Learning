import axios from "axios";

export default axios.create({
  baseURL: "https://api.unsplash.com/",
  headers: {
    Authorization: "Client-ID FU4ywuemMxdJPPgjzuTmU3tMgBwuviMWz4OCeYSsN6g"
  }
});
